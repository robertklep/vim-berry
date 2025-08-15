" CtrlP-Funky file type adapter
" Language:     Berry Script Language
" Maintainer:   Arnie <arnie97@gmail.com>
" License:      VIM License
" URL:          https://github.com/robertklep/vim-berry

let s:cpo_save = &cpo
set cpo&vim

function! ctrlp#funky#ft#berry#filters()
  let filters = [{
    \ 'pattern': '^\v\s*\C<%(def|class)>\s+',
    \ 'formatter': ['^\v\s*', '', '']
  \ }]

  return filters
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap ts=2 sw=0 et:
