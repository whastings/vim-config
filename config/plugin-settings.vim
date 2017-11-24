" Syntastic:
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = [] " TODO: Find a good HTML linter.

" ALE:
let g:ale_lint_on_text_changed = 'never'

" TComment:
map <LocalLeader>c :TComment<CR>

" NERDTree:
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
nnoremap <C-t> :NERDTreeToggle<CR>

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
let g:fzf_history_options =
   \ '--reverse ' .
   \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
nmap <C-p> :FZF -m<CR>
nmap <LocalLeader>a :FzfAg<Space>
nnoremap <C-b> :FzfHistory<cr>
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

" vim-jsx
let g:jsx_ext_required = 0

" vim-fixmyjs
let g:fixmyjs_use_local = 1
let g:fixmyjs_rc_path = '.eslintrc.js'

" vim-closetag
let g:closetag_filenames = '*.html,*.jsx,*.js'
let g:closetag_xhtml_filenames = '*.html,*.jsx,*.js'
let g:closetag_close_shortcut = 'C->'

" neoformat
" See: https://hashrocket.com/blog/posts/writing-prettier-javascript-in-vim
let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 100\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
augroup END
nmap <Leader>F :Neoformat<CR>
vmap <Leader>F :Neoformat<CR>

" Ack.vim
cnoreabbrev Ack Ack!
