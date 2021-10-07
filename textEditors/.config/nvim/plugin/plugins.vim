call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'

Plug 'mbbill/undotree'
Plug 'vifm/vifm.vim'
Plug 'justinmk/vim-sneak'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'cespare/vim-toml'
Plug 'liuchengxu/vim-which-key'
Plug 'jmcantrell/vim-virtualenv'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

call plug#end()
