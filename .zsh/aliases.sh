# functions
function super_clear() {
    for i in {1..40}
        do
            echo "\n";
        done
    clear
}

function load_google_trash() {
    source <(kubectl completion zsh)
    source /Users/jacob/google-cloud-sdk/completion.zsh.inc
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
alias pa='pyenv activate'
alias kc='load_google_trash'
