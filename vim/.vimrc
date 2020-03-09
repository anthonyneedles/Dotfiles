"=============================================================================
"
"   .vimrc from https://github.com/anthonyneedles/dotfiles
"
"   heavily borrowed from https://github.com/wesedens/vimrc
"
"=============================================================================

" Section: Load Plugs  {{{1
" ---------------------

set runtimepath+=$DOTFILES/vim
call plug#begin("$DOTFILES/vim/plugs")

" Always loaded
Plug 'tpope/vim-fugitive', {'tag': 'v2.5'}
Plug 'jlanzarotta/bufexplorer'
Plug 'terryma/vim-expand-region'
"Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'

" Only loaded when used (lazy)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

" }}}1
" Section: Options {{{1

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

set nocompatible
set autoindent                 " Copy indent from current line when starting a new line
set autoread                   " Set to auto read when a file is changed from the outside
set backspace=2                " Configure backspace so it acts as it should act
set breakindent showbreak=\ +  " Wrapped lines will continue indent followed by ' +'
set cmdheight=2                " height of the command bar
set dictionary+=/usr/share/dict/words
set display=lastline           " As much as possible the last line in a window will be displayed
set encoding=utf8              " Set utf8 as standard encoding and en_US as the standard language
set expandtab                  " Use spaces instead of tabs
set fileformats=unix,dos,mac   " Use Unix as the standard file type
set foldcolumn=1               " Add a bit extra margin to the left
set foldmethod=marker          " Markers are used to specify folds.
set foldopen+=jump             " Type of commands for which folds will be opened
set formatoptions+=j           " Where it makes sense, remove a comment leader when joining lines
set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
set hidden                     " A buffer becomes hidden when it is abandoned
set history=500                " Sets how many lines of history VIM has to remember
set hlsearch                   " Highlight search results
set ignorecase                 " Ignore case when searching
set incsearch                  " Makes search act like search in modern browsers
set laststatus=2               " Always show the status line
set lazyredraw                 " Don't redraw while executing macros (good performance config)
set linebreak                  " Linebreak on 500 characters
set nolist                     " whitespace characters are _not_ made visible
set magic                      " For regular expressions turn magic on
set mat=2                      " How many tenths of a second to blink when matching brackets
set nobackup                   " Turn backup off, since most stuff is in SVN, git etc anyway...
set noerrorbells               " No bells for error messages
set noswapfile                 " Do not create a swapfile for a new buffer
set visualbell                 " Use visual bell instead of beeping.
set nowritebackup              " Do not make a backup before overwriting a file
set pastetoggle=<F2>           " Toggle paste key
set ruler                      " Always show current position
set scrolloff=5                " Set 7 lines to the cursor - when moving vertically using j/k
set shiftround                 " Round indent to multiple of 'shiftwidth'
set shiftwidth=4               " Number of spaces to use for each step of (auto)indent.
set showcmd                    " Show (partial) command in status line.
set showmatch                  " Show matching brackets when text indicator is over them
set smartcase                  " When searching try to be smart about cases
set smartindent                " smart autoindenting when starting a new line.
set smarttab                   " sw at the start of the line, sts everywhere else
set showtabline=1              " only if there are at least two tab pages
set switchbuf=useopen,usetab   " use open window/tab when switching buffers
set t_vb=                      " No visual bell
set tabstop=2                  " 1 tab == 2 spaces
set textwidth=500              " Max width of inserted text
set timeoutlen=1200            " A little bit more time for macros
set ttimeoutlen=80             " Make Esc work faster
set tags=./tags                " Where ctags generated tags
set undodir=$DOTFILES/vim/temp_dirs/undodir
set undofile                   " Turn persistent undo on
set undolevels=1000            " Lots of history
set undoreload=10000           " Lots of history
set viminfo=!,'20,<50,s10,h    " Remember info conservatively
set virtualedit=block          " Highlight any space in visual block mode
set wildmenu                   " Turn on the WiLd menu
set wildmode=longest:full,full " Wildmode completes longest string, then alternative
set wildignore+=tags,*.o,*~,*.pyc,.git
set wrap                       " word wrap lines

