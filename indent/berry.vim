" Vim indent file
" Language:     Berry Script Language
" Maintainer:   Arnie <arnie97@gmail.com>
" License:      VIM License
" URL:          https://github.com/robertklep/vim-berry

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

let s:cpo_save = &cpo
set cpo&vim

" Call GetBerryIndent() when '\s*end' is found on the current line
setlocal indentkeys+=0=end,0=elif,0=else,0=except
setlocal indentexpr=s:GetBerryIndent()
setlocal autoindent

let b:undo_indent = "setlocal autoindent< indentexpr< indentkeys<"

function s:GetBerryIndent()
  " Find a non-blank line above the current line.
  let prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if prevlnum == 0
    return 0
  endif

  " Add a 'shiftwidth' after lines that start a new block:
  " class, def, if, elif, else, for, while, try, except, '{', '[', '('
  let ind = indent(prevlnum)
  let prevline = getline(prevlnum)
  let midx = match(prevline, '^\v\s*\C%(class|def|if|elif|else|while|for|try|except)>')
  if midx == -1
    let midx = match(prevline, '\v%(\{|\[|\()\s*%(#%([^\-].*)?)?$')
  endif

  " Only add a 'shiftwidth' if what we found previously is not in a comment
  " and an "end" is not present on the same line.
  if midx != -1 &&
    \ prevline !~# '\<end\>' &&
    \ synIDattr(synID(prevlnum, midx + 1, 1), 'name') != 'berryMultiLineComment'
    let ind = ind + shiftwidth()
  endif

  " Subtract a 'shiftwidth' on lines that end the previous block:
  " end, elif, else, except, '}', ']', ')'
  " This is the part that requires 'setlocal indentkeys'.
  let midx = match(getline(v:lnum), '^\v\s*%(\C%(end|elif|else|except)>|}|]|\))')
  if midx != -1 &&
    \ synIDattr(synID(v:lnum, midx + 1, 1), 'name') != 'berryMultiLineComment'
    let ind = ind - shiftwidth()
  endif

  return ind
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap ts=2 sw=0 et:
