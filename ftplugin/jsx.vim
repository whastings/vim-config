if exists("b:did_ftplugin")
  unlet b:did_ftplugin
  runtime! ftplugin/html.vim
  let b:did_ftplugin = 1
else
  runtime! ftplugin/html.vim
endif
