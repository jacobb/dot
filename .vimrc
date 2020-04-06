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
" fzf.vim also also adds ag support
Plug 'junegunn/fzf.vim'

" language specific
Plug 'scrooloose/nerdtree'
Plug 'hynek/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'

" note: Dockerfile should be in baes vim by 8.3, remove when that happens
Plug 'ekalinin/Dockerfile.vim'

" pretty things
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'

" under review
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

syntax on
filetype plugin indent on
let mapleader = " "
set wildignore+=*/bundled/*,bower_components/*,node_modules/*,htmlcov/*,tmp/*,*.so,*.swp,*.zip,*.pyc,*.coverage

" pretty
set gcr=n:blinkon0  " no blinking cursor
set noerrorbells

set nofoldenable " disable folding"

" Show line numbers
set number
set colorcolumn=88

" Allow hidden buffers, don't limit to 1 file per window
set hidden
set showcmd
set wildmenu

"---- Color Settings ----
colorscheme tender
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
set backspace=indent,eol,start

" status config
let g:airline_theme='tenderplus'
set laststatus=2
let g:lightline = { 'colorscheme': 'tender' }
set cursorline

"---- Indent Settings ----
set cindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set splitbelow splitright
if &diff
else
    set winwidth=115
    " We have to have a winheight bigger than we want to set winminheight. But if
    " " we set winheight to be huge before winminheight, the winminheight set will
    " " fail.
    set winheight=10
    set winminheight=8
    set winheight=999
endif

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

function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echo "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction

map <F4> :call StripTrailingWhitespace()
map! <F4> :call StripTrailingWhitespace()

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeRespectWildIgnore=1

map <F5> :setlocal spell! spelllang=en_us<CR>

nnoremap <leader>f :GFiles .<cr>
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>r :Ag<CR>
