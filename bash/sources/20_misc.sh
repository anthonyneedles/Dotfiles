#==============================================================================
#
#   misc.sh from https://github.com/anthonyneedles/dotfiles
#   
#   Set various bash options 
#
#=============================================================================

# Section: General {{{1

alias tmux='tmux -2' 				  # 256 colors for tmux

alias q="vim"

alias grep="grep --color=auto"

shopt -s nocaseglob				    # case-insensitive pathname expansion

# }}}1
# Section: Files {{{1

# Source our .dircolors for ls colors
eval $( dircolors -b $DOTFILES/bash/.dircolors )

alias ls="ls --color"				  # colors for our ls-ing
alias la='ls -Al' 				    # list hidden files
alias ll="ls -Al --group-directories-first" 	# neatly list hidden files
alias lr='ls -lR' 				    # recursive list
alias lx='ls -lXB' 				    # sort by extension 

# }}}1
# Section: Git {{{1

alias gl="git log --color --graph --pretty=format:'%C(yellow)%h%Creset -%C(bold red)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias gg='git log --decorate --oneline --graph --date-order --all'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'

# }}}1
# Section: APT {{{1

alias update="sudo apt-get update && sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias search="apt-cache search"

# }}}1 
