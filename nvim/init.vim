let mapleader=" "

syntax on
set hlsearch
filetype plugin indent on
filetype on
filetype indent on
filetype plugin on
set nocompatible
set mouse=a
set encoding=utf-8
set autochdir


set number
set relativenumber
set cursorline
set showcmd
set wildmenu
set wrap
set hlsearch

noremap n h
noremap u kzz
noremap e jzz
noremap i l
noremap U 5kzz
noremap E 5jzz
noremap N 7h
noremap I 7l
" N key: go to the start of the line
noremap <C-n> 0
" I key: go to the end of the line
noremap <C-i> $

noremap k i
noremap K I
noremap l u

map s <nop>
map S :w<CR>
map Q :q<CR>
map ; :

" SplitWindow
map si :set splitright<CR>:vsplit<CR>
map sn :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map se :set splitbelow<CR>:split<CR>

" The Tab oprection
map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :+tabnext<CR>

" Leader to oprecte the cursor
map <LEADER>i <C-w>l
map <LEADER>u <C-w>k
map <LEADER>n <C-w>h
map <LEADER>e <C-w>j

" Resize the window size
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>


" Vim-Plugin Section
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'connorholyday/vim-snazzy'

call plug#end()

" Airline Section
" ==========================
" Theme
let g:airline_theme='cool'

" enable Smart tab line
let g:airline#extensions#tabline#enabled = 1

" Vim Snazzy Theme
let g:SnazzyTransparent = 1
color snazzy

" ===
" === NERDTree
" ===
" Copied from theniceboy Is works!
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
