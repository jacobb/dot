export EDITOR='vim'
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/jacob/bin:$PATH"
export PATH="/usr/local/lib/google-cloud-sdk/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/Users/jacob/Library/Python/3.7/bin:$PATH"

export KUBECONFIG=$HOME/.kube/personal:$HOME/.kube/config
export TILLER_NAMESPACE=tiller
export AWS_SDK_LOAD_CONFIG=1
export DOCKER_BUILDKIT=1

# FLAGS
export CFLAGS="-I/usr/local/opt/openssl@1.1/include"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"

# bin options
export LS_OPTIONS='--color=auto'
export LSCOLORS=''
export CLICOLOR='Yes'
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude=.git'
export PYTHONUNBUFFERED=true
export FZF_DEFAULT_COMMAND='ag -g ""'

# keybindings
# export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig/
# disable XON so i can use ctrl+s in applications
# stty -ixon
bindkey -e
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

# History settings
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY       # include timestamps/etc in history
setopt APPEND_HISTORY         # append (instead of overwriting) history
setopt SHARE_HISTORY          # share history between shells
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


# Lazy load pyenv
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

# autocompletes
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
# autoload -U +X bashcompinit && bashcompinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# The next line enables shell command completion for gcloud.

# includes
source $HOME/.zsh/aliases.sh
source $HOME/.zsh/prompt.sh
