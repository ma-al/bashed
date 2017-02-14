set nocompatible
set nu
set ruler

set autoindent
set smartindent
set expandtab
set smarttab

au BufNewFile,BufRead *.yml,*.yaml,*.json,*.html,*.css
    \ set tabstop=2 softtabstop=2 shiftwidth=2

au BufNewFile,BufRead *.py,*.md
    \ set tabstop=4 softtabstop=4 shiftwidth=4 |
    \ set textwidth=79

set term=xterm
set whichwrap+=<,>,[,]
set hlsearch

set backspace=2
set backspace=indent,eol,start

colorscheme peachpuff
syntax on
 
function s:ForbidReplace()
    if v:insertmode isnot# 'i'
        call feedkeys("\<Insert>", "n")
    endif
endfunction

augroup ForbidReplaceMode
    autocmd!
    autocmd InsertEnter  * call s:ForbidReplace()
    autocmd InsertChange * call s:ForbidReplace()
augroup END


for f in argv()
  let perms = getfperm(f)
  let fsize = getfsize(f)
  let ftype = getftype(f)

  if perms !~ 'w' && ftype == 'file'
    echomsg "(" f ") does not seem writable "
    quit
  endif

  if isdirectory(f)
    echomsg "Not opening a directory:" f
    quit
  endif
endfor
