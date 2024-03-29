#! /usr/bin/env python

# Take an mbox HTML message (e.g. from mutt), split it
# and rewrite it so it can be viewed in an external browser.
# Can be run from within a mailer like mutt, or independently
# on a single message file.
#
# Usage: viewhtmlmail
#
# Inspired by John Eikenberry <jae@zhar.net>'s view_html_mail.sh
# which sadly no longer works, at least with mail from current Apple Mail.
#
# Copyright 2013-2018 by Akkana Peck. Share and enjoy under the GPL v2 or later.
# Changes:
#   Holger Klawitter 2014: create a secure temp file and avoid temp mbox
#   Antonio Terceiro 2018: Allow piping directly from mutt.

# To use it from mutt, put the following lines in your .muttrc:
# macro  index  <F10>  "<pipe-message>~/bin/viewhtmlmail\n" "View HTML in browser"
# macro  pager  <F10>  "<pipe-message>~/bin/viewhtmlmail\n" "View HTML in browser"

# TESTING: Use the email file in test/files/htmlmail.eml.

import os
import sys
import re
import email
import mimetypes
import subprocess


def find_first_maildir_file(maildir):
    """Maildir: inside /tmp/mutttmpbox, mutt creates another level of
    directory, so the file will be something like /tmp/mutttmpbox/cur/1.
    So recurse into directories until we find an actual mail file.
    Return a full path to the filename.
    """
    for root, dirs, files in os.walk(maildir):
        for f in files:
            if not f.startswith("."):
                return os.path.join(root, f)
    return None


# Sanitize a filename to make sure there's nothing dangerous,
# like ../
def sanitize_filename(badstr):
    return "".join([x for x in badstr if x.isalpha() or x.isdigit() or x in "-_."])


def view_html_message(f, tmpdir):
    print("MMM", f, tmpdir)
    if f:
        if os.path.isdir(f):
            # Maildir: f is a maildir like /tmp/mutttmpbox,
            # and inside it, for some reason, mutt creates another
            # level of directory named either cur or new
            # depending on whether the message is already marked read.
            # So we have to open the first file inside either cur or new.
            # In case mutt changes this behavior, let's take the first
            # non-dotfile inside the first non-dot directory.
            msg = None
            for maildir in os.listdir(f):
                with open(find_first_maildir_file(f)) as fp:
                    msg = email.message_from_string(fp.read())
                    break
        else:
            # Mbox format: we assume there's only one message in the mbox.
            with open(f) as fp:
                msg = email.message_from_string(fp.read())
    else:
        msg = email.message_from_string(sys.stdin.read())

    html_part = None
    counter = 1
    subfiles = []
    filenames = set()
    for part in msg.walk():
        if part.is_multipart() or part.get_content_type == "message/rfc822":
            continue

        if part.get_content_subtype() == "html":
            if html_part:
                print("Eek, more than one html part!")
            html_part = part

        # Save it to a file in the temp dir.
        filename = part.get_filename()

        if filename:
            filename = sanitize_filename(filename)
        else:
            # print("No filename; making one up")
            ext = mimetypes.guess_extension(part.get_content_type())
            if not ext:
                # Use a generic bag-of-bits extension
                ext = ".bin"
            filename = "part-%03d%s" % (counter, ext)

        # Some mailers, apparently including gmail, will attach multiple
        # images to the same mail all with the same name, like "image.png".
        # So check whether we have to uniquify the names.

        if filename in filenames:
            orig_basename, orig_ext = os.path.splitext(filename)
            counter = 0
            while filename in filenames:
                counter += 1
                filename = "%s-%d%s" % (orig_basename, counter, orig_ext)
        filenames.add(filename)
        filename = os.path.join(tmpdir, filename)

        # Mailers may use Content-Id or Content-ID (or, presumably, various
        # other capitalizations). So we can't just look it up simply.
        content_id = None
        for k in part.keys():
            if k.lower() == "content-id":
                # Remove angle brackets, if present.
                # part['Content-Id'] is unmutable -- attempts to change it
                # are just ignored -- so copy it to a local mutable string.
                content_id = part[k]
                if content_id.startswith("<") and content_id.endswith(">"):
                    content_id = content_id[1:-1]
                subfiles.append({"filename": filename, "Content-Id": content_id})
                counter += 1
                with open(filename, "wb") as fp:
                    fp.write(part.get_payload(decode=True))

                break  # no need to look at other keys

        if not content_id:
            pass
            # print("%s doesn't have a Content-Id, not saving" % filename)
            # print("keys: %s" % str(part.keys()))

    # We're done saving the parts. It's time to save the HTML part.
    htmlfile = os.path.join(tmpdir, "viewhtml.html")
    fp = open(htmlfile, "wb")

    # htmlsrc should be a string.
    # html_part.get_payload() returns string, but it's apparently
    # in straight unicode and doesn't reflect the message's charset.
    # html_part.get_payload(decode=True) returns bytes,
    # which (I think) have been decoded as far as email transfer
    # (e.g. Content-Encoding: base64), which is not the same thing
    # as charset decoding.
    # (None of this is documented in the python3 version of email;
    # there's no mention of get_payload() at all. Sigh.)

    # This works, but assumes UTF-8:
    # htmlsrc = html_part.get_payload(decode=True).decode('utf-8', "replace")

    # but it's probably better to use the system encoding:
    htmlsrc = html_part.get_payload(decode=True).decode(errors="replace")

    # Substitute all the filenames for CIDs:
    for sf in subfiles:
        # Yes, yes, I know:
        # https://stackoverflow.com/questions/1732348/regex-match-open-tags-except-xhtml-self-contained-tags/
        # but eventually this script will be integrated with viewmailattachments
        # (which uses BeautifulSoup) and that problem will go away.
        htmlsrc = re.sub(
            "cid: ?" + sf["Content-Id"],
            "file://" + sf["filename"],
            htmlsrc,
            flags=re.IGNORECASE,
        )

    fp.write(htmlsrc.encode())
    fp.close()

    # Now we have the file. Call a browser on it.
    print("Calling browser for file://%s" % htmlfile)
    subprocess.call(["open", "-a" "/Applications/Firefox.app", "file://%s" % htmlfile])
    # subprocess.call(["quickbrowse", "file://%s" % htmlfile])

    # Wait a while to make sure firefox has loaded the images, then clean up.
    # time.sleep(6)
    # shutil.rmtree(tmpdir)


if __name__ == "__main__":
    import tempfile

    tmpdir = tempfile.mkdtemp()
    if len(sys.argv) > 1:
        for f in sys.argv[1:]:
            view_html_message(f, tmpdir)
    else:
        stdin = "%s/.stdin" % tmpdir
        with open(stdin, "w") as f:
            f.write(sys.stdin.read())
        view_html_message(stdin, tmpdir)
