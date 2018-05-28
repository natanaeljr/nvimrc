call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
Plug 'evedovelli/rst-robotframework-syntax-vim'
Plug 'scrooloose/nerdtree'
Plug 'wincent/terminus'
Plug 'jszakmeister/vim-togglecursor'
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'kadekillary/subtle_solo'
Plug 'crusoexia/vim-monokai'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'nightsense/nemo'
Plug 'kadekillary/skull-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'encody/nvim'
Plug 'AlessandroYorba/Despacio'
call plug#end()

" NERDTree
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ALE
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled=1


" UtilSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'

" activate deoplete
let g:deoplete#enable_at_startup = 1

set cursorline

set clipboard=unnamedplus

set termguicolors
set background=dark
colorscheme gruvbox
let g:airline_theme='dark'

" use spaces instead of tabs
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"Keep 80 columns.
set colorcolumn=100
highlight OverLength guibg=#592929
match OverLength /\%100v.\+/
autocmd WinEnter * match OverLength /\%100v.\+/

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

"allow two edit more than one file at a time
set hidden

"show number column
set number

"show line numbers relative to cursor
set relativenumber

"allow normal mouse
set mouse=a

"show live panel for substitute command
set inccommand=split

"auto change working directory to opened dir
set autochdir

" Clang Format
map <leader>i :pyf /usr/share/clang/clang-format.py -assume-filename=/home/nanter/.dotfiles/.clang-format<cr>
imap <leader>i <c-o>:pyf /usr/share/clang/clang-format.py -assume-filename=/home/nanter/.dotfiles/.clang-format<cr>

"define custom control key
let mapleader="\\"

"""Costum Keymaps"""
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>i :ClangFormat<cr>

nnoremap <leader>p :Files<cr>
nnoremap <leader>f :Ag<space>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFocus<CR>

nnoremap <C-s> :w<cr>

nnoremap <A-j> ddp
nnoremap <A-k> ddkP
nnoremap <A-J> yyp
nnoremap <A-K> yyP

"nnoremap <A-k> dd <BAR> k <BAR> P
"nnoremap <A-j> dd p

tnoremap <Esc> <C-\><C-n>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nnoremap <leader>bt :enew<cr>
" Move to the next buffer
nnoremap ) :bnext<cr>
" Move to the previous buffer
nnoremap ( :bprevious<cr>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bd :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>
" Add a new buffer
nnoremap <leader>ba :badd 

" imported
map <F5> :set wrap!<CR>
map <F6> :set number!<CR>
map <F7> :set spell! spelllang=en<CR>
map <F8> :set spell! spelllang=pt_br<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
" Airline
let g:airline_powerline_fonts = 1

set guicursor=
"set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

let &t_SI = "<Esc>[6 q"

let &t_SR = "<Esc>[4 q"

let &t_EI = "<Esc>[2 q"
