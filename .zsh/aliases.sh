# functions
function super_clear() {
    for i in {1..40}
        do
            echo "\n";
        done
    clear
}

function load_google_trash() {
    alias k='kubectl'
    export PATH=$PATH:$HOME/lib/google-cloud-sdk/bin

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/jacob/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jacob/bin/google-cloud-sdk/path.zsh.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/jacob/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jacob/bin/google-cloud-sdk/completion.zsh.inc'; fi
}
alias kc='load_google_trash'

function load_pyenv() {
    export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
    if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
        export PATH="${PYENV_ROOT}/bin:${PATH}"
    fi
    if type pyenv > /dev/null; then
        export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
        function pyenv() {
            unset -f pyenv
            eval "$(command pyenv init -)"
            eval "$(command pyenv virtualenv-init -)"
            pyenv $@
        }
    fi
}
alias pe='load_pyenv'

function load_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}
alias lnvm='load_nvm'

function rmd () {
  pandoc $1 | lynx -stdin -vikeys
}

# aliases
alias l='ls -l'
alias ll='ls -la'
alias pjson='python -m json.tool'
alias cl='super_clear'
alias diepyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias flushdns='sudo killall -INFO mDNSResponder'
alias ymp3='youtube-dl --audio-quality=300k --extract-audio --audio-format=mp3'
alias d='docker'
alias dc='docker-compose'
alias pa='pyenv activate'
alias t='tmux new-session -A -s main'
alias tp='tmux new-session -A -s personal'
alias url='urlview'
alias copysshkey='cat ~/.ssh/id_rsa.pub|pbcopy'

alias did="vim +'normal Go' +'r!date' ~/notes/did.txt"
alias gr='cd $(git rev-parse --show-toplevel)'

alias tmuxmenu='tmux display-menu "split vertical" v "split -v" "split horizontal" h "split -h"'

alias vw='vim -c VimwikiIndex'
alias vwd='vim -c VimwikiMakeDiaryNote'

alias cat='bat'
alias j='just'

alias bad_docker_volumes='comm -2 -3 <(docker volume ls -q | sort) <(docker volume ls -q -f name=postgres -f name=search| sort)'
