call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'preservim/nerdcommenter'
Plug 'vifm/vifm.vim'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'luochen1990/rainbow'
Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/goyo.vim'
Plug 'cespare/vim-toml'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jmcantrell/vim-virtualenv'
Plug 'tpope/vim-fugitive'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
