# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jacob/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jacob/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jacob/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/jacob/.fzf/shell/key-bindings.bash"

