nnoremap <silent> <leader>ss :call MarkdownClipboardImage()<cr>
nnoremap <silent> <BS> :call NextFileWee()<cr>
nnoremap <silent> <leader>id :r !date "+[\%H:\%M]"<cr> f[l
iab curtim [<C-r>=strftime('%H:%M')<CR>]

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

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

setlocal textwidth=80

let g:pandoc#syntax#codeblocks#embeds#langs = ['bash', 'python', 'css', 'javascript', 'js=javascript', 'json=javascript', 'sass', 'html', 'sh=bash', 'rust']
