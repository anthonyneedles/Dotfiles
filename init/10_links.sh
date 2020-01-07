#==============================================================================
#
#   10_links.sh from https://github.com/anthonyneedles/dotfiles
#
#   Make symbolic links from ~ to our dotfiles folder
#
#=============================================================================

tolink=(
  "bash/.bashrc"
  "bash/.bash_profile"
  "bash/.dircolors"
  "tmux/.tmux.conf"
  "vim/.vimrc"
  "git/.gitignore_global"
  "git/.gitconfig"
  "git/.git-template"
)

linkem () {
  for link in ${tolink[@]}; do
    local file=${link##*/}

    if [[ -e ~/$file ]]; then
      if [[ -L ~/$file ]]; then
        rm ~/$file
      else
	      local newfile=$file-"$(date +%Y-%m-%d_%H_%M_%S)"
	      mv ~/$file $DOTFILES/backups/$newfile && echo "Existing '~/$file' moved to '$DOTFILES/backups/'"
      fi
    fi
    ln -s $DOTFILES/$link ~/$file && echo "Added link from '~/$file' to '$DOTFILES/$link'"
  done
}

echo_header "Adding Links"
linkem
