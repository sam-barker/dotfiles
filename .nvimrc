" Plugins!
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ggreer/the_silver_searcher'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mxw/vim-jsx'
Plug 'vimlab/split-term.vim'
call plug#end()

" ===== Basic editor setup =====
filetype plugin indent on
syntax on
set tabstop=2
set expandtab
set shiftwidth=2
set number
set laststatus=2
set autoread
" Reload files when buffer changed
au FocusGained,BufEnter * :checktime
colorscheme onedark

" Split term config
set splitright
set splitbelow

" Ale config
let g:ale_enabled=1
let g:ale_set_highlights=1
let g:ale_linters = {
\  'javascript': ['eslint', 'prettier'],
\}
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1
let g:ale_lint_on_enter=1

" Deoplete config
let g:deoplete#sources#jedi#python_path='python3'
let g:deoplete#enable_at_startup=1

" ===== NERDTree config =====
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

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
" NERDTree
map <C-b> :NERDTreeToggle<CR>
imap <C-b> <Esc>:NERDTreeToggle<CR>

" Searching

" Files
map <C-p> :Search<CR>
imap <C-p> <Esc>:Search<CR>
" Strings
map <C-f> :Ag<CR>
imap <C-f> <Esc>:Ag<CR>

" Quitting/Saving
map <C-q> :q<CR>
imap <C-q> <ESC>:q<CR>
map <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>a

" Terminal
map <C-Space> :10Term<CR>
imap <C-Space> <Esc>:10Term<CR>

" Undo/redo
map <C-z> :u<CR>
imap <C-z> <ESC>:u<CR>i

" Smart way to move between panes
map <A-up> <C-w><up>
map <A-down> <C-w><down>
map <A-left> <C-w><left>
map <A-right> <C-w><right>

