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
Plug 'djoshea/vim-autoread'                                             " Auto reload files changed externally
Plug 'Yggdroot/indentLine'                                              " Display the indention levels with vertical lines
Plug 'neoclide/coc.nvim', {'branch': 'release'}                         " Intellisense engine
Plug 'jackguo380/vim-lsp-cxx-highlight', { 'for': ['c', 'cpp'] }        " C/C++/ObjC semantic highlighting with LSP
Plug 'francoiscabrol/ranger.vim'                                        " Ranger integration in vim and neovim
Plug 'tpope/vim-fugitive'                                               " A Git wrapper
Plug 'airblade/vim-gitgutter'                                           " Git diff in the gutter (sign column) and hunks

if has('nvim-0.4') || has('patch-8.1.1967')
    Plug 'rbgrouleff/bclose.vim'                                        " Deleting a buffer without closing the window (needed for Ranger plugin)
endif

" Syntax
Plug 'sheerun/vim-polyglot'                                             " A collection of language packs
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }                    " i3 syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }        " Enhanced C and C++ syntax highlighting
Plug 'evedovelli/rst-robotframework-syntax-vim', { 'for': 'rstrobot' }  " Extends RST syntax

" Colorschemes
Plug 'w0ng/vim-hybrid'                                                  " colorscheme hybrid
Plug 'natanaeljr/edge'                                                  " colorscheme edge
Plug 'rakr/vim-one'                                                     " colorscheme one
Plug 'natanaeljr/plastic.vim'                                           " colorscheme plastic
Plug 'lifepillar/vim-solarized8'                                        " colorscheme solarized8
Plug 'NLKNguyen/papercolor-theme'                                       " colorscheme PaperColor
Plug 'morhetz/gruvbox'                                                  " colorscheme gruvbox
call plug#end()

" Install new plugins
nnoremap <leader>pi  :PlugInstall<CR>
" Clean unused plugins
nnoremap <leader>pc  :PlugClean<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shell
set shell=/bin/zsh
" Enables a menu at the bottom of the window
set wildmenu
set wildmode=list:longest,full

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
" Custom highlight
syntax match Doxygen '\v\\brief'
syntax match Doxygen '\v\\param'
syntax match Doxygen '\v\\return'
highlight link Doxygen Todo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
if has('termguicolors')
  set termguicolors
endif
set background=dark
colorscheme plastic

" Disable background colors
"highlight Normal ctermbg=NONE guibg=NONE
"highlight LineNr ctermbg=NONE guibg=NONE
"highlight NonText ctermbg=NONE guibg=NONE
"highlight SignColumn ctermbg=NONE guibg=NONE
"let g:gitgutter_override_sign_column_highlight = 0 " Needed for GitGutter

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:fvim_loaded')
    " Small font size
    set guifont=-
    set guifont=-
    set guifont=-
    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " Tab width
set shiftwidth=4    " One indentation level width
set expandtab       " Use spaces instead of tabs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline              " Highlight current line
set nowrap                  " Wrap/nowrap lines
set number relativenumber   " Display line numbers
set signcolumn=yes          " Always show signcolumn
set updatetime=500          " Update time which the swap file will be written to disk

set mouse=nv                " Enable mouse support in Normal and Visual mode
set scrolloff=1             " Always show at least one line above/below the cursor
set sidescrolloff=5         " Always show at least one line left/right of the cursor
set notimeout               " Remove timeout for partially typed commands

set list                    " Make whitespace characters visible
set listchars=tab:»·,trail:•

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search/Substitute
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Case insensitive searching
set ignorecase
" Automatically switch to case sensitive if used any capitals
set smartcase

if has('nvim')
    " Substitute live preview
    set inccommand=nosplit
