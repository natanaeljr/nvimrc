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
call plug#end()

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

colorscheme gruvbox
set background=dark

" use spaces instead of tabs
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

"Keep 80 columns.
set colorcolumn=100
highlight OverLength guibg=#592929
match OverLength /\%100v.\+/
autocmd WinEnter * match OverLength /\%100v.\+/



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

" Clang Format
map <leader>i :pyf /usr/share/clang/clang-format.py -assume-filename=/home/nanter/.dotfiles/.clang-format<cr>
imap <leader>i <c-o>:pyf /usr/share/clang/clang-format.py -assume-filename=/home/nanter/.dotfiles/.clang-format<cr>

"define custom control key
let mapleader="\<space>"

"""Costum Keymaps"""
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>i :ClangFormat<cr>

nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
" Airline
let g:airline_powerline_fonts = 1

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nnoremap <leader>T :enew<cr>
" Move to the next buffer
nnoremap <leader>l :bnext<CR>
" Move to the previous buffer
nnoremap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>
