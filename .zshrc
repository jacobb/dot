export EDITOR='vim'

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/jacob/bin:$PATH"

# FLAGS
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"
# bin options
export LS_OPTIONS='--color=auto'
export LSCOLORS=''
export CLICOLOR='Yes'
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude=.git'
export PYTHONUNBUFFERED=true
export CLASSPATH=/Automation/lib/testng-6.11.jar:/Automation/lib/*:.
export GDAL_LIBRARY_PATH="/Library/Frameworks/GDAL.framework/Versions/1.11/GDAL"
export GEOS_LIBRARY_PATH="/Library/Frameworks/GEOS.framework/Versions/3/GEOS"

# bindkey "^[[3~" delete-char
# bindkey "^[3;5-" delete-char


bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey -e
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

# number of lines kept in history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.history
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
export WORKON_HOME=$HOME/.virtualenvs
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias pa='pyenv activate'

# Prompt
source ~/scripts/prompt.sh


# use emacs terminal control because muscle memory
bindkey -e
# disable XON so i can use ctrl+s in applications
stty -ixon
export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig/

export FZF_DEFAULT_COMMAND='ag -g ""'


export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(direnv hook zsh)"

function colors() { for C in {0..255}; do echo -en "\e[${C}m$C " ; done }
eval "$(thefuck --alias)"
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jacob/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jacob/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jacob/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jacob/lib/google-cloud-sdk/completion.zsh.inc'; fi
