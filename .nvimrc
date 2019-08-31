" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Set up variables
syntax on
set tabstop=2
set expandtab
set shiftwidth=2
set number
set laststatus=2
colorscheme onedark
let NERDTreeShowHidden=1
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:deoplete#enable_at_startup = 1
map <C-b> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
map <C-q> :wq<CR>
