set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
if !has('nvim')
    set rubydll=/Users/dmitrigekhtman/.rvm/rubies/ruby-2.6.3/lib/libruby.2.6.dylib
endif
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
Plugin 'dense-analysis/ale'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-sensible'
Plugin 'tomasr/molokai'
Plugin 'jnurmine/Zenburn'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'Yggdroot/indentLine'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'fatih/vim-go'
set list lcs=tab:\┊\ 

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
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
"Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

runtime plugin/sensible.vim

"augroup autoformat_settings
 " autocmd FileType bzl AutoFormatBuffer buildifier
  "autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  "autocmd FileType dart AutoFormatBuffer dartfmt
  "autocmd FileType go AutoFormatBuffer gofmt
  "autocmd FileType gn AutoFormatBuffer gn
  "autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  "autocmd FileType java AutoFormatBuffer google-java-format
  "autocmd FileType python AutoFormatBuffer yapf
  "autocmd FileType python AutoFormatBuffer autopep8
  "autocmd FileType rust AutoFormatBuffer rustfmt
  "autocmd FileType vue AutoFormatBuffer prettier
"augroup END

set rtp+=/usr/local/opt/fzf
"command R Rg
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <Leader>v :e $MYVIMRC<cr>
map <C-z> :Ag<cr>
map <C-f> :Files <cr>
map <C-t> :vert term broot<cr>c/
map <C-s> :ALEToggle<cr>
map <C-x> :noh<cr>
autocmd FileType go nnoremap <buffer> <leader>d :GoDef<CR>
vnoremap p "_dP
let g:ale_enabled = 0
let g:ale_python_flake8_options = '--inline-quotes "double" --ignore=C0114,E0401,C0103,E741,W503,E121,E226'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_linters = {'python' : ['flake8', 'mypy']}
let g:agriculture#ag_options = '--files-with-matches'

if !has('nvim')
    tnoremap <C-N> <C-W>N
endif

map <Space> <C-w>=
map <C-b> :NERDTreeToggle<CR><Space>
map <C-n> :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

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
"set textwidth=100

" turn syntax highlighting on
syntax on
" turn line numbers on
set number
if !has('nvim')
    au TerminalOpen * if &buftype == 'terminal' | setlocal nu! | endif
endif

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


set foldlevelstart=20
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"let g:indentLine_enabled = 0
let g:indentLine_char = '┊'



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
set splitbelow
set nois
set modifiable
"autocmd FileType * TextChanged,InsertLeave <buffer> silent write
command! Sv source $MYVIMRC
command! Cp call Copy_file_name()
function! Copy_file_name()
    let @" = expand("%:p")
    let @+ = expand("%:p")
endfunction
let g:auto_save = 1
let g:auto_save_silent = 1

command! St SignatureToggle
"""
"let g:BACKGROUND = 235
"""
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set t_8f=^[[38;2;%lu;%lu;%lum
"set t_8b=^[[48;2;%lu;%lu;%lum
set t_Co=256
"set cc=100

set hlsearch
"augroup MyColors
 "   autocmd!
  "  autocmd ColorScheme * highlight clear Search
"augroup END

"hi Whitespace ctermbg=235 ctermfg=235
"match Whitespace /\s/

"set termguicolors
"colorscheme zenburn
"hi LineNr ctermbg=NONE guibg=NONE
"hi clear VertSplit
"hi VertSplit ctermfg=bg ctermbg=None guifg='#3f3f3f' guibg=#5f6f6f


"let g:molokai_original = 1
"let g:rehash256=1
"colorscheme molokai
"hi LineNr guibg=NONE

set termguicolors
let g:airline_theme='one'
colorscheme one
set background=dark
"set background=light
hi Search guibg='#8cba9e'
"""""

" todo -- set for light, set current match, fix statusline


"highlight ColorColumn ctermbg=18
"highlight Normal ctermbg=235
"hi MatchParen ctermfg=14 ctermbg=236
"hi SignColumn ctermbg=235
"hi StatusLineNC NONE
"hi StatusLineNC ctermbg=237 ctermfg=249
"hi StatusLine NONE
"hi StatusLine ctermbg=248 ctermfg=black
"hi Pmenu ctermbg=black ctermfg=white
"hi PmenuSel ctermbg=white ctermfg=black
set cursorline
set ruler
"set cc=100
"hi CursorLine guibg='#303030'
"hi CursorLineNR ctermbg=235 ctermfg=241
"""""""""""
"autocmd BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
"autocmd BufNewFile,BufRead * call matchadd('NonText', '\n\+')


"hi Search ctermbg=239 ctermfg=black
"hi Search ctermbg=251 ctermfg=196

augroup ReduceNoise
    autocmd!
    " Automatically resize active split to 90 width
    autocmd WinEnter * :call ResizeSplits()
    autocmd FileType nerdtree :call Add_pipes()
augroup END

let SMALL_WIDTH = 40
let BIG_WIDTH = 90

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

augroup PythonWrap
    autocmd!
    autocmd FileType python setlocal cc=81
    autocmd FileType python setlocal completeopt-=preview
augroup END


set laststatus=2

if !has('nvim')
    set ttymouse=sgr
endif
"let g:kite_supported_languages = ['python', 'javascript', 'go']
"let g:kite_auto_complete = 0
"map <C-x> <C-x><C-u>
"imap <C-x> <C-x><C-u>
"set completeopt=menuone,noinsert
let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0
"let g:jedi#completions_enabled = 0
"map <leader>b :let g:jedi#completions_enabled = 1<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
