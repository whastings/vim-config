" BUNDLES:

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'scrooloose/nerdcommenter'
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
  Plugin 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --all' }
  Plugin 'junegunn/fzf.vim'
call vundle#end()
filetype plugin indent on
syntax on


" SETTINGS:

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


" COLORS:

colorscheme darkBlue
highlight ColorColumn ctermbg=darkgrey " Make column gray.
highlight Comment term=bold ctermfg=lightblue


" KEY BINDINGS:

" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>

" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i

" jk to easily quit insert mode
inoremap jk <ESC>

" Use CTRL-h and CTRL-l to move horizontally in insert mode.
imap <C-h> <Left>
imap <C-l> <Right>

set pastetoggle=<F2>
map <C-h> :set hls!<CR> " Toggle search result highlighting.

" Toggle semicolon at end of current line.
nnoremap ;; :s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR><CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR>
map <Leader>t :tabe <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR>

" Use Ctrl + j/k/l/h for pane switching.
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Pane resizing:
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" Visually select the text that was last edited/pasted.
nmap gV `[v`]`

" Truly delete (write to blackhole register).
nmap <Leader>d "_d

" Find & replace
nmap R :call VisualFindAndReplace()<CR>
vmap R :call VisualFindAndReplaceWithSelection()<CR>

" Command mode up & down:
cmap <C-k> <Up>
cmap <C-j> <Down>

" Save and reopen session:
nmap <Leader>m :mksession! ~/.vim_session <cr>
nmap <Leader>M :source ~/.vim_session <cr>

" Camel-case motion:
nmap <silent> W <Plug>CamelCaseMotion_w
nmap <silent> B <Plug>CamelCaseMotion_b
nmap <silent> E <Plug>CamelCaseMotion_e


" CUSTOM COMMANDS:
command SC setlocal spell spelllang=en_us " Enable spell check.
command SCO setlocal nospell " Disable spell check.


" PLUGIN SETTINGS:

" Syntastic:
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = [] " TODO: Find a good HTML linter.

" NERDCommenter:
let g:NERDCustomDelimiters = {
  \ 'scss': { 'left': '// ' }
\ }

" NERDTree:
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1

" vim-json:
let g:vim_json_syntax_conceal = 0 " Don't hide key quotes.

" delimitMate:
let delimitMate_matchpairs_custom = '(:),[:],{:}' " No <> in HTML.
au FileType html let b:delimitMate_matchpairs = delimitMate_matchpairs_custom
au FileType html.handlebars let b:delimitMate_matchpairs = delimitMate_matchpairs_custom
au FileType javascript.jsx let b:delimitMate_matchpairs = delimitMate_matchpairs_custom

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
let g:fzf_command_prefix = 'Fzf'
nmap <C-p> :FZF -m<CR>
nmap <LocalLeader>a :FzfAg<Space>
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
endif

" vim-flow
function FlowOn()
  let g:flow#enable = 1
  let g:flow#omnifunc = 1
  setl omnifunc=flowcomplete#Complete
endfunction
function FlowOff()
  let g:flow#enable = 0
  let g:flow#omnifunc = 0
endfunction
call FlowOff() " Off by default since the plugin runs on files without @flow
command FlowOn call FlowOn()
command FlowOff call FlowOff()


" SCRIPTS:

" Remove trailing whitespace:
autocmd BufWritePre * :%s/\s\+$//e

" Borrowed from https://github.com/toranb/dotfiles
function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction


" FILETYPES:

autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
autocmd BufNewFile,BufRead *.json.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.jst.ejs set filetype=html
autocmd BufNewFile,BufRead *.ejs set filetype=html
augroup writing
    au!
    au BufNewFile,BufRead *.md,*.markdown,*.rst setlocal textwidth=100
    au BufNewFile,BufRead *.md,*.markdown,*.rst setlocal wrapmargin=2
    au BufNewFile,BufRead *.md,*.markdown,*.rst setlocal spell
augroup END
