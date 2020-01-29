#==============================================================================
#
#   00_apt-packages.sh from https://github.com/anthonyneedles/dotfiles
#
#   Update and install Aptitude packages
#
#=============================================================================

# Only for Debian systems
is_debian || return 1

echo_header "Updating APT"
sudo apt-get -qq update && echo "APT updated"
sudo apt-get -qq upgrade  && echo "APT upgraded"

# Packages to install
packages=(
  vim
  build-essential
  git
  tmux
  cmake
  ninja-build
  curl
  exuberant-ctags
)

echo_header "Installing APT packages: "${packages[@]}""
for package in "${packages[@]}"; do
  PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $package | grep "install ok installed")
  if [ "" == "$PKG_OK" ]; then
    echo "Installing $package..."
    sudo apt-get -qq install "$package" >/dev/null && \
        echo "$package installed"
  else
    echo "Already installed $package"
  fi
done
