export EDITOR='vim'

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/jacob/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/Users/jacob/Library/Python/3.7/bin:$PATH"
export PATH="/Users/jacob/.local/bin:$PATH"

# kube/docker
export KUBECONFIG=$HOME/.kube/personal:$HOME/.kube/config
export TILLER_NAMESPACE=tiller
export AWS_SDK_LOAD_CONFIG=1
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_CLI_EXPERIMENTAL=enabled

# FLAGS
export CFLAGS="-I/usr/local/opt/openssl@1.1/include"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"

# bin options
export LS_OPTIONS='--color=auto'
export LSCOLORS=''
export CLICOLOR='Yes'
export PYTHONUNBUFFERED=true
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -p ~/.ignore -g ""'


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
source $HOME/.zsh/creds.sh
