"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/milkman/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/milkman/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'preservim/nerdtree'
NeoBundle 'preservim/nerdcommenter'
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'frazrepo/vim-rainbow'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on
filetype plugin on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Line Number
set number
set relativenumber

" Tab Spacing
set autoindent
set shiftround
set shiftwidth=2
set tabstop=2
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
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" User Interface
set hidden      " allow going to another file without saving
"set insearch    " show partial word when searching
set wildmenu
set laststatus=2
set title
set background=dark
setlocal colorcolumn=80


" Misc
set history=1000
"set dir=~/.cache/vim

" Treeview
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 15
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

"Start ColorScheme----------------------------------
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'
let g:rainbow_active = 1
"End ColorScheme------------------------------------

"Start LightLine------------------------------------
if !has('gui_running')
    set t_Co=256
endif
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
"End LightLine--------------------------------------

"Start Key ReMap------------------------------------
map <F2> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <F5> :%s/\s\+$//e<CR>
"End Key ReMap--------------------------------------
