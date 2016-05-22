hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "bwop"

hi  Normal        ctermfg=7
hi  Directory     ctermfg=gray
hi  Search        ctermfg=white     ctermbg=blue
hi  MoreMsg       ctermfg=gray
hi  LineNr        ctermfg=darkgray
hi  Question      ctermfg=gray
hi  Comment       ctermfg=gray
hi  Constant      ctermfg=white
hi  Special       ctermfg=white
hi  Identifier    ctermfg=white
hi  PreProc       ctermfg=white
hi  Error         ctermfg=7         ctermbg=1
hi  Todo          ctermfg=0         ctermbg=7
hi  String        ctermfg=darkgray
hi  Function      ctermfg=white
hi  Statement     ctermfg=white
hi  Include       ctermfg=darkgray
hi  StorageClass  ctermfg=white
hi  Type          ctermfg=white
hi  Defined       ctermfg=white
hi  NonText       ctermfg=darkgray
hi  link          Character         String
hi  link          Number            Constant
hi  link          Boolean           Constant
hi  link          Float             Number
hi  link          Conditional       Statement
hi  link          Repeat            Statement
hi  link          Label             Statement
hi  link          Operator          Statement
hi  link          Keyword           Statement
hi  link          Exception         Statement
hi  link          Macro             Include
hi  link          PreCondit         PreProc
hi  link          Structure         Type
hi  link          Typedef           Type
hi  link          Tag               Special
hi  link          SpecialChar       Special
hi  link          Delimiter         Special
hi  link          SpecialComment    Special
hi  link          Debug             Special
