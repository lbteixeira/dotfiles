"For NERD commenter
filetype plugin on

"NERDTree
autocmd BufWinEnter * silent NERDTreeMirror

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
