call plug#begin('~/.config/nvim/plugged')
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
" Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'gabrielelana/vim-markdown'
Plug 'morhetz/gruvbox'
Plug 'urso/haskell_syntax.vim'
Plug 'ervandew/supertab'
Plug 'jceb/vim-orgmode'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" Autocompletion settings
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

set t_Co=256
colorscheme srcery
set number
set relativenumber

" 4 spaces instead of tabs
set softtabstop=4
set shiftwidth=4
set expandtab

" Set leaderkey to ,
let mapleader=","

" Set local leaderkey to \
let localleader="\\"

let g:airline_powerline_fonts = 1
set shell=bash

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1

" Markdown Folding settings
let g:vim_markdown_folding_level = 3

" Configuration for Ocaml's Merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Language server set up
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'ocaml':  ['ocamllsp'],
\}

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
