set encoding=UTF-8
call plug#begin('~/.vim/plugged')
" proven
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
" Plug 'dense-analysis/ale'
Plug 'jacobb/ale'
Plug 'christoomey/vim-tmux-navigator'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fzf.vim also adds ag support

" pretty things
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot' " I gave up

" themes
" Plug 'joshdick/onedark.vim'
" Plug 'tomasiser/vim-code-dark'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'pineapplegiant/spaceduck'
" Plug 'ayu-theme/ayu-vim'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

" under review
Plug 'romainl/vim-cool'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()
runtime macros/matchit.vim

filetype plugin indent on
syntax on
let mapleader = " "
let maplocalleader = " "
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Vertical and horizontal split then hop to a new buffer
noremap <Leader>v :vsp<cr>
noremap <Leader>h :sp<cr>
nnoremap <leader><leader> <c-^>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"---- Indent Settings ----
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set splitright

set hidden  " Allow hidden buffers, don't limit to 1 file per window
set showcmd
set wildmenu
set wildmode=longest:full,longest
set incsearch
set noswapfile
set nobackup
set backspace=indent,eol,start
set nowritebackup
set timeoutlen=1000
set ttimeoutlen=50
set complete-=i,d  " don't scan included files for completion

" splintered off configs for isolated parts of code
" lightline needs to run before gruvbox for reasons?
runtime lightline.config.vim

" Wrap settings
" set wrap " turn on line wrapping
" set wrapmargin=8 " wrap lines when coming within n characters from side
" set linebreak " set soft wrapping
" set showbreak=… " show ellipsis at breaking
" set textwidth=88

" pretty
colors gruvbox-material
if exists('$TMUX')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
set gcr=n:blinkon0  " no blinking cursor
set noerrorbells

" Sidebars
set number
set colorcolumn=88  " this maybe belongs in a python syntax file
set relativenumber

" zettel/wiki/diary
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#formatting#mode = 'h' " A'
let g:pandoc#formatting#textwidth = 88
let g:pandoc#syntax#style#emphases = 1
nnoremap <CR> <Plug>(pandoc-keyboard-links-open)
function! DiaryStart()
    :silent 0r !~/bin/gentemp.py '%'
    normal 2gg
endfunction
au BufNewFile */wiki/diary/*.md call DiaryStart()

" fzf/searching
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow\ --iglob=!.git
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --theme=tokyo {}' --preview-window 'right:60%' --layout reverse --margin=1,4"

" misc aliases
nnoremap <leader>f :Files .<cr>
nnoremap <leader>b :History <cr>
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>F :ALEFix<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <silent> <Leader>ag :Rg <C-R><C-W><CR>
" nnoremap <leader>ne :lne<CR>
" nnoremap <leader>pe :pe<CR>
nnoremap <leader>cs :set hlsearch!<cr>
nnoremap <leader>G :G<cr>
nnoremap <leader>S :setlocal spell! spelllang=en_us<CR>

" sets up line/global search+replace of highlighted word
nnoremap <leader>s :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/

" netrw -- who needs nerdtree, maybe?
let g:netrw_banner = 0
" let g:netrw_altv = 1
let g:netrw_winsize = 25
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" nnoremap <C-n> :Lexplore<CR>
nnoremap <Leader>ee :Explore<CR>
nnoremap <Leader>ntf :Lexplore %:h<CR><CR>

" ale
nnoremap <silent> <leader>p <Plug>(ale_previous_wrap)
nnoremap <silent> <leader>n <Plug>(ale_next_wrap)
set omnifunc=ale#completion#OmniFunc
let g:ale_html_beautify_options = '-s 2'
let g:ale_completion_enabled = 1
let g:ale_virtualtext_cursor = 0
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
