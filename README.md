# Dotfiles

My dotfile repo for holding a bunch of configurations and new Debian/Ubuntu install inits.

1. [About This Project](#about-this-project)
1. [How to Operate](#how-to-operate)
1. [What it Does](#what-it-does)
    1. [Pre-inits](#1-pre-inits)
    1. [Update/Upgrade/Install Packages](#2-updateupgradeinstall-packages)
    1. [Make Links](#3-make-links)
    1. [Initialize Applications](#4-initialize-applications)
1. [Directories](#directories)
1. [Main Features](#main-features)
    1. [Tmux Plugins](#tmux-plugins)
    1. [Vim Plugins](#vim-plugins)
    1. [Color Schemes](#color-schemes)
    1. [Prompt](#prompt)

## About This Project

When I first started doing my developing in Linux I used Wes Edens' [dotfiles](https://github.com/wesedens/dotfiles) and [vimrc](https://github.com/wesedens/vimrc) knowing that it made many tools awesome, but without knowing how. So after a few months I finally managed to go line by line and attempt to understand what was happening under the hood. I then picked and choosed the things I found myself using, and added a couple of new things. I also restructured how the `dotfiles` command works. Finally, I arrived with good enough starting point for a git repo of my very own Dotfile initializer, which you are now viewing.

## How to Operate

*Keep in mind this only works with Debain/Ubuntu (tested with Debian 10.2 and Ubuntu 18.04)*

1. Fork this repo.
1. Run this in your terminal:

```
export GH_USER=YOUR_GITHUB_USER_NAME

bash <(wget -qO - https://raw.githubusercontent.com/$GH_USER/dotfiles/master/bin/dotfiles) && source ~/.bashrc
```

Of course replace `YOUR_GITHUB_USER_NAME` with the the username of the fork. This variable will only be used for the inital install. The resultant repo will be located in `~/.dotfiles` by default.

After this initial command, the `dotfiles` command will be used to rerun the script.

There are probably tons of things I didn't think about, and more I didn't think about to think about, but every step is echoed so you should be able to see if something messes up.

**Don't forget to change the global name/email in `~/.gitconfig` to *your* Git info!**

## What it Does

When ran, the `dotfiles` command perfoms a couple of init-inits, to ensure inits can be init-ed. It then executes a series of init scripts that actually do the bulk of the work, such as install packages, make links, configure vim/tmux/bash/git, source files, etc. After all that, you are left with a setup that should utilize everything in this repo.

### 1. Pre-inits

Along with the `DOTFILES` directory variable creation and helper function, anything is absolutely critical to the operation of this command is put in `/bin/dotfiles` before the actual initializer function is called (like cloning the repo if this is a first time install). Once called, this function will source every init script in `/init` **in order** (hence the file numbering).

### 2. Update/Upgrade/Install Packages

In `/init/00_deb-packages.sh`, we update APT's. Then, each package specified in the array will be updated/upgraded if necessary. Simple enough. Keep in mind that this occurs first due to the file name numbering system. This is only ran if the your OS was detected to be Debian-based.

### 3. Make Links

In `/init/10_links.sh`, every file/directory in the array has a symbolic link to it created in `~/`, since some are required to be there, and its nice to have some in a static user directory independant of the dotfiles repo. If this requires a file to be overwritten, the existing file is moved to `/backup` and date-time tagged.

### 4. Initialize Applications

In `/init/20_apps.sh` all of the commands that need to be ran in order to get tmux, vim, etc. up to speed with what is defined in the repo. For instance, since this repo uses plugin managers (Vim Plug and TPM) for Tmux and Vim, those will need to be installed, then told to install all of the plugins we define in the application config files.

After all of the initialization scripts are ran the enviroment should be all set up so that the only reason to run the `dotfiles` command is if the repo is updated.

## Directories

- `/backups` Any file/directory that needs to be overwritten (for links in `~/`) is backed up here.

- `/bash` Here resides all things relating with our bash, like `.bashrc`, `.bash_profile`, and a set of sources. `.dircolors`, which hold a large collection of LS colors, is also here. **99.9% of actual bash configuration is done in these sources.** Like the init sources, these are ordered as some need to be sourced before others. This keeps the .bashrc neat and simple.

- `/bin` Any executable shell scripts (only `dotfiles` now). Added to PATH.

- `/git` Here resides all things relating with our Git. This include a nice template, global ignore, and a config that ensures they are used. The template hooks generate ctags after some Git actions, and also ensure that a commit message is properly formatted.

- `/init` Discused above, this holds shell scrips that are executed as a part of the init step.

- `/tmux` Here resides all things relating with our Tmux. The `tmux.conf` here defines a list of plugins for Tmux, which are installed into `/tmux/plugins` via Tmux Plugin Manager (TPM).

- `/vim` Here resides all things relating with our Vim. The `.vimrc` here defines a list of plugins for Vim, which are installed into `/vim/plugs` via Vim Plug, which is installed into `/vim/autoload`. `/vim/temp_dirs` contains any directories for temporary files, such as undo files.

## Main Features

### Tmux Plugins

- [tmux-mem-cpu-load](https://github.com/thewtex/tmux-mem-cpu-load)

Tmux plugins can be installed by adding `set -g @plugin "PLUGIN/NAME"` to the 'Plugins' section in `/tmux/.tmux.conf/`, then press `(C-a) + I` to tell TPM to install any new plugins added to the list (Ctrl-A is the new Tmux prefix). Re-sourcing `.tmux.conf` can be done with `(C-a) + r`.

### Vim Plugins

- [ale](https://github.com/dense-analysis/ale)
- [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [expand-region](https://github.com/terryma/vim-expand-region)
- [gruvbox (current color scheme)](https://github.com/morhetz/gruvbox)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-surround](https://github.com/tpope/vim-surround)

Vim plugins can be installed by adding `Plug 'PLUGIN/NAME'` to the 'Load Plugs' section in `/vim/.vimrc`, then send the Vim command ':PlugInstall' to tell Vim Plug to install any new plugins to the list.

### Color Schemes

The colors of the Tmux status bar and bash prompt are vaguely coordinated, but can be easily edited via `/tmux/tmux.conf` and `/bash/sources/10_prompt.sh`.

The current Vim color scheme is seoul256 (with added italic comments), but adding a new theme is as easy as pluging it in and changing the colorscheme in the 'Visual' section of `/vim/.vimrc`. The airline theme should also be changed in the 'Plugin Settings' section so the colors coordinate. Gruvbox is also installed.

`/bash/.dircolors` defines an LS color for probably every file extension you can think of. [This is a good article on what the numbers mean.](http://jafrog.com/2013/11/23/colors-in-terminal.html)

### Prompt

The promt from ["Cowboy" Ben Alman](https://github.com/cowboy/dotfiles) is simply amazing.

Git repos display as **[branch:flags]** where flags are:

`%` - untracked files

`*` - changed (but unstaged) files

`+` - staged files

It also shows user, computer name, directory, time of command, and last return code (if applicable).
