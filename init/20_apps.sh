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

# install TPM and all TPM plugins defined in .tmux.conf
echo "Installing Tmux Plugin Manager and plugins..."
if [[ ! -d $DOTFILES/tmux/plugins/tpm ]]; then
    git clone -q https://github.com/tmux-plugins/tpm $DOTFILES/tmux/plugins/tpm
fi
$DOTFILES/tmux/plugins/tpm/bin/install_plugins && \
    echo "Tmux plugins installed/upgraded (any running Tmux sessions need to re-source)" || \
    echo "Tmux plugins installation failed"

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
