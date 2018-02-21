set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number " Show line numbers.
set splitbelow
set splitright
set backspace=indent,eol,start
set incsearch
set colorcolumn=100 " Add a ruler.
set laststatus=2 " Always show status line.
:ino <C-C> <Esc> " Ensure ctrl + c triggers insertleave event.
set cursorline
" Show invisible files:
set listchars=tab:>-,extends:>,precedes:<
set list
set iskeyword+=- " Don't treat dashes as word separators.
set iskeyword+=$ " Keep $ as part of word.
set hidden " Allow unsaved hidden buffers.
" Always use 'very magic mode' and case-insensitive for regexes:
nnoremap / /\v\c
vnoremap / /\v\c
set dir=~/tmp " Use tmp directory for swap files.
set sessionoptions=buffers,curdir,resize,tabpages,winpos,winsize
set backupcopy=yes " Needed for file watchers like webpack-dev-server
let mapleader = "\<Space>"
let maplocalleader="\<Space>"
" Colors:
colorscheme darkBlue
highlight ColorColumn ctermbg=darkgrey " Make column gray.
highlight Comment term=bold ctermfg=lightblue
" Remove trailing whitespace:
autocmd BufWritePre * :%s/\s\+$//e
" Always add comment characters on new line of a comment block.
set formatoptions+=ro
