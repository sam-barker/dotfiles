" Plugins!
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ggreer/the_silver_searcher'

call plug#end()

" ===== Basic editor setup =====
filetype plugin indent on
syntax on
set tabstop=2
set expandtab
set shiftwidth=2
set number
set laststatus=2
colorscheme onedark

" ===== NERDTree config =====
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" This will close nerd tree if it's the only tab remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Auto start NERDTree on enter
autocmd vimenter * NERDTree

" ===== Airline config =====
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1

" ===== FZF config =====
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" This will disable the powerline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Displays hidden files in searches
command! -bang -nargs=? -complete=dir Search
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)

" ===== Keybindings =====
map <C-b> :NERDTreeToggle<CR>
map <C-p> :Search<CR>
map <C-f> :Ag<CR>
map <C-q> :wq<CR>
" Smart way to move between panes
map <A-up> <C-w><up>
map <A-down> <C-w><down>
map <A-left> <C-w><left>
map <A-right> <C-w><right>

