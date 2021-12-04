let b:ale_fixers = {'typescript': ['prettier']}
let b:ale_linters = {'typescript': ['eslint', 'tsserver']}

let b:ale_javascript_prettier_options = $PRETTIER_OPTIONS
let b:ale_javascript_eslint_options = '--cache'
