# Colors
# normal
black="%{[0;30m%}"
red="%{[0;31m%}"
green="%{[0;32m%}"
yellow="%{[0;33m%}"
blue="%{[0;34m%}"
magenta="%{[0;35m%}"
cyan="%{[0;36m%}"
white="%{[0;37m%}"

# bold (grey is actually bold black)
grey="%{[01;30m%}"
bred="%{[01;31m%}"
bgreen="%{[01;32m%}"
byellow="%{[01;33m%}"
bblue="%{[01;34m%}"
bmagenta="%{[01;35m%}"
bcyan="%{[01;36m%}"
bwhite="%{[01;37m%}"

# underscore (note additive ugrey)
ublack="%{[04;30m%}"
ugrey="%{[01;04;30m%}"
ured="%{[04;31m%}"
ugreen="%{[04;32m%}"
uyellow="%{[04;33m%}"
ublue="%{[04;34m%}"
umagenta="%{[04;35m%}"
ucyan="%{[04;36m%}"
uwhite="%{[04;37m%}"

# blinking
kgrey="%{[01;05;30m%}"
kred="%{[05;31m%}"
kgreen="%{[05;32m%}"
kyellow="%{[05;33m%}"
kblue="%{[05;34m%}"
kmagenta="%{[05;35m%}"
kcyan="%{[05;36m%}"
kwhite="%{[05;37m%}"

normal="%{[0m%}"

# example of background colour
# foreground white = 37
# background red = 41
fgwhitebgred="%{[0;37;41m%}"


# Prompts
white_time_single_prompt() {
    c1=$white
    c2=$bwhite
    c3=$grey
    PROMPT="${c1}[$c3%D{%H:%M:%S}$c1]$c1($c2%n$c1@$c2%m$c1)$c1($c2%~$c1)%#$normal "
    RPROMPT=""
}

# simple prompt
simple_prompt() {
    PROMPT="$bblue(%~)%#($VIRTUAL_ENV) $normal"
    RPROMPT="$green%n@%m$normal"
}
simple_prompt
