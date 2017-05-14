let s:uname = system("uname")
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'tomtom/tcomment_vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'garbas/vim-snipmate'
  Plugin 'scrooloose/syntastic'
  Plugin 'pangloss/vim-javascript'
  Plugin 'tpope/vim-markdown'
  Plugin 'jeffkreeftmeijer/vim-numbertoggle'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tomtom/tlib_vim' " For vim-snipmate.
  Plugin 'MarcWeber/vim-addon-mw-utils' " For vim-snipmate.
  Plugin 'tpope/vim-surround'
  Plugin 'elzr/vim-json'
  Plugin 'Raimondi/delimitMate'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'bkad/CamelCaseMotion'
  Plugin 'bling/vim-airline'
  Plugin 'mxw/vim-jsx'
  Plugin 'gregsexton/MatchTag'
  Plugin 'othree/xml.vim'
  Plugin 'tpope/vim-endwise'
  Plugin 'AndrewRadev/splitjoin.vim'
  Plugin 'junegunn/fzf.vim'
  if s:uname == "Darwin\n"
    Plugin 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --all' }
  else
    Plugin 'junegunn/fzf', { 'dir': '~/dot-files/vendor/fzf', 'do': './install --all' }
  endif
  Plugin 'flowtype/vim-flow'
call vundle#end()
filetype plugin indent on
syntax on
