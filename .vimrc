syntax on
set relativenumber

set nocompatible

" syntax highlighting
syntax enable

" idk what this does
filetype plugin indent on

" show keystroke
set showcmd

set path+=**

set wildmenu

" make navigating easier

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remap navigation in terminal

tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

" make navigating easier

nnoremap <C-W><C-J> <C-W><S-J>
nnoremap <C-W><C-K> <C-W><S-K>
nnoremap <C-W><C-H> <C-W><S-H>
nnoremap <C-W><C-L> <C-W><S-L>

" remap navigation in terminal

tnoremap <C-W><C-J> <C-W><S-J>
tnoremap <C-W><C-K> <C-W><S-K>
tnoremap <C-W><C-H> <C-W><S-H>
tnoremap <C-W><C-L> <C-W><S-L>

set splitbelow
set splitright

" easier to create new code block

nnoremap <C-s> o<Esc>o<Esc>ki
nnoremap <C-q> O<Esc>jO<Esc>i
inoremap <C-s> <Esc>o<Esc>o<Esc>ki
inoremap <C-q> <Esc>O<Esc>jO<Esc>i

" add line without going into edit mode

" nnoremap <Bslash> O<Esc>
" nnoremap <Enter> o<Esc>

" remaps control z to zz = center cursor ( i rairly ever use it )

nnoremap <C-z> zz

" map this to something actually useful

function! DontBeStupid()
	echo "Dont Be Stupid"
endfunction

noremap <Up> :call DontBeStupid()<Cr>
noremap <Down> :call DontBeStupid()<Cr>
noremap <Left> :call DontBeStupid()<Cr>
noremap <Right> :call DontBeStupid()<Cr>
inoremap <Up> <Esc>"kddkPi
inoremap <Down> <Esc>"kddpi
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

" plugin for directory stuff
Plug 'preservim/nerdtree'

" plugin for better tabs
Plug 'godlygeek/tabular'

call plug#end()

set termguicolors

let g:tokyonight_style         = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:tex_flavor = 'latex'
