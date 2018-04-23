set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'tmux-plugins/vim-tmux-focus-events'

" tpope's the shit
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
" " ... I mean come on?
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-obsession'

" things
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'

" filetypes and syntax
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-markdown'
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'JulesWang/css.vim'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'othree/html5.vim'
" Plug 'davidoc/taskpaper.vim'
" Plug 'ingydotnet/yaml-vim'
" Plug 'scrooloose/syntastic'
" Plug 'mxw/vim-jsx'
" Plug 'tmux-plugins/vim-tmux'

" stupid themes
Plug 'junegunn/seoul256.vim'
Plug 'romainl/Apprentice'
Plug 'w0ng/vim-hybrid'
Plug 'sk1418/last256'
Plug 'cocopon/iceberg.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'

Plug 'chrisbra/csv.vim'

call plug#end()

