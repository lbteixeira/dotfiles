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

map <Leader>th :new term://bash<CR>
map <Leader>tv :vnew term://bash<CR>

imap jj <Esc>
nnoremap k gk
nnoremap j gj
nnoremap <C-s> :w<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <F6> :set spell!<CR>
nnoremap <S-Tab> :bnext<CR>
nnoremap <A-down> :m .+1<CR>
nnoremap <A-up> :m .-2<CR>

"Copy paste from clipboard
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+p
nnoremap <Leader>r :source $MYVIMRC<CR>
