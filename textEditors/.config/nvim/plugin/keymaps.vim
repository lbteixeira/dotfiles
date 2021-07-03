"Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Adjust split sizes
noremap <silent> <M-h> :vertical resize -3<CR>
noremap <silent> <M-l> :vertical resize +3<CR>
noremap <silent> <M-j> :resize -3<CR>
noremap <silent> <M-k> :resize +3<CR>

map <Leader>tt :new term://bash<CR>

imap jj <Esc>
nnoremap k gk
nnoremap j gj
nnoremap cw ciw
nnoremap dw diw
nnoremap <C-s> :w<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>g :Rg<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>bl :BLines<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <F12> :Goyo<CR>
nnoremap <F6> :set spell!<CR>
nnoremap <S-Tab> :bnext<CR>

"Copy paste from clipboard
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+p

"Vifm
nnoremap <Leader>vv :Vifm<CR>
nnoremap <Leader>vs :VsplitVifm<CR>
nnoremap <Leader>vd :DiffVifm<CR>
nnoremap <Leader>vt :TabVifm<CR>

"NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

"CoC
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <leader>rn <Plug>(coc-rename)
" Symbol renaming.

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"Vimspector
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dr :VimspectorReset<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>ds :call vimspector#Stop()<CR>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dj :call vimspector#StepOver()<CR>
nnoremap <leader>dl :call vimspector#StepInto()<CR>

"Vim-maximizer
nnoremap <leader>m :MaximizerToggle<CR>

