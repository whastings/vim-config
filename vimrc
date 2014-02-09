colorscheme darkBlue

" # Settings:
filetype plugin on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number " Show line numbers.
set splitbelow
set splitright
set colorcolumn=80 " Add a ruler.
highlight ColorColumn ctermbg=lightgrey " Make column gray.

" Key Bindings:
" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i
set pastetoggle=<F2>
map <C-t> :NERDTreeToggle<CR>
map c \c " Map just c to comment toggle.

execute pathogen#infect()

" Remove trailing whitespace:
autocmd BufWritePre * :%s/\s\+$//e

" Syntastic:
let g:syntastic_check_on_open = 1

