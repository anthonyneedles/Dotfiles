#==============================================================================
#
#   misc.sh from https://github.com/anthonyneedles/dotfiles
#
#   Set various bash options
#
#=============================================================================

# Only for Debian systems
is_debian || return 1

# Section: APT {{{1

alias update="sudo apt-get update && sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias search="apt-cache search"

# }}}1
