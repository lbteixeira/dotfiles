filetype plugin on

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 25
let NERDTreeChDirMode = 2
let g:NERDTreeRemoveFileCmd='trash-put '

nnoremap <leader>nc :NERDTreeCWD<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
