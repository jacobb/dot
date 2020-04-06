export EDITOR='vim'

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/jacob/bin:$PATH"
export PATH="/Users/jacob/go/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec

export KUBECONFIG=$HOME/.kube/personal:$HOME/.kube/config
export TILLER_NAMESPACE=tiller
export AWS_SDK_LOAD_CONFIG=1

# FLAGS
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"
# bin options
export LS_OPTIONS='--color=auto'
export LSCOLORS=''
export CLICOLOR='Yes'
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude=.git'
export PYTHONUNBUFFERED=true

# bindkey "^[[3~" delete-char
# bindkey "^[3;5-" delete-char


bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey -e
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

# History settings
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY       # include timestamps/etc in history
setopt APPEND_HISTORY         # append (instead of overwriting) history
setopt SHARE_HISTORY          # share history between shells

fpath=(/usr/local/share/zsh/site-functions $fpath)

# functions
function super_clear() {
    for i in {1..40}
        do
            echo "\n";
        done
    clear
}

# aliases
alias l='ls -l'
alias ll='ls -la'
alias pjson='python -m json.tool'

alias cl='super_clear'
alias diepyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias flushdns='sudo killall -INFO mDNSResponder'
alias ymp3='youtube-dl --audio-quality=300k --extract-audio --audio-format=mp3'
alias dc='docker-compose'

zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*?.pyc' \
zstyle ':completion::complete:*:vim:*' ignored-patterns '*.pyc'
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}

# virtualenv
#
#
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
    eval "$(eval "$(pyenv init -)"; pyenv virtualenv-init -)"
fi

alias pa='pyenv activate'
pyenv global 3.7.6 2.7.14

# Prompt
source ~/scripts/prompt.sh

# use emacs terminal control because muscle memory
bindkey -e
# disable XON so i can use ctrl+s in applications
stty -ixon
export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig/

export FZF_DEFAULT_COMMAND='ag -g ""'

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# The next line enables shell command completion for gcloud.
if [ -f '/Users/jacob/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jacob/google-cloud-sdk/completion.zsh.inc'; fi
