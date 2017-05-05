" BUNDLES:

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'mattn/emmet-vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'garbas/vim-snipmate'
  Plugin 'ervandew/supertab'
  Plugin 'scrooloose/syntastic'
  Plugin 'pangloss/vim-javascript'
  Plugin 'tpope/vim-markdown'
  Plugin 'jeffkreeftmeijer/vim-numbertoggle'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'tomtom/tlib_vim' " For vim-snipmate.
  Plugin 'MarcWeber/vim-addon-mw-utils' " For vim-snipmate.
  Plugin 'tpope/vim-surround'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'hail2u/vim-css3-syntax'
  Plugin 'elzr/vim-json'
  Plugin 'Raimondi/delimitMate'
  Plugin 'marijnh/tern_for_vim'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'jlanzarotta/bufexplorer'
  Plugin 'kien/ctrlp.vim'
  Plugin 'bkad/CamelCaseMotion'
  Plugin 'bling/vim-airline'
  Plugin 'osyo-manga/vim-over'
  Plugin 'mxw/vim-jsx'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'gregsexton/MatchTag'
  Plugin 'othree/xml.vim'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'flowtype/vim-flow'
  Plugin 'mileszs/ack.vim'
  Plugin 'tpope/vim-endwise'
  Plugin 'FooSoft/vim-argwrap'
  " TypeScript
  Plugin 'leafgarland/typescript-vim'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'Quramy/tsuquyomi'
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
set colorcolumn=80 " Add a ruler.
set laststatus=2 " Always show status line.
set tags=./.ctags; " Source for ctags tags.
set laststatus=2 " Always show status line."
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

" Folding:
" TODO: Re-enable when I figure out how to keep folds from closing when
" revisiting a Buffer:
"set foldmethod=syntax " Enable code-folding
"set foldlevelstart=1
"au BufRead * normal zR " Have all code-folds open by default.
"autocmd InsertLeave,WinEnter,BufEnter * setlocal foldmethod=syntax
"autocmd InsertEnter,WinLeave,BufLeave,BufHidden * setlocal foldmethod=manual


" COLORS:

colorscheme darkBlue
highlight ColorColumn ctermbg=darkgrey " Make column gray.
highlight Comment term=bold ctermfg=lightblue


" KEY BINDINGS:

" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>

" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i

" Use CTRL-h and CTRL-l to move horizontally in insert mode.
imap <C-h> <Left>
imap <C-l> <Right>

set pastetoggle=<F2>
map <C-t> :NERDTreeTabsToggle<CR><C-n>
map <C-h> :set hls!<CR> " Toggle search result highlighting.
map C \c " Map just C to comment toggle.
nmap <C-l> :TagbarToggle<CR>

" Toggle semicolon at end of current line.
nnoremap ;; :s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR><CR><CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR><CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR><CR>
map <Leader>t :tabe <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR><CR><CR>

" Have adjacent Tmux pane cd to current Vim directory.
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

" Pane resizing:
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" Use f for toggling code-folds open and closed.
nmap f za

" Visually select the text that was last edited/pasted.
nmap gV `[v`]`

" Truly delete (write to blackhole register).
nmap <Leader>d "_d

" Moving tabs:
nmap <Leader>l :execute "tabmove" tabpagenr() <CR>
nmap <Leader>h :execute "tabmove" tabpagenr() - 2 <CR>

" ctrl-p:
nmap <C-b> :CtrlPMRU<cr>

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

" Buffers:
nmap <Leader>b :BufExplorer <cr>

" Autocomplete:
imap <C-p> <C-x><C-o>

" argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>


" CUSTOM COMMANDS:
command SC setlocal spell spelllang=en_us " Enable spell check.
command SCO setlocal nospell " Disable spell check.


" PLUGIN SETTINGS:

" Ack.vim:
" Use command that doesn't jump to first result
cnoreabbrev Ack Ack!

" Syntastic:
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = [] " TODO: Find a good HTML linter.
let g:syntastic_typescript_checkers = ['tsuquyomi']

" Emmet:
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
imap <C-y> <Esc>:call emmet#expandAbbr(0, "")<CR>i

" TSlime:
let g:tslime = {}
let g:tslime['session'] = 'home'
let g:tslime['window'] = 'editor'
let g:tslime['pane'] = 1

" NERDCommenter:
let g:NERDCustomDelimiters = {
  \ 'scss': { 'left': '// ' }
\ }

" NERDTree:
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1

" ctrl-p:
let g:ctrlp_working_path_mode = 'r' " Use nearest .git as cwd
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|bower_components|tmp|target|dist)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_root_markers = ['.ctrlp_stop']

" vim-json:
let g:vim_json_syntax_conceal = 0 " Don't hide key quotes.

" delimitMate:
let delimitMate_matchpairs_custom = '(:),[:],{:}' " No <> in HTML.
au FileType html let b:delimitMate_matchpairs = delimitMate_matchpairs_custom
au FileType html.handlebars let b:delimitMate_matchpairs = delimitMate_matchpairs_custom
au FileType javascript.jsx let b:delimitMate_matchpairs = delimitMate_matchpairs_custom

" Tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_disable_default_mappings = 1

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

" Properly map alt key:
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

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
    au BufNewFile,BufRead *.md,*.markdown,*.rst setlocal textwidth=80
    au BufNewFile,BufRead *.md,*.markdown,*.rst setlocal wrapmargin=2
    au BufNewFile,BufRead *.md,*.markdown,*.rst setlocal spell
augroup END
