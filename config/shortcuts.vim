" Map ctrl-s to save and ctrl-q to quit.
nmap <c-s> :w<CR>
nmap <c-q> :q<CR>

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
nnoremap <Leader><Left> :vertical resize +2<CR>
nnoremap <Leader><Right> :vertical resize -2<CR>
nnoremap <Leader><Up> :resize +2<CR>
nnoremap <Leader><Down> :resize -2<CR>

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

" Copy file path
nnoremap <LocalLeader>f :let @+=expand('%')<CR>

" Tab to navigate to next Snipmate anchor point
imap <Tab> <Plug>snipMateNextOrTrigger

" Environment-dependent
let s:uname = system("uname")
if s:uname == "Darwin\n"
  " Copy to clipboard
  vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>
endif

