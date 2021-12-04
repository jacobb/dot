" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
let b:ale_linters = ['prettier', 'eslint']
set tabstop=2
set softtabstop=2
set shiftwidth=2
let b:ale_javascript_eslint_options = '--cache'
