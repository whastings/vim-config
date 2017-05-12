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