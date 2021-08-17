"General sets
syntax on
let mapleader = " "

set noerrorbells

"Tab options
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

"Line numbers
set number
set relativenumber
"set cursorline

set nohlsearch "Stop highlighting after search is completed
set hidden "Keeps buffers open on background

"History keeping options
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile

set incsearch "Highlight as search
set scrolloff=8 "Starts scrolling when cursor is n lines above or below the end
set signcolumn=yes "Extra column to show messages or errors

"Inserts a vertical line at column 80
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set textwidth=0
set linebreak
set splitbelow splitright "Instead of above and left, that are defaults

"Recommended by CoC
set cmdheight=2 " Give more space for displaying messages.
set updatetime=300
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

"Always open latex files correctly
let g:tex_flavor='latex'

set foldlevelstart=1

