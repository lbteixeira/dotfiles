nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

let g:which_key_centered= 0
let g:which_key_position = 'botright' " topleft
let g:which_key_use_floating_win = 0
let g:which_key_floating_relative_win= 0
let g:which_key_sep = '→ '

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map =  {}
let g:which_key_map.c = {
      \ 'name' : '+coc',
      \ 'd'    : 'documentation'    ,
      \ 'r'    : 'rename',
      \ 'D'    : 'diagnostics',
      \ 'p'    : 'diag previous',
      \ 'n'    : 'diag next',
      \ 'a'    : 'action',
      \ 'f'    : 'fix',
      \ 'h'    : 'switch',
      \ }
let g:which_key_map.d = {
      \ 'name' : '+vimspector',
      \ 'd'    : 'launch'    ,
      \ 'r'    : 'reset',
      \ 'c'    : 'continue',
      \ 's'    : 'stop',
      \ 'b'    : 'toggle break point',
      \ 'k'    : 'run to cursor',
      \ 'j'    : 'step over',
      \ 'l'    : 'step into',
      \ }

let g:which_key_map.v = {
      \ 'name' : '+vifm',
      \ 'v'    : 'open',
      \ 'd'    : 'diff'    ,
      \ 's'    : 'split',
      \ 't'    : 'tab',
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer',
      \ 'b'    : 'buffers',
      \ 'd'    : 'close'    ,
      \ 'l'    : 'lines',
      \ 'g'    : 'ripgrep',
      \ }

let g:which_key_map['s'] = [ ':w<CR>' , 'save']
let g:which_key_map['m'] = [ ':MaximizerToggle' , 'maximize']
let g:which_key_map['l'] = [ ':TagbarToggle' , 'tagbar']
let g:which_key_map['n'] = [ ':NERDTreeToggle' , 'nerdtree']
let g:which_key_map['t'] = [ ':new term://bash' , 'terminal']

call which_key#register('<Space>', "g:which_key_map")
