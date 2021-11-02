filetype plugin on
let g:NERDCreateDefaultMappings = 0
nnoremap <silent> <leader>i :call nerdcommenter#Comment(0, 'toggle')<CR>
vnoremap <silent> <leader>i :call nerdcommenter#Comment(0, 'toggle')<CR>
