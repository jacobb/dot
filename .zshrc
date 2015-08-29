export EDITOR='vim'

# PATH
export PATH="/Users/jacob/bin/arcanist/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/jacob/bin:$PATH"

# bin options
export LS_OPTIONS='--color=auto'
export LSCOLORS=''
export CLICOLOR='Yes'
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude=.git'
export PYTHONUNBUFFERED=true

# bindkey "^[[3~" delete-char
# bindkey "^[3;5-" delete-char

# number of lines kept in history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.history

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

zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*?.pyc' \
zstyle ':completion::complete:*:vim:*' ignored-patterns '*.pyc'
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source virtualenvwrapper.sh

source .zsh/prompt.sh

# use emacs terminal control because muscle memory
bindkey -e
# disable XON so i can use ctrl+s in applications
stty -ixon
