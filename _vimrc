" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file (restore to previous version)
"   if has('persistent_undo')
"     set undofile	" keep an undo file (undo changes after closing)
"   endif
" endif

" if &t_Co > 2 || has("gui_running")
"   " Switch on highlighting the last used search pattern.
"   set hlsearch
" endif

" " Only do this part when compiled with support for autocommands.
" if has("autocmd")

"   " Put these in an autocmd group, so that we can delete them easily.
"   augroup vimrcEx
"   au!

"   " For all text files set 'textwidth' to 78 characters.
"   autocmd FileType text setlocal textwidth=78

"   augroup END

" else

"   set autoindent		" always set autoindenting on

" endif " has("autocmd")

" " Add optional packages.
" "
" " The matchit plugin makes the % command work better, but it is not backwards
" " compatible.
" if has('syntax') && has('eval')
"   packadd matchit
" endif
set shell=sh

set noerrorbells
set novisualbell
set t_vb=



" use vim mode
set nocompatible

set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'

set relativenumber number

set foldmethod=indent


" Load plugins according to detected filetype
filetype plugin indent on
" Enable syntax highlighting
syntax on

" set shellslash

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 2 spaces.
set shiftwidth  =2         " >> indents by 2 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif


" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'leafgarland/typescript-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#bufferline#enabled = 1

let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change            = '~'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_theme='deus'

" key mapping


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set showtabline=2
map <F2> :NERDTreeToggle<CR>

" use the directory started vim in to search out of
let g:ctrlp_working_path_mode = 0


let g:bufferline_rotate = 1

nmap <F3> :TagbarToggle<CR>

let mapleader = "\<Space>"

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)