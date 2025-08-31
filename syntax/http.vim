" Vim syntax file
" Language: HTTP
" Maintainer: Jorel Paddick
" Filetypes: http

if exists("b:current_syntax")
  finish
endif

" --- Status Line (HTTP/1.1 200 OK) ---
syntax match httpResponseVersion "^HTTP/[0-9.]\+"
syntax match httpResponseStatus "\s\zs[0-9]\{3}"
syntax match httpResponseMessage "\d\{3}\s\zs.*$"

" --- Request Line (GET /path HTTP/1.1) ---
"  Could probably change to be method agnostic
syntax match httpRequestMethod "^\(GET\|POST\|PUT\|DELETE\|PATCH\|OPTIONS\|HEAD\)\>"
syntax match httpRequestPath "\s/\S*"
syntax match httpRequestVersion "HTTP/[0-9.]\+$"

" --- Headers (Key: value) ---
syntax match httpHeaderKey "^[A-Za-z0-9-]\+\ze:"
syntax match httpHeaderSep ":"
syntax match httpHeaderValue ":.*$" contains=httpHeaderSep

" --- Header/Body Separator ---
syntax match httpHeaderBoundary "^$"

" --- Body (everything after blank line) ---
syntax region httpBody start="^\s*$" end="\%$" keepend

" --- Highlighting ---
highlight def link httpResponseVersion   Type
highlight def link httpResponseStatus    Number
highlight def link httpResponseMessage   String

highlight def link httpRequestMethod     Keyword
highlight def link httpRequestPath       Identifier
highlight def link httpRequestVersion    Type

highlight def link httpHeaderKey         Identifier
highlight def link httpHeaderSep         Delimiter
highlight def link httpHeaderValue       String

highlight def link httpHeaderBoundary    Special
highlight def link httpBody              Normal

let b:current_syntax = "http"

