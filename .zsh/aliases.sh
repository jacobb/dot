# functions
function super_clear() {
    for i in {1..40}
        do
            echo "\n";
        done
    clear
}

function load_google_trash() {
    # pyenv shell 3.6.4 2.7.14
    source <(kubectl completion zsh)
    source /usr/local/lib/google-cloud-sdk/completion.zsh.inc
    alias k='kubectl'
    export PATH=$PATH:$HOME/lib/google-cloud-sdk/bin
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
}

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
alias kc='load_google_trash'
alias pe='load_pyenv'
alias t='tmux new-session -A -s main'
