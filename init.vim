"Jorels vimrc 
"Makes vim even more awesome!

" STOCK SETTINGS
syntax enable "Enable syntax processing
set tabstop=4 "Number of spaces per tab
set expandtab "All tabs are spaces
set number "Show line numbers
set shiftwidth=4 "Each indent using '>>' is 4 spaces 
set relativenumber "Make number relative to current line
set showcmd "show commands in bottom
set cursorline "highlight working line
set wildmenu "show the autocomplete commands
set showmatch "highlight matching braces
set incsearch "search as characters are entered
set hlsearch "Higlight matches
set foldenable "Enable folding
set mouse=a "enable the mouse for occasional lazyness
set autoindent "Automatic indentation
set smartindent "Context specific indentation
set colorcolumn =78 "A bar to keep your code within 80 characters per line
filetype plugin on "Allow dynamic file type detection (behaviour)

"MAPPINGS
"Press j twice and this will exit insert mode.
"No more raising of your hand to press the escape key.
imap jj <Esc> 

"Re-map control-w to control-\ 
"Do this because to delete the previous word
"normally you would press control-backspace in another
"editor, however vim uses control-w.
"We don't want control-w to become habit, because it closes
"windows in nearly every other program. Vim also does not allow
"for the binding of control-backspace, so this is the next best thing
"For Mac users, this is not an issue. 
imap <c-\> <c-w> 

"Pressing '\' and then 't' will open a new tab
map <leader>t :tabnew<cr>

"Pressing '\' and then 'e' will open the file explorer
map <leader>e :NERDTree<cr>

colorscheme starrise "Customised colour scheme file is loaded here

"Set dynamic line numbering behaviour for different modes
"In normal mode the line numbers are relative
"In insert mode the line numbers are static
autocmd BufEnter,FocusGained,InsertLeave * exe "set relativenumber"
autocmd BufEnter,FocusLost,InsertEnter * exe "set norelativenumber"

"Below are some file specific things that are useful.
"Some examples are automatic word wrapping in latex/md and spell checking
"being automatically available in those formats. 

"LAXTEX MODE THINGS
autocmd BufReadPost,bufnewfile *.tex exe "set textwidth=78"
autocmd BufReadPost,bufnewfile *.tex exe "set spell" 

" MARKDOWN MODE THINGS
autocmd BufReadPost,bufnewfile *.md exe "set textwidth=78"
autocmd BufReadPost,bufnewfile *.md exe "set spell"

"PYTHON MODE THINGS
autocmd BufReadPost,bufnewfile *.py exe "set colorcolumn=78"

"JAVA MODE THINGS
autocmd BufReadPost,bufnewFile *.java exe "badd ~/.vim/syntax/java.vim"
"
"HTML MODE THINGS
autocmd BufReadPost,bufnewFile *.html exe "set colorcolumn=120"
autocmd BufReadPost,bufnewFile *.html exe "set tabstop=2"
autocmd BufReadPost,bufnewFile *.html exe "set shiftwidth=2"

"C MODE THINGS
autocmd BufReadPost,bufnewFile *.c exe "badd ~/.vim/syntax/c.vim"

"C++ MODE THINGS
autocmd BufReadPost,bufnewFile *.cpp exe "badd ~/.vim/syntax/cpp.vim"

"Headers are important for all source files
"Below are a series of automatic commands to create
"and maintain headers for c and java. 
autocmd bufnewfile *.c so ~/.vim/headers/c-style.txt
autocmd bufnewfile *.c exe "g/FILE NAME:.*/s//FILE NAME: " .expand("%")
autocmd bufnewfile *.c exe "g/CREATED:.*/s//CREATED: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "g/MODIFIED.*/s/MODIFIED:.*/MODIFIED: " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a""`"
autocmd bufnewfile *.c exe "set colorcolumn=78"


"This header is for Java files:
autocmd bufnewfile *.java so ~/.vim/headers/c-style.txt
autocmd bufnewfile *.java exe "g/FILE NAME:.*/s//FILE NAME: " .expand("%")
autocmd bufnewfile *.java exe "g/CREATED:.*/s//CREATED: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *java execute "normal ma"
autocmd Bufwritepre,filewritepre *.java exe "g/MODIFIED:.*/s/MODIFIED:.*/MODIFIED: " .strftime("%c")
autocmd bufwritepre,filewritepre *.java exe "g/FILE NAME:.*/s//FILE NAME: " .expand("%")
autocmd bufwritepost,filewritepost *.java execute "normal `a""`"

"This header is for c++ files:
autocmd bufnewfile *.cpp so ~/.vim/headers/c-style.txt
autocmd bufnewfile *.cpp exe "g/FILE NAME:.*/s//FILE NAME: " .expand("%")
autocmd bufnewfile *.cpp exe "g/CREATED:.*/s//CREATED: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *cpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.cpp exe "g/MODIFIED.*/s/MODIFIED:.*/MODIFIED: " .strftime("%c")
autocmd bufwritepost,filewritepost *.cpp execute "normal `a""`"

"This header is for h files:
autocmd bufnewfile *.h so ~/.vim/headers/c-style.txt
autocmd bufnewfile *.h exe "g/FILE NAME:.*/s//FILE NAME: " .expand("%")
autocmd bufnewfile *.h exe "g/CREATED:.*/s//CREATED: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *h execute "normal ma"
autocmd Bufwritepre,filewritepre *.h exe "g/MODIFIED.*/s/MODIFIED:.*/MODIFIED: " .strftime("%c")
autocmd bufwritepost,filewritepost *.h execute "normal `a""`"

"This header is for hpp files:
autocmd bufnewfile *.hpp so ~/.vim/headers/c-style.txt
autocmd bufnewfile *.hpp exe "g/FILE NAME:.*/s//FILE NAME: " .expand("%")
autocmd bufnewfile *.hpp exe "g/CREATED:.*/s//CREATED: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *hpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.hpp exe "g/MODIFIED.*/s/MODIFIED:.*/MODIFIED: " .strftime("%c")
autocmd bufwritepost,filewritepost *.hpp execute "normal `a""`"

"For Python Files
autocmd bufnewfile *.py so ~/.vim/headers/py-style.txt
autocmd bufnewfile *.py exe "g/FILE NAME:.*/s//FILE: " .expand("%")
autocmd bufnewfile *.py exe "g/CREATED:.*/s//CREATED: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *py execute "normal ma"
autocmd Bufwritepre,filewritepre *.py exe "g/MODIFIED.*/s/MODIFIED:.*/MODIFIED: " .strftime("%c")
autocmd bufwritepost,filewritepost *.py execute "normal `a""`"

"This line allows one to instantly create PDF documents while working in 
"markdown by simply typing :Makepdf into the command line.
"command Makepdf execute ! ~/.vim/post/node_modules/.bin/md2pdf

call plug#begin()

" List of plugins to install
Plug 'tpope/vim-sensible'
Plug 'garbas/vim-snipmate'
Plug 'jiangmiao/auto-pairs'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'keith/swift.vim'
Plug 'honza/vim-snippets'
Plug 'arrufat/vala.vim'

call plug#end()
