" Natanael Josue Rabello's
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"

let mapleader='\\'

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'             " A collection of language packs
Plug 'PotatoesMaster/i3-vim-syntax'     " i3 syntax highlight
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy finder: file, buffer, mru, tag
Plug 'octol/vim-cpp-enhanced-highlight' " Enhanced C and C++ syntax highlighting
" Colorschemes
Plug 'w0ng/vim-hybrid'              " colorscheme hybrid
Plug 'sainnhe/edge'                 " colorscheme edge
Plug 'rakr/vim-one'                 " colorscheme one
Plug 'lifepillar/vim-solarized8'    " colorscheme solarized8
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " Tab width
set shiftwidth=4    " One indentation level width
set expandtab       " Use spaces instead of tabs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber  " Display line numbers
set nowrap                 " Wrap/nowrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste/Cut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus  " Default clipboard register (+ for X Window)

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
" CtrlP Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
" CtrlP will set its local working directory according to this variable:
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files.
" 'a' - like 'c', but only applies when the current working directory outside
"       of CtrlP isn't a direct ancestor of the directory of the current file.
" '0' - or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'rc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Cpp-Enhanced-Highlight Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1 " faster, do not cover all cases
"let g:cpp_experimental_template_highlight = 1 " slower, works in most cases
let g:cpp_concepts_highlight = 1
