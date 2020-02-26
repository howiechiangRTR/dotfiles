" Line Number
set number
set relativenumber

" Tab Spacing
set autoindent
set shiftround
set shiftwidth=4
set tabstop=4
set expandtab

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" Text Rendering
set display+=lastline
set encoding=utf-8
set linebreak
set scrolloff=1
set sidescrolloff=5
syntax enable
set wrap

" User Interface
set wildmenu
set laststatus=2
set title
set background=dark

" Misc
set history=1000
"set dir=~/.cache/vim

" Treeview
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
