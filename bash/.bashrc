#==============================================================================
#
#   .bash_rc from https://github.com/anthonyneedles/dotfiles
#
#   Sources bash configs
#
#=============================================================================

export DOTFILES=~/.dotfiles

# Add binaries into the path
PATH=$DOTFILES/bin:$PATH
export PATH

# Source all files in ".dotfiles/sources"
function src() {
  local file
  for file in $DOTFILES/bash/sources/*; do
    source "$file"
  done
}

# Copy the git completion script to the init directory
if [ ! -f "$DOTFILES/bash/sources/00_git-prompt.sh" ]; then
    cd $DOTFILES/bash/sources/ && wget -q "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" \
    -O $DOTFILES/bash/sources/00_git-prompt.sh
fi

src
