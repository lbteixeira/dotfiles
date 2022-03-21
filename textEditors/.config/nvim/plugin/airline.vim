"let g:airline_theme='deus'
"let g:airline_theme='google_dark'
let g:airline_theme='onedark'
"let g:airline_theme='hybrid'
"let g:airline_theme='jellybeans'
let g:airline_powerlinw_fonts = 1
let g:airline_stl_path_style = 'short'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline#extensions#virtualenv#enabled = 1
let airline#extensions#coc#warning_symbol = ' '
let airline#extensions#coc#error_symbol = ' '
let g:airline#extensions#wordcount#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.colnr = ' 𤋮'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = ' '
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = '🔒'
let g:airline_symbols.dirty='⚡'

"Only shows file encoding when there are at least 5000 columns (never)
call airline#parts#define_minwidth('ffenc', 5000)
