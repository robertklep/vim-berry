" Vim filetype plugin file
" Language:     Berry Script Language
" Maintainer:   Arnie <arnie97@gmail.com>
" License:      VIM License
" URL:          https://github.com/robertklep/vim-berry

" Only load this plugin file once
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

" Setup built-in options
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal suffixesadd=.be
let b:undo_ftplugin = "setlocal comments< commentstring< suffixesadd<"

" Setup matchit.vim
if exists("loaded_matchit") && !exists("b:match_words")
  let b:match_ignorecase = 0
  let b:match_skip = 's:\v^berry(Single|Multi)(LineComment|QuotedString)$'
  let b:match_words =
    \ '#-:-#,' ..
    \ '\<\(if\|while\|for\|try\|class\|def\|do\)\>:' ..
    \ '\<\(elif\|else\|except\|break\|continue\|return\)\>:\<end\>'
  let b:undo_ftplugin ..= " | unlet! b:match_ignorecase b:match_skip b:match_words"
endif

" Setup browse filter
if (has("gui_win32") || has("gui_gtk")) && !exists("b:browsefilter")
  let b:browsefilter = "Berry Source Files (*.be)\t*.be\n"
  if has("win32")
    let b:browsefilter ..= "All Files (*.*)\t*\n"
  else
    let b:browsefilter ..= "All Files (*)\t*\n"
  endif
  let b:undo_ftplugin ..= " | unlet! b:browsefilter"
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap ts=2 sw=0 et:
