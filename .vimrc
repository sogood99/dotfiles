" syntax on
set relativenumber

set nocompatible

" syntax highlighting
syntax enable

" set tabs to space
set tabstop=4 shiftwidth=4 expandtab

" idk what this does
filetype plugin indent on

" show keystroke
set showcmd

set path+=**

set wildmenu

" set incremental search
set ignorecase
set smartcase
set incsearch
set hlsearch

nnoremap <CR> :noh<CR>

" make navigating easier

function! MoveHorizontal(dir)
    " dir == 0 means left, 1 means right
    if winnr('l') != winnr()
        " not rightmost
        if a:dir == 0
            :exe "normal \<C-W><"
        else
            :exe "normal \<C-W>>"
        endif
    else
        " rightmost, reverse everything
        if a:dir == 0
            :exe "normal \<C-W>>"
        else
            :exe "normal \<C-W><"
        endif
    endif
endfunction

function! MoveVertical(dir)
    " dir == 0 means bot, 1 means top
    if (winnr('j') == winnr()) && (winnr('k') == winnr())
        " only 1, moves status tab
        if a:dir == 0
            :exe "normal \<C-W>+"
        else
            :exe "normal \<C-W>-"
        endif
    elseif winnr('j') != winnr()
        " not bottommost
        if a:dir == 0
            :exe "normal \<C-W>+"
        else
            :exe "normal \<C-W>-"
        endif
    else
        " bottommost, reverse everything
        if a:dir == 0
            :exe "normal \<C-W>-"
        else
            :exe "normal \<C-W>+"
        endif
    endif
endfunction

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <F5> <C-W>:call MoveHorizontal(0)<CR>
nnoremap <silent> <F6> <C-W>:call MoveVertical(0)<CR>
nnoremap <silent> <F7> <C-W>:call MoveVertical(1)<CR>
nnoremap <silent> <F8> <C-W>:call MoveHorizontal(1)<CR>

" remap navigation in terminal

tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>
tnoremap <silent> <F5> <C-W>:call MoveHorizontal(0)<CR>
tnoremap <silent> <F6> <C-W>:call MoveVertical(0)<CR>
tnoremap <silent> <F7> <C-W>:call MoveVertical(1)<CR>
tnoremap <silent> <F8> <C-W>:call MoveHorizontal(1)<CR>

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

" create terminal tab
nnoremap <C-A> <Esc>:term<Cr>

set splitbelow
set splitright

" easier to create new code block

nnoremap <C-s> o<Esc>o<Esc>ki
inoremap <C-s> <Esc>o<Esc>o<Esc>ki

" add line without going into edit mode

"nnoremap <BS> O<Esc>
"nnoremap <Enter> o<Esc>

" remaps control z to zz = center cursor ( i rairly ever use it )

nnoremap <C-z> zz

" use tab for nice looking tabular
" nnoremap <Tab> :Tabularize /[,=]<Cr>
nnoremap <Tab> :Tabularize /[,=]<Cr>

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
"Plug 'lervag/vimtex'

" plugin for cool status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" plugin for directory stuff
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" plugin for better tabs
Plug 'godlygeek/tabular'

" langauge server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" for tmux stuff
Plug 'christoomey/vim-tmux-navigator'

" for fuzzy file searching
Plug 'ctrlpvim/ctrlp.vim'

" commenting
Plug 'preservim/nerdcommenter'

" git diff stuff
Plug 'airblade/vim-gitgutter'

call plug#end()

set termguicolors

let g:tokyonight_style   = 'night' " available: night , storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:tex_flavor = 'latex'

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  "\ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-pyright', 
  \ 'coc-clangd', 
  \ 'coc-java',
  \ 'coc-vimtex',
  \ ]
let g:coc_disable_startup_warning = 1

" coc remaps
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" nerdtree remap
map <C-g> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

" ctrlp settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" nerdcommenter settings
filetype plugin on
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

" nerdtree git hunk settings
let g:NERDTreeGitStatusMapNextHunk = "[g"
let g:NERDTreeGitStatusMapPrevHunk = "]g"
