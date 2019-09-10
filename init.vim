" Natanael Josue Rabello's
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"

let mapleader='\'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Download a plugin manager
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif
" Link vim config with nvim config
if ! has('nvim') && ! filereadable(expand('~/.vim/autoload/plug.vim'))
  silent !mv ~/.vim ~/.vim-backup
  silent !ln -s ~/.config/nvim ~/.vim
endif

" Disable entering ex-mode with Shift+q
nnoremap <silent> Q :<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Tools
Plug 'ctrlpvim/ctrlp.vim'                                               " Fuzzy finder: file, buffer, mru, tag
Plug 'zefei/vim-wintabs'                                                " Modern buffer manager

" Syntax
Plug 'sheerun/vim-polyglot'                                             " A collection of language packs
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }                    " i3 syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }        " Enhanced C and C++ syntax highlighting
Plug 'evedovelli/rst-robotframework-syntax-vim', { 'for': 'rstrobot' }  " Extends RST syntax

" Colorschemes
Plug 'w0ng/vim-hybrid'                                                  " colorscheme hybrid
Plug 'sainnhe/edge'                                                     " colorscheme edge
Plug 'rakr/vim-one'                                                     " colorscheme one
Plug 'lifepillar/vim-solarized8'                                        " colorscheme solarized8
Plug 'NLKNguyen/papercolor-theme'                                       " colorscheme PaperColor
Plug 'morhetz/gruvbox'                                                  " colorscheme gruvbox
call plug#end()

" Install new plugins
nnoremap <leader>pi  :PlugInstall<CR>
" Clean unused plugins
nnoremap <leader>pc  :PlugClean<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
if has('nvim') && has('termguicolors')
  set termguicolors
endif
set background=dark
colorscheme edge

" Disable background colors
"highlight Normal ctermbg=NONE guibg=NONE
"highlight LineNr ctermbg=NONE guibg=NONE
"highlight NonText ctermbg=NONE guibg=NONE
"highlight SignColumn ctermbg=NONE guibg=NONE
"let g:gitgutter_override_sign_column_highlight = 0 " Needed for GitGutter

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " Tab width
set shiftwidth=4    " One indentation level width
set expandtab       " Use spaces instead of tabs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline             " Highlight current line
set nowrap                 " Wrap/nowrap lines
set number relativenumber  " Display line numbers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear search highlight
nnoremap <leader>/  :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste/Cut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus  " Default clipboard register (+ for X Window)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow to unload or abandon modified buffers by hiding them
set hidden
" Write buffer / Save file
nnoremap <C-s>       :write<CR>
" New blank buffer
nnoremap <A-n>       :enew<CR>
" Navigate buffers
nnoremap <Tab>       :bnext<CR>:buffers<CR>
nnoremap <S-Tab>     :bprevious<CR>:buffers<CR>
" List buffers
nnoremap <leader>bl  :buffers<CR>
" Go to buffer
nnoremap <leader>bb  :buffers<CR>:b<space>
" Go to last buffer
nnoremap <leader>b$  :blast<CR>
" Go to first buffer
nnoremap <leader>b0  :bfirst<CR>
" Go to next buffer
nnoremap <leader>bn  :bnext<CR>
" Go to previous buffer
nnoremap <leader>bp  :bprevious<CR>
" Delete specific buffer
nnoremap <leader>bd  :buffers<CR>:bd<space>
" Delete current buffer
nnoremap <leader>b%  :bdelete<CR>
" Delete current buffer discarding changes
nnoremap <leader>b!  :bdelete!<CR>
" Go to last abandoned buffer
nnoremap <leader>b#  :b#<CR>
" Map buffer numbers to <leader>bN
let c = 1
while c <= 9
  execute "nnoremap <leader>b0" . c . " :" . c . "b\<CR>"
  let c += 1
endwhile
let c = 10
while c <= 99
  execute "nnoremap <leader>b" . c . " :" . c . "b\<CR>"
  let c += 1
endwhile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set minimum window height
set winminheight=0
" Close window
nnoremap <silent> <C-q>  :wincmd q<CR>
" Switch between windows split easily
nnoremap <silent> <C-h>  :wincmd h<CR>
nnoremap <silent> <C-j>  :wincmd j<CR>
nnoremap <silent> <C-k>  :wincmd k<CR>
nnoremap <silent> <C-l>  :wincmd l<CR>
" Resize windows
nnoremap <silent> <A-h>  :wincmd <<CR>
nnoremap <silent> <A-j>  :wincmd +<CR>
nnoremap <silent> <A-k>  :wincmd -<CR>
nnoremap <silent> <A-l>  :wincmd ><CR>
" Reset windows size
nnoremap <silent> <A-=>  :wincmd =<CR>
" Split horizontally/vertically the current buffer
nnoremap <silent> <C-i>  :split<CR>:wincmd j<CR>
nnoremap <silent> <C-o>  :vsplit<CR>:wincmd l<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit and reload the config file
if has('nvim')
  nnoremap <leader>ev  :edit ~/.config/nvim/init.vim<CR>
  nnoremap <leader>sv  :source ~/.config/nvim/init.vim<CR>
else
  nnoremap <leader>ev  :edit ~/.vimrc<CR>
  nnoremap <leader>sv  :source ~/.vimrc<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP'
" CtrlP will set its local working directory according to this variable:
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files.
" 'a' - like 'c', but only applies when the current working directory outside
"       of CtrlP isn't a direct ancestor of the directory of the current file.
" '0' - or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode='rc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wintabs Plugin                                         (help wintabs-options)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:wintabs_display='statusline'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Cpp-Enhanced-Highlight Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1 " faster, do not cover all cases
"let g:cpp_experimental_template_highlight = 1 " slower, works in most cases
let g:cpp_concepts_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format with autopep8
autocmd FileType python nnoremap <buffer> <C-I> :silent !autopep8 --max-line-length 100 -i %<CR>:silent e<CR>
