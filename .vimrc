set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rubydll=/Users/dmitrigekhtman/.rvm/rubies/ruby-2.6.3/lib/libruby.2.6.dylib
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/rakr/vim-one'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin '907th/vim-auto-save'
Plugin 'kshenoy/vim-signature'
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'https://github.com/davidhalter/jedi-vim'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf.vim'
Plugin 'jesseleite/vim-agriculture'
" Plugin 'wincent/command-t'
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


" set UTF-8 encoding

set rtp+=/usr/local/opt/fzf
"command R Rg
map <C-z> :Ag<cr> 
map <C-f> :Files <cr>
map <C-t> :vert term broot<cr>c/
let g:agriculture#ag_options = '--files-with-matches'

command! -bang -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation 
" set smartindent

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
set matchtime=0

let mapleader="\\"
map <F10> <C-w><C-w>
map <F9> <Esc>
imap <F9> <Esc>
map <leader>a :vs<CR><leader>d
set clipboard=unnamed


let g:airline_theme='one'
colorscheme one
set background=dark
set t_Co=256
:"colorscheme onedark

map <Space> <C-w>=
map <C-b> :NERDTreeToggle<CR><Space>
map <C-n> :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = '' 

function! Add_pipes()
    " :set list / :set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< –
    :set list
    :set listchars=space:\|
    :hi SpecialKey ctermfg=green
endfunction

let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_browse_split = 2
"let g:netrw_liststyle = 3


set splitright
"autocmd FileType * TextChanged,InsertLeave <buffer> silent write
command Sv source ~/.vimrc
command Cp call Copy_file_name()
function! Copy_file_name()
    let @" = expand("%:p") 
    let @+ = expand("%:p") 
endfunction
let g:auto_save = 1
let g:auto_save_silent = 1

command St SignatureToggle

let g:BACKGROUND = 235
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set cc=100

match Whitespace /\s/
highlight ColorColumn ctermbg=18
highlight Normal ctermbg=235
hi MatchParen ctermfg=14 ctermbg=236
hi Whitespace ctermbg=235 ctermfg=235
hi SignColumn ctermbg=235 
hi StatusLineNC NONE
hi StatusLineNC ctermbg=235 ctermfg=249
hi StatusLine NONE
hi StatusLine ctermbg=248 ctermfg=black 
hi Pmenu ctermbg=black ctermfg=white
hi PmenuSel ctermbg=white ctermfg=black
set cursorline
hi CursorLine ctermbg=236
hi CursorLineNR ctermbg=235 ctermfg=241
autocmd BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
autocmd BufNewFile,BufRead * call matchadd('NonText', '\n\+')


augroup ReduceNoise
    autocmd!
    " Automatically resize active split to 100 width
    autocmd WinEnter * :call ResizeSplits()
    autocmd FileType nerdtree :call Add_pipes()
augroup END

let SMALL_WIDTH = 40
let BIG_WIDTH = 100

let g:NERDTreeWinSize = SMALL_WIDTH

function! ResizeSplits()
    if expand('%:p') != '' && stridx(expand('%:p'), 'NERD_tree') == -1
        let &winwidth = g:BIG_WIDTH
        wincmd =
        let &winwidth = g:SMALL_WIDTH 
    endif
endfunction

"let NERDTreeQuitOnOpen = 1
"let NERDTreeDirArrows = 1

set backspace=indent,eol,start
autocmd FileType * setlocal completeopt-=preview
autocmd FileType python setlocal completeopt-=preview

set laststatus=2

set ttymouse=sgr
"let g:kite_supported_languages = ['python', 'javascript', 'go']
"let g:kite_auto_complete = 0
"map <C-x> <C-x><C-u>
"imap <C-x> <C-x><C-u>
"set completeopt=menuone,noinsert
let g:jedi#show_call_signatures = 0
"let g:jedi#completions_enabled = 0
"map <leader>b :let g:jedi#completions_enabled = 1<CR>
