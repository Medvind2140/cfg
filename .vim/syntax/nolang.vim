" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif


"syntax match nolangBackticks "```\zs[^```]\+\ze`"
"syntax match nolangDollars "\'\zs[^$]\+\ze.*\'"
syntax match nolangComment "^##.*$"
syntax match nolangComment2 "^#.*$"
syntax match nolangBullets "^*.*$"

"hi def link nolangBackticks Constant
"hi def link nolangDollars Comment
hi def link nolangComment Type
hi def link nolangComment2 Comment
hi def link nolangBullets Identifier

"syn keyword VariableType CTRL SHIFT CMD ESC ALT SPC
"hi VariableType ctermfg=darkgreen
"hi VariableType ctermfg=darkgrey

syn match potionOperator2 "= .*$" 
syn match potionOperator "\v\/ " 
syn match potionOperator "\v\\ " 
syn match potionOperator "\v\| " 
syn match potionOperator "\v\< "
syn match potionOperator "\v\> "
syn match potionOperator "\v\- "
syn match potionOperator "\v\+ "
syn match potionOperator "\v\$ "
syn match potionOperator "\v\: "
hi link potionOperator Statement
hi link potionOperator2 Comment

let b:current_syntax = 'nolang'
