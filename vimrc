set nocompatible
set backspace=2
set nu
set ruler
set autoindent
set smartindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set term=xterm
set whichwrap+=<,>,[,]
set backspace=indent,eol,start
set hlsearch

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
