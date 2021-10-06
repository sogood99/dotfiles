syntax on
set relativenumber

set nocompatible

" syntax highlighting
syntax enable

" idk what this does
filetype plugin indent on

set path+=**

set wildmenu

" make navigating easier

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"make navigating easier

set splitbelow
set splitright

" remaps control z to zz = center cursor

nnoremap <C-z> zz

" dont be stupid

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>


" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack


" Plugins

call plug#begin()

" plugin for vim style
Plug 'ghifarit53/tokyonight-vim'

" plugin for git
Plug 'tpope/vim-fugitive'

" plugin for latex support
Plug 'lervag/vimtex'

" plugin for cool status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:tex_flavor = 'latex'
