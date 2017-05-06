command SC setlocal spell spelllang=en_us " Enable spell check.
command SCO setlocal nospell " Disable spell check.

" Borrowed from https://github.com/toranb/dotfiles
" Requires vim-over
function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction
