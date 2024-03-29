" transparency of floating window
let g:lazygit_floating_window_winblend = 0
" scaling factor for floating window
let g:lazygit_floating_window_scaling_factor = 0.9
" customize lazygit popup window corner characters
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯']
" use plenary.nvim to manage floating window if available
let g:lazygit_floating_window_use_plenary = 0
" fallback to 0 if neovim-remote is not installed
let g:lazygit_use_neovim_remote = 0

nnoremap <silent> <leader>g :LazyGit<CR>
