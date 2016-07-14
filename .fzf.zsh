# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jacob/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jacob/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/jacob/.fzf/man* && -d "/Users/jacob/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/jacob/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jacob/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jacob/.fzf/shell/key-bindings.zsh"

