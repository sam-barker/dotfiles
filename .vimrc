" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Source plugin file
so ~/.vim/plugins.vim

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

" Custom keybindings to make vim easier
map <C-b> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
map <C-q> :wq<CR>
