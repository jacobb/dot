" status config
set laststatus=2
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
" let g:lightline#ale#indicator_warnings = "\uf071  "
let g:lightline#ale#indicator_warnings = "\uf071  "
let g:lightline#ale#indicator_errors = "\uf05e  "
" let g:lightline#ale#indicator_ok = "\uf00c "
let g:lightline#ale#indicator_ok = "🐶 "


let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste', 'mymod' ],
            \             [ 'readonly', 'filename'] ],
            \ 'right': [[
            \ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok',
            \ 'lineinfo', 'percent', 'fileformat', 'fileencoding', 'filetype'
            \ ]],
            \ },
            \ 'component_type': {
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'mymod': 'error',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'colorscheme': 'gruvbox',
            \ 'component_expand': {
            \  'linter_checking': 'lightline#ale#checking',
            \  'linter_infos': 'lightline#ale#infos',
            \  'linter_warnings': 'lightline#ale#warnings',
            \  'linter_errors': 'lightline#ale#errors',
            \  'linter_ok': 'lightline#ale#ok',
            \  'mymod': 'MyModified',
            \ },
            \ 'component_function': {
            \  'filename': 'FilenameForLightline',
            \  'filetype': 'MyFiletype',
            \  'fileformat': 'MyFileformat',
            \ },
            \ }
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

function! MyModified()
    return &mod ? "+" : ''
endfunction
