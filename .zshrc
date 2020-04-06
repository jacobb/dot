export EDITOR='vim'
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

if which pyenv-virtualenv-init > /dev/null; then
    eval "$(eval "$(pyenv init -)"; pyenv virtualenv-init -)"
    pyenv global 3.7.6 2.7.14
fi

# autocompletes
# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# The next line enables shell command completion for gcloud.
# if [ -f '/Users/jacob/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jacob/google-cloud-sdk/completion.zsh.inc'; fi

# includes
source $HOME/scripts/aliases.sh
source $HOME/scripts/prompt.sh
