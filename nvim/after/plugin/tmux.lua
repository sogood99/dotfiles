vim.cmd([[
function! s:reset_netrw_keys() abort
  nnoremap <buffer> <c-l> <c-l>
  unmap <buffer> <c-l>
endfunction

augroup navigator
  autocmd!
  autocmd FileType netrw call s:reset_netrw_keys()
augroup END
]])

-- disable wrapping in tmux vim
vim.g.tmux_navigator_no_wrap = 1
