" vim: foldmethod=marker
" Preferences {{{
" Do not try to be compatible with vi
set nocompatible

if has('gui_running')
  set guifont=Monaco:h16
  :colorscheme desert
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  :colorscheme morning
  " On the mac these are at /usr/share/vim/vim73/colors
  " TODO figure out how to install local version
  ":colorscheme jellybeans
endif
"  " This is console Vim.
"  if exists("+lines")
"    set lines=50
"  endif
"  if exists("+columns")
"    set columns=100
"  endif
" Turn on the syntax highlighting
syntax on

" Turn on spelling
"set spell spelllang=en_us
"setlocal spell spelllang=en_us  
autocmd FileType text  setlocal spell spelllang=en_us  
"highlight clear SpellBad
"highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline gui=underline


" Make text lists properly auto format.
" if this gives trouble in code then
" would need to make it filetype
" dependent
set autoindent " lines up text under previous column on new line
set fo+=2n " the n is for numbered lists 
set tw=78

" Treat all numerals as decimals (vs the default of Octal if padding zeros)
set nrformats=     	

set shiftwidth=4 softtabstop=4 expandtab 

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" most basic settings
" this from "How I boosted my vim"

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
"set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

"Think big settings
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.out
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Stop creating backups and swps
set backupdir=~/.vimbackups
" set nobackup
set noswapfile


" mappings {{{1
"""""""""""""""""""""""""""""""""
" http://nvie.com/posts/how-i-boosted-my-vim/
"""""""""""""""""""""""""""""""""
"" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ease the entire customization process
let mapleader = ","

" Toggle spelling on and off
nmap <silent> <leader>s :set spell!<CR>


" Don't be required to save when opening new file
set hidden

" From derek wyatt
" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Rob: Ok so lets extend to make easy to edit bashrc
" 'e'dit 'b'ashrc)
nmap <silent> ,eb :e ~/.bashrc<cr>

" For editing my abolish terms
nmap <silent> ,ea :e ~/.vim/after/plugin/abolish.vim<cr>

"My own mapping for changing windows
map <silent> <leader>w <C-w><C-w>

"Run Ack in a new tab"
nmap <silent> <leader>a :tab split <CR> :Ack --type=cc "" <Left>

"Run Ack in word under cursor"
nmap <silent> <leader>A :tab split <CR> :Ack  --type=cc  <C-r><C-w><CR> 

"
" Set the status line the way Derek foo liked it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Toggle paste mode
" Rob this one seems better than the derek 'p
set pastetoggle=<F2>

" }}} 

" Stuff for tags {{{1
" http://vim.wikia.com/wiki/Browsing_programs_with_tags
set tags=./tags;

nmap <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>

nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Stuff for cscope 
"
" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls

"nmap <silent> <leader>cs :vert scs find s <C-R>=expand("<cword>")<CR><CR>	
"nmap <silent> <leader>cg :vert scs find g <C-R>=expand("<cword>")<CR><CR>	
"nmap <silent> <leader>cc :vert scs find c <C-R>=expand("<cword>")<CR><CR>	
"nmap <silent> <leader>ct :vert scs find t <C-R>=expand("<cword>")<CR><CR>	
"nmap <silent> <leader>ce :vert scs find e <C-R>=expand("<cword>")<CR><CR>	
"nmap <silent> <leader>cf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
"nmap <silent> <leader>ci :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
"nmap <silent> <leader>cd :vert scs find d <C-R>=expand("<cword>")<CR><CR>	

nmap <silent> <leader>cs  :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <silent> <leader>cg  :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <silent> <leader>cc  :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <silent> <leader>ct :cs  find t <C-R>=expand("<cword>")<CR><CR>	
nmap <silent> <leader>ce :cs  find e <C-R>=expand("<cword>")<CR><CR>	
nmap <silent> <leader>cf :cs  find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <silent> <leader>ci :cs  find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <silent> <leader>cd :cs  find d <C-R>=expand("<cword>")<CR><CR>	

" }}} 

" Stuff for faster buffer movement
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Stuff for expanding the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

let g:LatexBox_Folding = 1
vmap Q gq
nmap Q gqap
map <silent> <leader>c :lcd %:p:h<CR>
map <silent> <leader>C :cd %:p:h<CR>
 

" From Destroy All Software screencast
"
" %%  now expands to the directory of the current buffer
" C-R is replay a register. = is a special in-place register
" %:h is the directory of the current buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Equivalent to :b# but much faster.

map ,, <C-^>


" Got rid of the confusing vundle bundle crap
" Now using pathogen.
" One goes to the bundle directory and git clones whatever bundle it is
" directly in there. Nothing else to do!!
" https://github.com/tpope/vim-pathogen
"
execute pathogen#infect()

let g:CommandTMaxFiles=100000

"call ucompleteme#Setup()

filetype plugin on 	
filetype indent on
autocmd FileType make   set noexpandtab
autocmd FileType html   setlocal shiftwidth=2 tabstop=2
autocmd FileType xml    setlocal shiftwidth=2 tabstop=2
autocmd FileType docbk  setlocal shiftwidth=2 tabstop=2
autocmd FileType python   setlocal shiftwidth=4 tabstop=4 expandtab 
autocmd FileType docbk  syntax spell toplevel 
 
"noremap <Space> @q

set foldmethod=syntax
let g:LatexBox_Folding = 1
"map <leader>f :FufFile \*\*\/<CR>
map <leader>f :FufFile <CR>
map <silent> <leader>ff :FufFile $HOME/Dropbox/Notes<CR>

nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

"Make editing notes easy
nnoremap <leader>n :e ~/Dropbox/Notes

if $TMUX == ''
    set clipboard=unnamed
endif

" Make folding off by default no more zR 
set nofoldenable

"The defaults were not working, then they were so 
"Should avoid the smarty pants incomprehensible mechanism and start from the
"cwd
let g:ctrlp_working_path_mode = 0 
'
function! s:setupMarkup()
  nnoremap <leader>p :silent !open -a "Marked 2.app" '%:p'<cr>
endfunction

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

vnoremap <f5> :!python<CR>

" Controls where completion completes from
set complete=.,w,b,u,t,i,kspell

vnoremap <C-c> "*y

autocmd Filetype java set makeprg=javac-algs4\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

set tabstop=4
" paste mode is usefull for .. pasting text, But has some side efeects:
" It disables abbreviations, resets wrapmargin, autoindent....
" :he paste
" If ve've used paste then :set nopaste will be needed in same editor session
" set paste

" using the abbreviation command to allow dts to be expanded  inline to insert the date and time 
" debug me abbreviations not working
iab <expr> dts strftime("%c")

set path+=**
set wildmenu

" configure the airline plugin to automatically show all open buffers when
" there is only one tab open
let g:airline#extensions#tabline#enabled = 1