" }}}1
" Section: Plugin Settings {{{1

let g:is_bash=1

" => vim-fugitive
map <leader>gs :Gstatus<cr>
map <leader>gd :Gvdiff<cr>

" => bufExplorer plugin
let g:bufExploerDefaultHelp=0
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='name'
nnoremap <silent> <leader>o :BufExplorer<cr>

" => CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20

" => vim-surround, surround.vim config
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1

" => Nerd Tree
let g:NERDTreeHijackNetrw = 0
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" => vim-airline config (force color)
let g:airline_theme="base16_gruvbox_dark_hard"
let g:airline#extensions#tabline#enabled = 1
" use this one with seoul256
" let g:airline_theme="minimalist"

" => gruvbox colorscheme
let g:gruvbox_contrast_dark='medium'

" => seoul256 colorscheme
let g:seoul256_background=234

" => ale
let g:ale_linters = {
\   'c': ['gcc'],
\   'cpp': ['gcc'],
\   'asm': [''],
\}

let g:ale_fixers = {
\   'c': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['remove_trailing_lines', 'trim_whitespace'],
\   'asm': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_c_parse_compile_commands = 1

" }}}1
" Section: Commands {{{1

command! -bar Invert :let &background = (&background=="light"?"dark":"light")

function! g:ToggleColorColumn()
    if exists('+colorcolumn')
        if &colorcolumn != ''
            setlocal colorcolumn&
        else
            setlocal colorcolumn=80
        endif
        highlight ColorColumn ctermbg=23 guibg=lightblue
    endif
endfunction

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("Ag \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" }}}1
" Section: Mappings {{{1
" ----------------------

" Y should perform like C/D
nnoremap Y  y$

" Fast saving
nnoremap <Leader>w :w<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Copy and paste to system clipboard
vmap <Leader>y  "0y
vmap <Leader>d  "0d
nmap <Leader>p  "0p
nmap <Leader>P  "0P
vmap <Leader>p  "0p
vmap <Leader>P  "0P
vmap <Leader>yy "+y
vmap <Leader>dd "+d
nmap <Leader>pp "+p
nmap <Leader>PP "+P
vmap <Leader>pp "+p
vmap <Leader>PP "+P

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Treat long lines as break lines (useful when moving around in them)
" Make sure that if we want to do something like 'dj' it will do what it should
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Split windows like  my tmux
map <leader>\ <C-W>v
map <leader>- <C-W>s
map <leader>x <C-W>c

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif
"" Remember info about open buffers on close
"set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ag and put the cursor in the right position
map <leader>g :Ag

" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pm :setlocal paste!<cr>

" => General abbreviations
iab xdate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>

" End of line/start of line shortcuts
nnoremap <leader><Right> $a
nnoremap <leader><Left> ^i

" highlight the 80th color column
nnoremap <silent> <leader>hh :call g:ToggleColorColumn()<CR>

" checking trailing spaces and tabs
nnoremap <F3> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

