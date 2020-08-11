#==============================================================================
#
#   20_apps.sh from https://github.com/anthonyneedles/dotfiles
#
#   Initialize apps like tmux, vim, git, and bash
#
#=============================================================================

echo_header "Initializing Applications"

# locate git ignore
git config --global core.excludesfile ~/.gitignore_global && \
    echo "Added Git global ignore"

# install Vim Plug and plugs
echo "Installing Vim Plug and plugins..."
if [[ ! -f $DOTFILES/vim/autoload/plug.vim ]]; then
  curl -sfLo $DOTFILES/vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim -c "PlugInstall --sync" -c "qa" && \
    echo "Vim plugins installed/upgraded (any running Vim sessions need to re-source)" || \
    echo "Vim plugins installation failed"

# source our shiney new bash
source ~/.bashrc && \
    echo "Bash sources sourced"
