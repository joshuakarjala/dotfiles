set nocompatible

call plug#begin('~/.vim/plugged')

" tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-obsession'            " tmux-resurrect's nvim 'session' strategy needs this

" things
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'vim-airline/vim-airline'        " new home of bling/vim-airline
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-startify'
Plug 'dense-analysis/ale'             " replaces archived syntastic

" filetypes and syntax
Plug 'sheerun/vim-polyglot'           " bundles git, javascript, jsx, markdown, csv, tmux, yaml
Plug 'JulesWang/css.vim'
Plug 'othree/html5.vim'

" theme
Plug 'junegunn/seoul256.vim'

call plug#end()
