nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

let g:which_key_centered= 0
let g:which_key_position = 'botright' " topleft
let g:which_key_use_floating_win = 0
let g:which_key_floating_relative_win= 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map =  {}
let g:which_key_map.d = {
      \ 'name' : 'Vimspector',
      \ 'd'    : 'launch'    ,
      \ 'r'    : 'reset',
      \ 'c'    : 'continue',
      \ 's'    : 'stop',
      \ 'b'    : 'toggle break point',
      \ 'rc'   : 'run to cursor',
      \ 'j'    : 'step over',
      \ 'l'    : 'step into',
      \ }

let g:which_key_map.v = {
      \ 'name' : 'Vifm',
      \ 'v'    : 'open',
      \ 'd'    : 'diff'    ,
      \ 's'    : 'split',
      \ 't'    : 'tab',
      \ }

let g:which_key_map.b = {
      \ 'name' : 'Buffer',
      \ 'b'    : 'buffers',
      \ 'd'    : 'close'    ,
      \ 'l'    : 'lines',
      \ }

let g:which_key_map.i = {
      \ 'name' : 'Indent guides',
      \ 'g'    : 'toggle',
      \ }

let g:which_key_map['s'] = [ ':w<CR>' , 'save']
let g:which_key_map['m'] = [ ':MaximizerToggle' , 'maximize']

call which_key#register('<Space>', "g:which_key_map")
 
 
 
 
 
