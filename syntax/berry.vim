" Vim syntax file
" Language: Berry Script Language
" Maintainer:   Robert Klep <robert@klep.name>
" License: VIM License
" URL: https://github.com/robertklep/vim-berry

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "berry"

syntax keyword berryKeyword var static def class return
syntax keyword berryKeyword self super import as class
highlight link berryKeyword Keyword

syntax keyword berryBoolean true false nil
highlight link berryBoolean Boolean

syntax keyword berryBuiltin assert bool input classname classof
syntax keyword berryBuiltin number real bytes compile map list
syntax keyword berryBuiltin int isinstance print range str super
syntax keyword berryBuiltin module size issubclass open file type call
highlight link berryBuiltin Function

syntax keyword berryConditional if else elif end
highlight link berryConditional Conditional

syntax keyword berryRepeat for while do
highlight link berryRepeat Repeat

syntax keyword berryException try except raise
highlight link berryException Exception

syntax match berrySingleLineComment "#.*$"
highlight link berrySingleLineComment Comment

syntax region berryMultiLineComment start=/#\-/ end=/\-#/
highlight link berryMultiLineComment Comment

syntax region berryDoubleQuotedString start=/\v"/ skip=/\v\\./ end=/\"/ oneline
highlight link berryDoubleQuotedString String

syntax region berrySingleQuotedString start=/\v'/ skip=/\v\\./ end=/\'/ oneline
highlight link berrySingleQuotedString String

syntax match berryAssignOperator "\v\="
syntax match berryAssignOperator "\v\:\="
syntax match berryAssignOperator "\v\="
syntax match berryAssignOperator "\v\+\="
syntax match berryAssignOperator "\v\-\="
syntax match berryAssignOperator "\v\*\="
syntax match berryAssignOperator "\v\/\="
syntax match berryAssignOperator "\v\%\="
syntax match berryAssignOperator "\v\&\="
syntax match berryAssignOperator "\v\|\="
syntax match berryAssignOperator "\v\^\="
syntax match berryAssignOperator "\v\<<\="
syntax match berryAssignOperator "\v\>>\="
highlight link berryAssignOperator Operator

syntax match berryBinaryOperator "\v\<"
syntax match berryBinaryOperator "\v\<"
syntax match berryBinaryOperator "\v\<\="
syntax match berryBinaryOperator "\v\=\="
syntax match berryBinaryOperator "\v\!\="
syntax match berryBinaryOperator "\v\>"
syntax match berryBinaryOperator "\v\>\="
syntax match berryBinaryOperator "\v\&\&"
syntax match berryBinaryOperator "\v\<\<"
syntax match berryBinaryOperator "\v\>\>"
syntax match berryBinaryOperator "[&^+\-*/%]"
highlight link berryBinaryOperator Operator

syntax match berryUnaryOperator "[!~\-]"
highlight link berryUnaryOperator Operator

syntax match berryRangeOperator "\v\.\."
highlight link berryRangeOperator Operator

syntax match berryNumber /\i\@<![-+]\?\d\+/  " integer
syntax match berryNumber "\v0[xX]\x+"        " hex
highlight link berryNumber Number

syntax match berryFloat /\i\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/
highlight link berryFloat Float
