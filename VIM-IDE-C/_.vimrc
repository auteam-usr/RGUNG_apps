call plug#begin()
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()
syntax on
set number
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set noshowmode
colorscheme onedark
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
map <C-n> :NERDTreeToggle<CR>
