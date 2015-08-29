# from gary bernhardt:
# https://github.com/garybernhardt/dotfiles/blob/master/.offlineimap.py

import os


def get_keychain_password(key):
    cmd = "/usr/bin/security 2>&1 >/dev/null find-generic-password -a %s -g" % key
    line = os.popen(cmd).readline()
    passwds = line.split()
    if len(passwds) == 2:
        return passwds[1][1:-1]
    else:
        return ""


def get_imap_password():
    return get_keychain_password("fastmail")


def get_imap_email():
    return get_keychain_password("fastmail-user")
