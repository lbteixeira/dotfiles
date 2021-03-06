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
