let g:python_highlight_all = 0
let b:ale_echo_cursor = 0

let b:ale_fixers = {'python': ['ruff', 'black']}
let b:ale_linters = {'python': ['ruff', 'pylsp']}
let b:ale_completion_enabled = 1
let g:ale_hover_to_floating_preview = 1

" let g:ale_python_pylsp_options = "-v --log-file /Users/jacob/lsp.log"
let g:ale_python_pylsp_config = {
      \   'pylsp': {
      \     'plugins': {
      \         'definition': {
      \             'follow_imports': v:true
      \         }
      \     },
      \   }
      \ }
