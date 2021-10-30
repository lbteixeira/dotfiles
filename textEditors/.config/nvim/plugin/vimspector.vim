let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dr :VimspectorReset<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>ds :call vimspector#Stop()<CR>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dk :call vimspector#RunToCursor()<CR>
nnoremap <leader>dj :call vimspector#StepOver()<CR>
nnoremap <leader>dl :call vimspector#StepInto()<CR>
