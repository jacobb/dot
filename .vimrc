" Vundle Stuff
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

Plug 'hynek/vim-python-pep8-indent'
Plug 'scrooloose/nerdtree'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'hdima/python-syntax'
Plug 'othree/html5.vim'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'derekwyatt/vim-scala'
Plug 'mtth/scratch.vim'

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'ekalinin/Dockerfile.vim'
Plug 'w0rp/ale'
call plug#end()

syntax on
filetype plugin indent on

set wildignore+=*/bundled/*,media/*,bower_components/*,node_modules/*,htmlcov/*,tmp/*,*.so,*.swp,*.zip,*.pyc,*.coverage

let mapleader = " "
" Enable file type detection and do language-dependent indenting.
set nofoldenable " disable folding"

" Show line numbers
set number
set colorcolumn=80

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
set showcmd

"---- Color Settings ----
:color Tomorrow-Night
:set t_Co=256 " 256 colors
:set background=dark
set guifont=Monospace\ 9
set cursorline        " Highlight current line
set background=dark
set backspace=indent,eol,start

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

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <F3> :set hlsearch!<CR>

" Trailing Whitespace
highlight extrawhitespace ctermbg=red guibg=red
augroup filetype_html
    autocmd!
    autocmd colorscheme * highlight extrawhitespace ctermbg=red guibg=red
    autocmd BufEnter *html map <F8> :setfiletype htmldjango<CR>
augroup END

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

" airline
set laststatus=2
let g:airline_theme='tomorrow'

" backup stuff
" Store all swap files together, to prevent synching of swp and backup~ files in Dropbox
" Don't forget to mkdir ~/.vim/swap & backup!!!
set directory^=$HOME/.vim/swap/
set backupdir=~/.vim/backup

" Force backups to be copied from original, not renamed
set backupcopy=yes

map <Leader>r :SyntasticCheck<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>


set gcr=n:blinkon0
highlight Cursor guifg=white guibg=black
set noerrorbells

map <F5> :setlocal spell! spelllang=en_us<CR>

set history=1000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selecta Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! FindWithWildignore()
  let excluding=""
  for entry in split(&wildignore,",")
    let excluding.= (match(entry,'*/*') ? " ! -ipath \'" : " ! -iname \'") . entry . "\' "
  endfor
  return "find * -type f \\\( " . excluding . " \\\)"
endfunction

function! SelectaFile(path)
  call SelectaCommand(FindWithWildignore(), "", ":e")
endfunction

" nnoremap <leader>f :call SelectaFile(".")<cr>
nnoremap <leader>f :FZF<cr>

let g:jsx_ext_required = 0
let g:riv_fold_auto_update = 0
