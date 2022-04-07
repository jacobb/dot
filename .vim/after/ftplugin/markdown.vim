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