" }}}1
" Section: Autocommands {{{1
" --------------------------
"
if has("autocmd")
  filetype plugin indent on " Enable filetype plugins

  augroup Misc " {{{2
    autocmd!

    """"""""""""""""""""""""""""""
    " => git commit message
    """"""""""""""""""""""""""""""
    autocmd FileType gitcommit set tw=72 | setlocal spell
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
    "autocmd FileType gitcommit if getline(1)[0] ==# '#' | call s:scratch_maps() | endif
    autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitrebase nnoremap <buffer> S :Cycle<CR>

    autocmd BufRead,BufNewFile *.yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

    autocmd FileType netrw call s:scratch_maps()
    autocmd FocusLost   * silent! wall
    autocmd FocusGained * if !has('win32') | silent! call fugitive#reload_status() | endif

    autocmd User Fugitive
          \ if filereadable(fugitive#buffer().repo().dir('fugitive.vim')) |
          \   source `=fugitive#buffer().repo().dir('fugitive.vim')` |
          \ endif

    autocmd BufNewFile */init.d/*
          \ if filereadable("/etc/init.d/skeleton") |
          \   keepalt read /etc/init.d/skeleton |
          \   1delete_ |
          \ endif |
          \ set ft=sh

    autocmd BufReadPost * if getline(1) =~# '^#!' | let b:dispatch = getline(1)[2:-1] . ' %' | let b:start = b:dispatch | endif
    autocmd BufReadPost ~/.Xdefaults,~/.Xresources let b:dispatch = 'xrdb -load %'
    autocmd BufWritePre,FileWritePre /etc/* if &ft == "dns" |
          \ exe "normal msHmt" |
          \ exe "gl/^\\s*\\d\\+\\s*;\\s*Serial$/normal ^\<C-A>" |
          \ exe "normal g`tztg`s" |
          \ endif
    autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
      \ if !$VIMSWAP && isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
  augroup END " }}}2
  augroup FTCheck " {{{2
    autocmd!
    autocmd BufNewFile,BufRead *named.conf*       set ft=named
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
  augroup END " }}}2
  augroup FTOptions " {{{2
    autocmd!
    let python_highlight_all = 1
    autocmd FileType c,cpp,cs,java          setlocal commentstring=//\ %s
    autocmd Syntax   javascript             setlocal isk+=$
    autocmd FileType xml,xsd,xslt,javascript setlocal ts=2
    autocmd FileType text,txt,mail          setlocal ai com=fb:*,fb:-,n:>
    autocmd FileType sh,zsh,csh,tcsh        inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
    autocmd FileType sh,zsh,csh,tcsh        let &l:path = substitute($PATH, ':', ',', 'g')
    autocmd FileType perl,python,ruby       inoremap <silent> <buffer> <C-X>! #!/usr/bin/env<Space><C-R>=&ft<CR>
    autocmd FileType c,cpp,cs,java,perl,javscript,php,aspperl,tex,css let b:surround_101 = "\r\n}"
    autocmd FileType apache       setlocal commentstring=#\ %s
    autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
    autocmd FileType help nnoremap <silent><buffer> q :q<CR>
    autocmd FileType java let b:dispatch = 'javac %'
    autocmd FileType lua  setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.lua'
    autocmd FileType perl let b:dispatch = 'perl -Wc %'
    autocmd FileType liquid,markdown,text,txt setlocal tw=78 linebreak nolist
    autocmd FileType tex let b:dispatch = 'latex -interaction=nonstopmode %' | setlocal formatoptions+=l
          \ | let b:surround_{char2nr('x')} = "\\texttt{\r}"
          \ | let b:surround_{char2nr('l')} = "\\\1identifier\1{\r}"
          \ | let b:surround_{char2nr('e')} = "\\begin{\1environment\1}\n\r\n\\end{\1\1}"
          \ | let b:surround_{char2nr('v')} = "\\verb|\r|"
          \ | let b:surround_{char2nr('V')} = "\\begin{verbatim}\n\r\n\\end{verbatim}"
    autocmd FileType vim  setlocal keywordprg=:help |
          \ if exists(':Runtime') |
          \   let b:dispatch = ':Runtime' |
          \   let b:start = ':Runtime|PP' |
          \ else |
          \   let b:dispatch = ":unlet! g:loaded_{expand('%:t:r')}|source %" |
          \ endif
  augroup END "}}}2
endif " has("autocmd")

" }}}1
" Section: Visual {{{1

" => Colors and Fonts
syntax enable
if exists("syntax_on") || exists("syntax_manual")
else
  syntax on
endif

set t_Co=256
set background=dark
silent! colorscheme gruvbox
"silent! colorscheme seoul256
highlight Comment cterm=italic gui=italic
" }}}1