endif

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
" Search buffers
noremap  <C-b>       :CtrlPBuffer<CR>
" List buffers
nnoremap <leader>bl  :buffers<CR>
" Go to buffer
nnoremap <S-Tab>     :buffers<CR>:b<space>
nnoremap <leader>bb  :buffers<CR>:b<space>
" Go to last buffer
nnoremap <leader>b$  :WintabsLast<CR>
" Go to first buffer
nnoremap <leader>b0  :WintabsFirst<CR>
" Go to next buffer
nnoremap )           :WintabsNext<CR>
nnoremap <leader>bn  :WintabsNext<CR>
" Go to previous buffer
nnoremap (           :WintabsPrevious<CR>
nnoremap <leader>bp  :WintabsPrevious<CR>
" Move buffers in the wintabs buffer list
nnoremap <C-0>       :WintabsMove 1<CR>
nnoremap <C-9>       :WintabsMove -1<CR>
" Delete specific buffer
nnoremap <leader>bd  :buffers<CR>:bd<space>
" Close current buffer
nnoremap <leader>b%  :WintabsClose<CR>
" Delete current buffer discarding changes
nnoremap <leader>b!  :bdelete!<CR>
" Go to last abandoned buffer
nnoremap <leader>b#  :b#<CR>
" Bring all buffers to current window
nnoremap <leader>ba  :WintabsAll<CR>
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
" netwr
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0        " Do not show netrw banner
let g:netrw_liststyle = 3     " List style: thin, long, wide, and tree listings
let g:netrw_browse_split = 4  " Open files in previous window
let g:netrw_altv = 0          " Open files in right split
let g:netrw_winsize = 15      " Initial buffer size in percentage

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
let g:ctrlp_working_path_mode=''
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden =1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wintabs Plugin                                         (help wintabs-options)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:wintabs_display='tabline'  " Use the status line to display the buffer list
let g:wintabs_reverse_order=1       " Add new buffers to the beginning of the wintabs list

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
" C/C++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format with clang-format
autocmd FileType cpp nnoremap <buffer> <C-m> :w<CR>:silent !clang-format-3.5 -i %<CR>:silent e<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format with autopep8
autocmd FileType python nnoremap <buffer> <C-m> :w<CR>:silent !autopep8 --max-line-length 100 -i %<CR>:silent e<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┊'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <c-space> for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()
" Use <cr> to confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Go to declaration
nnoremap <silent> ga   <Plug>(coc-declaration)
" Go to definition
nnoremap <silent> gd   <Plug>(coc-definition)
" Go to implementation
nnoremap <silent> ge   <Plug>(coc-implementation)
" Find references
nnoremap <silent> gr   <Plug>(coc-references)
" Show documentation
nnoremap <silent> gi   :call CocAction('doHover')<CR>
" Rename a symbol
nnoremap <silent> <leader>re :call CocAction('rename')<CR>
" Refactor a symbol
nnoremap <silent> <leader>rf :call CocAction('refactor')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lsp-cxx-highlight Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LspCxxHlSymClass          ctermfg=80  guifg=#56b6c2
highlight LspCxxHlSymStruct         ctermfg=80  guifg=#56b6c2
highlight LspCxxHlSymTypeAlias      ctermfg=80  guifg=#56b6c2
highlight LspCxxHlSymTypeParameter  ctermfg=80  guifg=#56b6c2
highlight LspCxxHlSymEnum           ctermfg=50  guifg=#56c2b0
highlight LspCxxHlSymEnumMember     ctermfg=209 guifg=#d19a66
highlight LspCxxHlSymConstant       ctermfg=111 guifg=#89b6ff
highlight LspCxxHlSymVariable       ctermfg=254 guifg=#d4d7d9
highlight LspCxxHlSymNamespace      ctermfg=7   guifg=#a9b2c3
highlight LspCxxHlSymOperator       ctermfg=203 guifg=#e06c75
highlight LspCxxHlSymMacro          ctermfg=209 guifg=#d19a66

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To use floating/popup windows for hunk previews
let g:gitgutter_preview_win_floating = 0
" Don't auto setup any mappings
let g:gitgutter_map_keys = 0
" Customize symbols
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▌'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'
