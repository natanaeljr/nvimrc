" Natanael Josue Rabello's
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"

let mapleader='\\'

"
" Setup
"
" Download a plugin manager
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif
" Link vim config with nvim config
if ! has('nvim') && ! filereadable(expand('~/.vim/autoload/plug.vim'))
    silent !ln -s ~/.config/nvim ~/.vim
endif

"
" Plugins
"
call plug#begin('~/.config/nvim/plugged')

call plug#end()

"
" Tab
"
set tabstop=4       " Tab width
set shiftwidth=4    " One indentation level width
set expandtab       " Use spaces instead of tabs

"
" Lines
"
set number relativenumber   " Display line numbers
set nowrap                  " Wrap/nowrap lines

"
" Copy/Paste/Cut
"
set clipboard=unnamedplus   " Default clipboard register (+ for X Window clipboard)

