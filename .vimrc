set encoding=UTF-8
call plug#begin('~/.vim/plugged')
" proven
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
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
" Plug 'blueyed/vim-diminactive'

" themes
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim'

" under review
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'romainl/vim-cool'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
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
set relativenumber

set grepprg=rg\ --vimgrep grepformat=%f:%l:%c:%m

" Wrap settings
" set wrap " turn on line wrapping
" set wrapmargin=8 " wrap lines when coming within n characters from side
" set linebreak " set soft wrapping
" set showbreak=… " show ellipsis at breaking
" set textwidth=88

" Allow hidden buffers, don't limit to 1 file per window
set hidden

set showcmd
set wildmenu
set wildmode=longest,list
set incsearch
set noswapfile
set nobackup
set nowritebackup
" don't scan included files for completion
set complete-=i,d


set timeoutlen=1000
set ttimeoutlen=50

" splintered off configs for isolated parts of code
" lightline needs to run before gruvbox for reasons?
runtime lightline.config.vim

let g:tokyonight_style = "night"
" colorscheme tokyonight
colorscheme nightfox

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
" tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-j> <C-\><C-N><C-w>j
" tnoremap <C-k> <C-\><C-N><C-w>k
" tnoremap <C-l> <C-\><C-N><C-w>l
" tnoremap <C-g> <C-\><C-n>
set splitbelow splitright

" Trailing Whitespace
highlight extrawhitespace ctermbg=red guibg=red
match extrawhitespace /\s\+$/

" NERDTree
" let NERDTreeShowHidden=1
" let NERDTreeRespectWildIgnore=1
" map <C-n> :NERDTreeToggle<CR>
" nnoremap <leader>ntf :NERDTreeFind<CR>
" nnoremap <leader>ntr :NERDTreeRefreshRoot<CR>

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>ntr :NvimTreeRefresh<CR>
nnoremap <leader>ntf :NvimTreeFindFile<CR>

" Spelling
set spellcapcheck=
nnoremap <leader>S :setlocal spell! spelllang=en_us<CR>

" searching
nnoremap <leader>f :Files .<cr>
nnoremap <leader>b :History <cr>
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>F :ALEFix<CR>
nnoremap <leader>r :Ag<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <leader>ne :lne<CR>
nnoremap <leader>pe :pe<CR>
nnoremap <leader>cs :set hlsearch!<cr>

" misc aliases
nnoremap <leader>G :G<cr>

" sets up line/global search+replace of highlighted word
nnoremap <leader>s :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki',
            \ 'syntax': 'markdown', 'ext': '.md'}]

function! VimwikiStart()
    :silent 0r !~/bin/gentemp.py '%'
    normal 2gg
endfunction

au BufNewFile */wiki/diary/*.md call VimwikiStart()

nnoremap <silent> <leader>p <Plug>(ale_previous_wrap)
nnoremap <silent> <leader>n <Plug>(ale_next_wrap)
let g:ale_html_beautify_options = '-s 2'
let ale_change_sign_column_color = 1
set signcolumn=number

" fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --theme=tokyo {}' --preview-window 'right:60%' --layout reverse --margin=1,4"
