set encoding=UTF-8
call plug#begin('~/.vim/plugged')
" proven
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" fzf.vim also adds ag support
Plug 'junegunn/fzf.vim'

" language specific
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim'
Plug 'vmchale/just-vim'

" pretty things
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'ryanoasis/vim-devicons'
" themes
Plug 'morhetz/gruvbox'
" Plug 'jacoborus/tender.vim'

" under review
Plug 'blueyed/vim-diminactive'
call plug#end()

filetype plugin indent on
syntax on
let mapleader = " "
set wildignore+=*/bundled/*,bower_components/*,node_modules/*,htmlcov/*,tmp/*,*.so,*.swp,*.zip,*.pyc,*.coverage
runtime macros/matchit.vim

let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\}

"---- Indent Settings ----
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" pretty
set gcr=n:blinkon0  " no blinking cursor
set noerrorbells
set complete+=d

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
set nobackup
set nowritebackup

set timeoutlen=1000
set ttimeoutlen=50

" splintered off configs for isolated parts of code
" lightline needs to run before gruvbox for reasons?
runtime lightline.config.vim
" runtime statusline.vim

colorscheme gruvbox
" colorscheme tender
let g:gruvbox_contrast_dark='soft'

set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
set backspace=indent,eol,start

" Vertical and horizontal split then hop to a new buffer
noremap <Leader>v :vsp<cr>
noremap <Leader>h :sp<cr>
nnoremap <leader><leader> <c-^>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitbelow splitright

" Trailing Whitespace
highlight extrawhitespace ctermbg=red guibg=red
match extrawhitespace /\s\+$/

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1

map <F5> :setlocal spell! spelllang=en_us<CR>

" searching
nnoremap <leader>f :Files .<cr>
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>F :ALEFix<CR>
nnoremap <leader>r :Ag<CR>
nnoremap <leader>ne :lne<CR>
nnoremap <leader>pe :pe<CR>
nnoremap <silent> <c-_> :set hlsearch!<cr>

" sets up line/global search+replace of highlighted word
nnoremap <leader>s :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/
