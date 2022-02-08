let g:ale_cursor_detail = 0
let g:ale_floating_preview = 1

let g:ale_sign_error = ''
let g:ale_sign_warning = ''
" Show errors or warnings in the statusline
let g:airline#extensions#ale#enabled = 1

" Which linters to run for each language
let g:ale_linters = {
\   'cpp': ['cppcheck'],
\}
"
let g:ale_fixers = {
\   'cpp': ['uncrustify'],
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Will use CoC as lsp client
let g:ale_disable_lsp = 1

" When to run linters
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1

" Opens a list with the diagnostics when there is an error or warning
let g:ale_open_list = 0

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

let g:ale_c_uncrustify_options = '-c uncrustify.cfg --no-backup '

nnoremap <Leader>ad :ALEDetail<CR>
