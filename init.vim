call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
Plug 'evedovelli/rst-robotframework-syntax-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'wincent/terminus'
Plug 'jszakmeister/vim-togglecursor'
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'kadekillary/subtle_solo'
Plug 'crusoexia/vim-monokai'
Plug 'crusoexia/vim-dracula'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'nightsense/nemo'
Plug 'kadekillary/skull-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'encody/nvim'
Plug 'AlessandroYorba/Despacio'
Plug 'blueshirts/darcula'
Plug 'Yggdroot/indentLine'
"Plug 'Valloric/YouCompleteMe'
Plug 'Chiel92/vim-autoformat'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()

" Indent Line
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_char = '│' " You can also use one of ¦, ┆, │, ⎸, or ▏ to display more beautiful lines.

" Autoformat
let g:formatdef_my_custom_cpp = '"clang-format --style=file --assume-filename=/home/natan/.dotfiles/.clang-format"'
let g:formatters_cpp = ['my_custom_cpp']
nnoremap <C-I> :Autoformat<CR>

" Language-Server
let g:LanguageClient_serverCommands = {
            \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
            \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
            \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
            \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
            \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/YOUR_USERNAME/.config/nvim/settings.json'
" https://github.com/autozimu/LanguageClient-neovim/issues/379 LSP snippet is not supported
let g:LanguageClient_hasSnippetSupport = 0

nnoremap <F3> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <C-K> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

augroup LanguageClient_config
    au!
    au BufEnter * let b:Plugin_LanguageClient_started = 0
    au User LanguageClientStarted setl signcolumn=yes
    au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
    au User LanguageClientStopped setl signcolumn=auto
    au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
    au CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif
augroup END

" CCLS
nn <silent> <leader>xh :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
nn <silent> <leader>xj :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
nn <silent> <leader>xk :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
nn <silent> <leader>xl :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>
" bases
nn <silent> <leader>xb :call LanguageClient#findLocations({'method':'$ccls/inheritance'})<cr>
" bases of up to 3 levels
nn <silent> <leader>xB :call LanguageClient#findLocations({'method':'$ccls/inheritance','levels':3})<cr>
" derived
nn <silent> <leader>xd :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> <leader>xD :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true,'levels':3})<cr>
" caller
nn <silent> <leader>xc :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>
" callee
nn <silent> <leader>xC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<cr>
" $ccls/member
" nested classes / types in a namespace
nn <silent> <leader>xs :call LanguageClient#findLocations({'method':'$ccls/member','kind':2})<cr>
" member functions / functions in a namespace
nn <silent> <leader>xf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<cr>
" member variables / variables in a namespace
nn <silent> <leader>xm :call LanguageClient#findLocations({'method':'$ccls/member'})<cr>

" NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Auto open if no files are given as argument
"function! StartUp()
"    if 0 == argc()
"        NERDTree
"    end
"endfunction
"autocmd VimEnter * call StartUp()
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ALE
let g:ale_enabled = 0
let g:airline#extensions#ale#enabled=1
let g:ale_completion_enabled = 1

" YouCompleteMe
let g:ycm_server_python_interpreter="/usr/bin/python2"

" UtilSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'

" activate deoplete
let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1 " set to 1 if you want to disable autocomplete

set cursorline

"set guicursor=n-v-c:block-Cursor-blinkon0,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
set guicursor=n-v-c:block-Cursor-blinkon0

set clipboard=unnamedplus

set termguicolors
set background=dark
"colorscheme darcula
"let g:airline_theme='atomic'
"colorscheme monokai
let g:airline_theme='dark'
let ayucolor="mirage"   " dark, mirage or light
colorscheme ayu
"let g:airline_theme='ayu_mirage'

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
match OverLength /\%100v/
autocmd WinEnter * match OverLength /\%100v./

" Get off my lawn
nnoremap <Left> :echoe "Fuck you! Use 'h'."<CR>
nnoremap <Right> :echoe "Fuck you! Use 'l'."<CR>
nnoremap <Up> :echoe "Fuck you! Use 'k'."<CR>
nnoremap <Down> :echoe "Fuck you! Use 'j'."<CR>

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

"do auto wrap lines
set nowrap

"show line numbers relative to cursor
set relativenumber

"allow normal mouse
set mouse=a

"show live panel for substitute command
set inccommand=split

"auto change working directory to opened dir
"set autochdir

"define custom control key
let mapleader=" "

"""Costum Keymaps"""
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>sb :set scb!<CR>

"nnoremap <silent><C-J> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><C-K> :set paste<CR>m`O<Esc>``:set nopaste<CR>

nnoremap <leader>p :Files<cr>
nnoremap <leader>f :Ag<space>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFocus<CR>

nnoremap <C-s> :w<cr>

nnoremap <A-j> ddp
nnoremap <A-k> ddkP
nnoremap <A-J> yyp
nnoremap <A-K> yyP

vnoremap <A-j> dp
vnoremap <A-k> dkP
vnoremap <A-J> dPP
vnoremap <A-K> dPP

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
" Jump to a buffer by name
nnoremap <leader>bb :b

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
let g:airline_powerline_fonts = 0

