# My awesome bash prompt
#
# Copyright (c) 2012 "Cowboy" Ben Alman
# Licensed under the MIT license.
# http://benalman.com/about/license/
#
# Example:
# [master:!?][cowboy@CowBook:~/.dotfiles]
# [11:14:45] $
#
# Read more (and see a screenshot) in the "Prompt" section of
# https://github.com/cowboy/dotfiles

# ANSI CODES - SEPARATE MULTIPLE VALUES WITH ;
#
#  0  reset          4  underline
#  1  bold           7  inverse
#
# FG  BG  COLOR     FG  BG  COLOR
# 30  40  black     34  44  blue
# 31  41  red       35  45  magenta
# 32  42  green     36  46  cyan
# 33  43  yellow    37  47  white

if [[ ! "${prompt_colors[@]}" ]]; then
  prompt_colors=(
    "36" # information color
    "37" # bracket color
    "31" # error color
    "38;5;42" # information color
    "38;5;69" # color
  )

  if [[ "$SSH_TTY" ]]; then
    # connected via ssh
    prompt_colors[0]="33"
  fi
  
  if [[ ${EUID} == 0 ]] ; then
      prompt_colors[3]='31'
  fi
fi

# Inside a prompt function, run this alias to setup local $c0-$c9 color vars.
alias prompt_getcolors='prompt_colors[9]=; local i; for i in ${!prompt_colors[@]}; do local c$i="\[\e[01;${prompt_colors[$i]}m\]"; done; c9="\[\e[0;38m\]"'

# Exit code of previous command.
function prompt_exitcode() {
  prompt_getcolors
  [[ $1 != 0 ]] && echo " $c2$1$c9"
}

function preprompt() {
    prompt_getcolors

    # [user@host:directory]
    echo "\n$c1[$c3\u$c1@$c3\h$c1:$c4\w$c1]$c9"

    # [time]
    echo "$c1[$c3$(date +"%H$c1:$c3%M$c1:$c3%S")$c1]$c9"
}

function gitprompt() {
    local ec=$?

    __git_ps1 "$(preprompt)" "$(prompt_exitcode "$ec") \[\e[01;38;5;69m\]\\\$\[\e[0;38m\] "
}

# start out with all options set
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true

function prompt_command() {
    unset PROMPT_COMMAND
    PROMPT_COMMAND="gitprompt"
}

function unprompt_command() {
    unset PROMPT_COMMAND

    unset GIT_PS1_SHOWDIRTYSTATE
    unset GIT_PS1_SHOWSTASHSTATE
    unset GIT_PS1_SHOWUNTRACKEDFILES
    unset GIT_PS1_SHOWCOLORHINTS

    PROMPT_COMMAND="gitprompt"
}

alias prompt='prompt_command'
alias unprompt='unprompt_command'

PROMPT_COMMAND="gitprompt"

