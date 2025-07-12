"Author: Jorel Paddick
"LICENCE: GPL3

"This file contains the custom syntax range definitions for inline markdown 
"code block.
call SyntaxRange#Include('```c', '```', 'c', 'NonText')
call SyntaxRange#Include('```js', '```', 'javascript', 'NonText')
call SyntaxRange#Include('```html', '```', 'html', 'NonText')
