if exists("b:current_syntax")
    finish
endif

syn keyword quarkKeyword auto 
syn keyword quarkKeyword const static extern export
syn keyword quarkExcept  throw try catch
syn keyword quarkInclude include macro extern export

syn keyword quarkRepeat for while is
syn keyword quarkStatement break continue return
syn keyword quarkConditional if else switch

syn keyword quarkType   uint8_t int8_t uint16_t int16_t uint32_t int32_t uint64_t int64_t 
syn keyword quarkType   float double long short ssize_t size_t signed unsigned 
syn keyword quarkType   isize usize ichar uchar char bool void 
syn keyword quarkType   i8 i16 i32 i64 u8 u16 u32 u64 int uint
syn keyword quarkType   f32 f64
syn keyword quarkConst  true false null
syn keyword quarkTitle  panic
syn keyword quarkSelf   self this
syn keyword quarkSMacro typeof sizeof

"syn match quarkType     '\v<(\w+)>\ze\s+\w+\s*(\[.*\])?[;]?$'
syn match quarkType     '\v<(\w+)>\ze\s+\w+\s*(\[.*\])?[,;]?'
syn match quarkNew      '\v<(new|[m]?alloc|create)>'
syn match quarkFree     '\v<(free)>'

syn match quarkProc     '[@]'
syn match quarkSymbol   '[,;:\.]'
syn match quarkOperator '[\+\-\%=\/\^\&\*!?><\$|~]'
syn match quarkConst    '[{}\[\]()]'
syn match quarkTitle    '\v(-\>)'
syn match quarkType     '\v<\w+_([tscemui])>'
syn match quarkMacro    '\v<[_]*\u[A-Z0-9_]*>'
syn match quarkType     '\v<[_]*\u[A-Z0-9_]*[a-z]+\w*>'
"syn match quarkType     '\v\.?\zs<([iu][0-9]{1,3})?>'
syn match quarkRepeat   '\v([^\.](\.|::|-\>))@<=\w\w*'
syn match quarkSMacro   '\v(::\s*)@<=[_]*\u\w*'
syn match quarkType     '\v<\w+>\ze(::|\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>)' "foo<T>()
"syn match quarkFunc     '\v[_]*\l\w*\ze((\[.*\])|((::)?\<.*\>))*\s*\('
syn match quarkFunc     '\v[_]*\w+\ze((\[.*\])|((::)?\<.*\>))*\s*\('

syn match quarkTitle    '\v^([&])\ze\w'
syn match quarkTitle    '\v(\W@<=[~&!*]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[*!?]+\ze\W)'
"syn match quarkTypedef '\v((type|struct|enum|union)(\<.*\>)?\s*)@<=[_]*\u\w*\ze(\<.*\>)?\s*(\(|\{)'

syn match quarkInclude  '\v^\s*<import>'
syn match quarkSMacro   '\v<(assert)(_\w+)?>\ze\s*\('
syn match quarkAdded    '\v^\s*<(test)\ze\s*\{'
syn match quarkLabel    '\v<\@(\w+)>'
"syn match quarkLabel    '\v<\@(\w+)>\ze\s*\('
"syn match quarkType     '\v<str\ze\s+\w+>'

" -- shader
"syn match quarkKeyword  '\v<(uniform|instance|varying|var|vertex|fragment|in|out)>\s'
"syn match quarkType     '\v<(texture|texture2D)>\s'
syn match quarkType     '\v<bool[234]?>'
syn match quarkType     '\v<int[234]?>'
syn match quarkType     '\v<uint[234]?>'
syn match quarkType     '\v<half[234]?>'
syn match quarkType     '\v<float([234](x[234])?)?>'
syn match quarkType     '\v<[dbui]?vec[234]>'
syn match quarkType     '\v<vec[234][dbfhui]?>'
syn match quarkType     '\v<mat[234](x[234]f)?>'
syn match quarkType     '\v<(vec|mat|list)\ze\['


hi def link quarkProc      Added
hi def link quarkAdded     Added
hi def link quarkNew       Added
hi def link quarkFree      Exception
hi def link quarkConst     Constant
hi def link quarkTitle     Title
hi def link quarkSymbol    Changed
hi def link quarkMacro     Macro
hi def link quarkSMacro    SpecialComment
hi def link quarkFunc      Function
hi def link quarkTypedef   Changed
hi def link quarkType      MoreMsg
hi def link quarkSelf      Label

syn match  quarkSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  quarkSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  quarkCharacter        "'[^']*'" contains=quarkSpecialChar,quarkSpecialCharError
syn match  quarkCharacter        "'\\''" contains=quarkSpecialChar
syn match  quarkCharacter        "'[^\\]'"

"syn region    quarkString      matchgroup=quarkString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=quarkEscape,@Spell
syn region    quarkString      matchgroup=quarkString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region    quarkString      matchgroup=quarkString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@Spell

syn match quarkNumber "\v<[0-9_]+>"
syn match quarkNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match quarkNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match quarkFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match quarkFloat  '\v<([0][1-9]*)([eE][+-]?\d+)?[fFdD]?>' display
syn match quarkFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match quarkInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match quarkInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match quarkInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match quarkInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match quarkFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match quarkFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match quarkFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match quarkFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match quarkEscape '\\[\\'"0abfnrtv]' contained display
syn match quarkEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match quarkFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=quarkEscape display
syn match quarkFormat '{{\|}}' contained display


hi def link quarkSuper                 Title
hi def link quarkFloat                 Float
hi def link quarkInteger               Number
hi def link quarkEscape                SpecialComment
hi def link quarkFormat                SpecialChar

hi def link quarkKeyword               Keyword
hi def link quarkInclude               Include
hi def link quarkLabel                 Label
hi def link quarkConditional           Conditional
hi def link quarkRepeat                Repeat
hi def link quarkStatement             Statement
hi def link quarkNumber                Number
hi def link quarkComment               Comment
hi def link quarkOperator              Operator
hi def link quarkString                String
hi def link quarkTodo                  Todo
hi def link quarkSpecial               Special
hi def link quarkSpecialError          Error
hi def link quarkSpecialCharError      Error
hi def link quarkCharacter             Character
hi def link quarkSpecialChar           SpecialChar
hi def link quarkExcept                Exception

syn match quarkTypedef  contains=quarkTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match quarkFunc    "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
"syn keyword quarkSkip extern const volatile static register contained transparent nextgroup=quarkSkip,quarkTypedef skipwhite
syn match quarkSkip "\<\%(extern\|export\)\>\s\+" contained transparent nextgroup=quarkTypedef
"syn keyword quarkKeyword union struct enum type nextgroup=quarkTypedef skipwhite skipempty
syn keyword quarkKeyword union struct enum type nextgroup=quarkSkip,quarkTypedef skipwhite
syn keyword quarkKeyword union nextgroup=quarkSkip,quarkType skipwhite skipempty contained
" adapted from neovim runtime/syntax
syn keyword quarkTodo contained TODO FIXME XXX NOTE
syn region  quarkComment start="/\*" end="\*/" contains=quarkTodo,@Spell
syn match   quarkComment "//.*$" contains=quarkTodo,@Spell
syn match   quarkProc    '\v#.*$'

let b:current_syntax = "quark"
