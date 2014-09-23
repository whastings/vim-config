" BUNDLES:

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'kien/ctrlp.vim'
  Plugin 'mattn/emmet-vim'
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
  Plugin 'majutsushi/tagbar'
  Plugin 'sukima/xmledit'
  Plugin 'jgdavey/tslime.vim'
  Plugin 'tomtom/tlib_vim' " For vim-snipmate.
  Plugin 'MarcWeber/vim-addon-mw-utils' " For vim-snipmate.
  Plugin 'matze/vim-move'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-surround'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'hail2u/vim-css3-syntax'
  Plugin 'elzr/vim-json'
  Plugin 'kchmck/vim-coffee-script'
call vundle#end()
filetype plugin indent on
syntax on
" Load powerline.
set rtp+=~/dot-files/vendor/powerline/powerline/bindings/vim


" SETTINGS:

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number " Show line numbers.
set splitbelow
set splitright
set colorcolumn=80 " Add a ruler.
set laststatus=2 " Always show status line.
set tags=./.ctags; " Source for ctags tags.
:ino <C-C> <Esc> " Ensure ctrl + c triggers insertleave event.


" COLORS:

colorscheme darkBlue
highlight ColorColumn ctermbg=lightgrey " Make column gray.
highlight Comment term=bold ctermfg=lightblue


" KEY BINDINGS:

" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>

" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i

set pastetoggle=<F2>
map <C-t> :NERDTreeTabsToggle<CR><C-n>
map <C-h> :set hls!<CR> " Toggle search result highlighting.
map C \c " Map just C to comment toggle.
nmap <C-l> :TagbarToggle<CR>

" Toggle semicolon at end of current line.
nnoremap ;; :s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR><CR><CR><C-n>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR><CR><C-n>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR><CR><C-n>
map <Leader>T :call Send_to_Tmux("cd " . escape(expand('%:p:h'), ' ') . "\n")<CR>

" Map ctrl-s to save and ctrl-q to quit.
nmap <c-s> :w<CR>
nmap <c-q> :q<CR>

" Use space to scroll
nmap <Space> <C-e>
nmap <C-@> <C-y>

" Use J and K for pane switching.
nmap J <C-w>h
nmap K <C-w>l
let NERDTreeMapJumpLastChild='\j'
let NERDTreeMapJumpFirstChild='\k'


" Use ctrl + j and ctrl + k for tab switching.
nmap <C-j> gT
nmap <C-k> gt
let NERDTreeMapJumpNextSibling='\j'
let NERDTreeMapJumpPrevSibling='\k'

" SnipMate shortcuts:
imap <C-n> <Plug>snipMateNextOrTrigger


" PLUGIN SETTINGS:

" Syntastic:
let g:syntastic_check_on_open = 1

" Emmet:
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
imap <C-y> <Esc>:call emmet#expandAbbr(0, "")<CR>i

" TSlime:
let g:tslime = {}
let g:tslime['session'] = 'home'
let g:tslime['window'] = 'editor'
let g:tslime['pane'] = 1

" NERDTree:
let NERDTreeShowLineNumbers=1

" SCRIPTS:

" Remove trailing whitespace:
autocmd BufWritePre * :%s/\s\+$//e

" Properly map alt key:
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw


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
    au BufNewFile,BufRead *.md,*.markdown setlocal textwidth=80
    au BufNewFile,BufRead *.md,*.markdown setlocal wrapmargin=2
augroup END
