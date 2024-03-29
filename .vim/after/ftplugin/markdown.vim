setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

setlocal textwidth=80
setlocal indentexpr=

" setlocal columns=79
" setlocal textwidth=0
" setlocal wrap

setlocal linebreak
setlocal nolist

" r Automatically insert the current comment leader after hitting
"   <Enter> in Insert mode.
" o Automatically insert the current comment leader after hitting 'o' or
"   'O' in Normal mode.
setlocal formatoptions+=roa

" The 'comments' option is a comma-separated list of parts.
" Each part defines a type of comment string.
" A part consists of: {flags}:{string}

" {string} is the literal text that must appear.

" {flags}:
"   n Nested comment.  Nesting with mixed parts is allowed.
"   b Blank (<Space>, <Tab> or <EOL>) required after {string}.
setlocal comments=b:*,b:-,b:+,b:1.,n:>

let g:markdown_fenced_languages = ['bash', 'python', 'css', 'javascript', 'js=javascript', 'json=javascript', 'sass', 'html']

nnoremap <silent> <leader>ss :call MarkdownClipboardImage()<cr>

function! MarkdownClipboardImage() abort
  " Create `img` directory if it doesn't exist
  let img_dir = getcwd() . '/img'
  if !isdirectory(img_dir)
    silent call mkdir(img_dir)
  endif

  " First find out what filename to use
  let index = 1
  let file_path = img_dir . "/image" . index . ".png"
  while filereadable(file_path)
    let index = index + 1
    let file_path = img_dir . "/image" . index . ".png"
  endwhile

  let clip_command = 'osascript'
  let clip_command .= ' -e "set png_data to the clipboard as «class PNGf»"'
  let clip_command .= ' -e "set referenceNumber to open for access POSIX path of'
  let clip_command .= ' (POSIX file \"' . file_path . '\") with write permission"'
  let clip_command .= ' -e "write png_data to referenceNumber"'

  silent call system(clip_command)
  if v:shell_error == 1
    normal! p
  else
    execute "normal! i[](" . file_path . ")"
  endif
endfunction
