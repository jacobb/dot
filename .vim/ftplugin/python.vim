let b:ale_linters = {'python': ['pyls']}
let b:ale_fixers = {'python': ['black']}

let g:ale_python_pyls_config = {
            \   "pyls" : {
            \     "enable" : v:true,
            \     "trace" : { "server" : "verbose", },
            \     "commandPath" : "yes",
            \     "configurationSources" : [ "pycodestyle" ],
            \     "plugins" : {
            \       "jedi_completion" : { "enabled" : v:true, },
            \       "jedi_hover" : { "enabled" : v:true, },
            \       "jedi_references" : { "enabled" : v:true, },
            \       "jedi_signature_help" : { "enabled" : v:true, },
            \       "jedi_symbols" : {
            \         "enabled" : v:true,
            \         "all_scopes" : v:true,
            \       },
            \       "mccabe" : {
            \         "enabled" : v:true,
            \         "threshold" : 15,
            \       },
            \       "preload" : { "enabled" : v:true, },
            \       "pycodestyle" : { "enabled" : v:true, },
            \       "pydocstyle" : {
            \         "enabled" : v:false,
            \         "match" : "(?!test_).*\\.py",
            \         "matchDir" : "[^\\.].*",
            \       },
            \       "pyflakes" : { "enabled" : v:true, },
            \       "rope_completion" : { "enabled" : v:true, },
            \       "yapf" : { "enabled" : v:true, },
            \     }}}
