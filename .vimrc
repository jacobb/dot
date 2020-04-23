 " Vundle Stuff
set encoding=UTF-8
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
" proven
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
" fzf.vim also adds ag support
Plug 'junegunn/fzf.vim'

" language specific
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'mrk21/yaml-vim'
" vim-jsx-pretty seems to break on JS-nested props
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'neoclide/vim-jsx-improve'

" note: Dockerfile should be in baes vim by 8.3, remove when that happens
Plug 'ekalinin/Dockerfile.vim'

" pretty things
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'ryanoasis/vim-devicons'

" themes
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'


" under review
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'blueyed/vim-diminactive'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

syntax on
filetype plugin indent on
let mapleader = " "
set wildignore+=*/bundled/*,bower_components/*,node_modules/*,htmlcov/*,tmp/*,*.so,*.swp,*.zip,*.pyc,*.coverage

" pretty
set gcr=n:blinkon0  " no blinking cursor
set noerrorbells
set complete+=d

set nofoldenable " disable folding"

" Show line numbers
set number
set colorcolumn=88

" Allow hidden buffers, don't limit to 1 file per window
set hidden
set showcmd
set wildmenu
set wildmode=full
set incsearch
set noswapfile

"---- Color Settings ----
" colorscheme tender
colorscheme gruvbox
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
set backspace=indent,eol,start

set cursorline

"---- Indent Settings ----
set cindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

cnoremap <expr> <C-n> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>/<C-r>/" : "n"
cnoremap <expr> <C-p> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>?<C-r>/" : "p"

set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
noremap <Leader>v :vsp^M^W^W<cr>
noremap <Leader>h :split^M^W^W<cr>
nnoremap <leader><leader> <c-^>
" let g:ctrlp_map = '<leader>f'

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set nobackup
set nowritebackup

nnoremap <F3> :set hlsearch!<CR>

" Trailing Whitespace
highlight extrawhitespace ctermbg=red guibg=red

match extrawhitespace /\s\+$/

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeRespectWildIgnore=1

map <F5> :setlocal spell! spelllang=en_us<CR>

nnoremap <leader>f :Files .<cr>
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>F :ALEFix<CR>
nnoremap <leader>r :Ag<CR>
nnoremap <leader>ne :lne<CR>
nnoremap <leader>pe :pe<CR>

" sets up line/global search+replace of highlighted word
nnoremap <leader>s :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/

" splintered off configs for isolated parts of code
runtime lightline.config.vim
