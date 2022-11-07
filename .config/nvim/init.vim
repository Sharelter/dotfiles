" ========================================================
" "Neovim config file for Colemak keyboard layout"
" Author: Sharelter
" Github: https://github.com/sharelter
" borrow something from theniceboy: https://github.com/theniceboy/nvim
" ========================================================

" ==================== Editor behavior ====================
set cursorline
set number relativenumber
set showcmd
set encoding=utf8
set notimeout
set ttimeoutlen=100
set viewoptions=cursor,folds

" Vim autoindent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set noexpandtab 

" =============== Custom cursor movement =================
" source $HOME/.config/nvim/cursor.vim


" Shortcut for quickly source vimrc file
nnoremap <silent> ss :source $MYVIMRC<CR>

" ==================== Basic Mappings ====================
let mapleader=" "
noremap ; :
nnoremap Q :q<CR>
nnoremap S :w<CR>
" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>

" Open solved problems list anytime
nnoremap <LEADER>so :e $HOME/cf/solved.md<CR>

" Undo operations
noremap l u
" Insert Key
noremap k i
noremap K I
" Copy to system clipboard !!!Use this must have a commandline clipboard
" utility to handle clipboard events such as wl-clipboard and xclip
" More inforemation see :help provider-clipboard
vnoremap Y "+y

" ==================== Cursor Movement ====================
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> gu gk
noremap <silent> ge gj
noremap <silent> \v v$h
" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j
" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $
" Faster in-line navigation
noremap W 5w
noremap B 5b
" set h (same as n, cursor left) to 'end of word'
noremap h e
" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

noremap <LEADER><LEADER> zz

" ==================== Window management ====================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l
noremap qf <C-w>o
" Disable she default s key
noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap <silent> su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap <silent> se :set splitbelow<CR>:split<CR>
noremap <silent> sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap <silent> si :set splitright<CR>:vsplit<CR>
" Resize splits with arrow keys
noremap <silent> <up> :res +5<CR>
noremap <silent> <down> :res -5<CR>
noremap <silent> <left> :vertical resize-5<CR>
noremap <silent> <right> :vertical resize+5<CR>
" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ==================== Tab management ====================
" Create a new tab with tu
noremap <silent> tu :tabe<CR>
noremap <silent> tU :tab split<CR>
" Move around tabs with tn and ti
noremap <silent> tn :-tabnext<CR>
noremap <silent> ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap <silent> tmn :-tabmove<CR>
noremap <silent> tmi :+tabmove<CR>

" ==================== Terminal management ====================
nnoremap te :set splitright<CR>:vsplit<CR>:te<CR>a
tnoremap <Esc> <C-\><C-n>


" Vim-Plug section start
call plug#begin()

Plug 'connorholyday/vim-snazzy'

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'} " Instantly preview Markdown files

Plug 'junegunn/goyo.vim' " Distraction-free writing in Vim.

Plug 'mg979/tabline.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'kevinhwang91/rnvimr'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite

Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`

Plug 'luochen1990/rainbow' " Color Pairs to make code more readable

Plug 'mhinz/vim-startify' " The fancy start screen for Vim.

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons' " Always load the vim-devicons as the very last one.

call plug#end()
" Vim-Plug section end

" ==================== suda.vim ====================
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" Active rainbow plugin (rainbow to color to pairs)
let g:rainbow_active = 1

" ==================== indent_blackline ====================
" lua function

lua << EOF
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" ==================== vim-snazzy ====================
colorscheme snazzy

" ==================== Rnvimr ====================
tnoremap <silent> tr <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> tt :RnvimrToggle<CR>
autocmd VimEnter * RnvimrStartBackground

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Disable a border for floating window
let g:rnvimr_draw_border = 0

" ==================== Goyo ====================
nnoremap <silent> gy :Goyo<CR>

" ==================== Airline Config Section ====================
let g:airline_theme='cool'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0 " Disable the trailing prompt on the bottom-right corner

" ==================== vim-instant-makrdown-preview ====================
nnoremap <silent> mv :InstantMarkdownPreview<CR>
nnoremap <silent> mt :InstantMarkdownStop<CR>
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_browser = "firefox --new-window"

" ==================== tabline.nvim ====================
lua require'tabline.setup'.setup()

