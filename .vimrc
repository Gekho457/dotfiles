set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/rakr/vim-one'
Plugin 'preservim/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin '907th/vim-auto-save'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 100 chars. 
set textwidth=100

" turn syntax highlighting on
syntax on
" turn line numbers on
set number

set mouse=a

" highlight matching braces
set showmatch

let mapleader="\\"
map <F10> <C-w><C-w>
map <F9> <Esc>
imap <F9> <Esc>
set clipboard=unnamed


let g:airline_theme='one'
colorscheme one
set background=dark
set t_Co=256

map <Space> <C-w>=
map <C-n> :NERDTreeToggle<CR><Space>

"set splitright
"autocmd FileType * TextChanged,InsertLeave <buffer> silent write
"command Sv source ~/.vimrc
let g:auto_save = 1
let g:auto_save_silent = 1

set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set cc=100
highlight ColorColumn ctermbg=4
highlight Normal ctermbg=234
