" BUNDLES:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'kien/ctrlp.vim'
  Plugin 'gregsexton/MatchTag'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'garbas/vim-snipmate'
  Plugin 'ervandew/supertab'
  Plugin 'scrooloose/syntastic'
  Plugin 'jgdavey/vim-blockle'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'tpope/vim-markdown'
  Plugin 'jeffkreeftmeijer/vim-numbertoggle'
  Plugin 'honza/vim-snippets'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'sukima/xmledit'
  Plugin 'jgdavey/tslime.vim'
  Plugin 'tomtom/tlib_vim' " For vim-snipmate.
  Plugin 'MarcWeber/vim-addon-mw-utils' " For vim-snipmate.
call vundle#end()
filetype plugin indent on

" SETTINGS:
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number " Show line numbers.
set splitbelow
set splitright
set colorcolumn=80 " Add a ruler.
highlight ColorColumn ctermbg=lightgrey " Make column gray.
set laststatus=2 " Always show status line.
set tags=./.ctags; " Source for ctags tags.
:ino <C-C> <Esc> " Ensure ctrl + c triggers insertleave event.
colorscheme darkBlue

" KEY BINDINGS:
" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i
set pastetoggle=<F2>
map <C-t> :NERDTreeToggle<CR>
map <C-h> :set hls!<CR>
map C \c " Map just C to comment toggle.
" Toggle semicolon at end of current line.
nnoremap ;; :s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>
" Edit another file in the same directory as the current file
" " uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR><CR><CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR><CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR><CR>
map <Leader>T :call Send_to_Tmux("cd " . escape(expand('%:p:h'), ' ') . "\n")<CR>

" Remove trailing whitespace:
autocmd BufWritePre * :%s/\s\+$//e

" PLUGIN SETTINGS:

" Syntastic:
let g:syntastic_check_on_open = 1

" Emmet:
let g:user_emmet_leader_key='<C-Z>'

" TSlime:
let g:tslime = {}
let g:tslime['session'] = 'home'
let g:tslime['window'] = 'editor'
let g:tslime['pane'] = 1

" FILETYPES:
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
autocmd BufNewFile,BufRead *.json.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd BufNewFile,BufRead *.jst.ejs set filetype=html
autocmd BufNewFile,BufRead *.ejs set filetype=html
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
augroup END
