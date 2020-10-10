" vim: foldmethod=marker
" Preferences {{{
" Do not try to be compatible with vi
set nocompatible
set viminfo=
"rtp is the vim runtime path. Which we need to add to if using custom color
"schemes
"set rtp+=~/.vim/plugged/vim-colors-solarized
"set rtp+=~/.vim/plugged/base16-vim
"set rtp+=~/.vim/plugged/seoul256.vim
"set t_Co=256
let g:solarized_termcolors=16
let g:solarized_contrast="high"

if has('gui_running')
  set guifont=Monaco:h16
  " Solarized works well in the gui but nooks horrible in
  " the terminal, despite loads oh fiddling
  :colorscheme solarized
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " It's a nightmare setting these in the terminal since how they look depends on
  " what we've got the terminal set to.

  " industry looks good with the iterm2 colorscheme set to tango-dark-colors
  " it's contrasty but not in a garish way
  :colorscheme industry "This is included with vim8
  " On the mac these are at /usr/share/vim/vim81colors for the defaults
  " Some were installed as packages using the plug extension
  " These are under ~.vim/plugged
  " If adding custom extensions make sure to add to the rtp path, see above
  "colorscheme seoul256 " low contrast one from junegunn
  "colorscheme seoul256-light
  "colorscheme desert
  "colorscheme base16-default-dark
endif

syntax on

" Make text lists properly auto format.
" if this gives trouble in code then would need to make it filetype dependent
set autoindent " lines up text under previous column on new line
set fo+=2n " the n is for numbered lists
set tw=78

" Treat all numerals as decimals (vs the default of Octal if padding zeros)
set nrformats=

" TODO comment
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

                  " highlight search was one of my biggest pains where it
                  " caused the highlight to obscure what it was we'd found and
                  " just looked real ugly
"set hlsearch      " highlight search terms
set nohlsearch      " highlight search terms
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
nmap <silent> <leader>eb :e ~/.bashrc<cr>

" Rob: Ok so lets extend to make easy to edit zshrc
" 'e'dit 'z'shrc)
nmap <silent> <leader>ez :e ~/.zshrc<cr>

" For editing my abolish terms
nmap <silent> <leader>ea :e ~/.vim/after/plugin/abolish.vim<cr>

"My own mapping for changing windows
map <silent> <leader>w <C-w><C-w>

"Run Ack in a new tab"
" TODO standardise on which search helper to use
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

" Change the current working directory to that of the currently open file
nmap <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>

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
" }}}

" Stuff for faster buffer movement
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

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
" Goes to ast buffer, This acts screwy whn we use Nerdtree since the
" Nerdtree pane is a nw buffer so we end up going back to the  Nerdree pane
" Hence my [b and ]b keymaps can be more useful or the bufergator
" plugin which I've installed, leader b is the way to invoke this.

map ,, <C-^>

" vim-plug stuff
" Got rid of pathogen in favor of vim-plug
" Automatically install if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
"   I can purge my old plugin directory
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/scrooloose/nerdtree
" Note: Need to run :PlugInstall after we add a new Plug command. This will
" download the plugin
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jeetsukumaran/vim-buffergator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'

" Clears the search highlight after a move
Plug 'haya14busa/is.vim'
Plug 'altercation/vim-colors-solarized'
" A nice vim colorscheme and also for iterm2 separately
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'

" Initialize plugin system
let g:CommandTMaxFiles=100000
call plug#end()


" TODO experiment with ucomplete me. Need to add the package first though
"call ucompleteme#Setup()

"filetype plugin on
"filetype indent on
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
nnoremap <leader>n :e ~/OneDrive/notes/

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

"autocmd Filetype java set makeprg=javac-algs4\ %
"set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

set tabstop=4
" paste mode is useful for .. pasting text, But has some side effects:
" It disables abbreviations, resets wrapmargin, autoindent....
" :he paste
" If you've used paste then :set nopaste will be needed in same editor session
" set paste

" using the abbreviation command to allow dts to be expanded  inline to insert the date and time
" debug me abbreviations not working
iab <expr> dts strftime("%c")

set path+=**
set wildmenu

" configure the airline plugin to automatically show all open buffers when
" there is only one tab open
let g:airline#extensions#tabline#enabled = 1

" set shell=/usr/local/bin/zsh\ -i
set shell=/bin/bash

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" When we wish to remove trailing whitespace upon writing a file
" Leaving off by default since It could remove trailing whitepsace from
" multiline strings in python
"autocmd BufWritePre * :%s/\s\+$//e
"
" From https://vi.stackexchange.com/questions/68/autocorrect-spelling-mistakes
" Does nto autocorrect but makes fixing easier
" Go back to last misspelled word and pick first suggestion.
inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u

" Select last misspelled word (typing will edit).
nnoremap <C-K> <Esc>[sve<C-G>
inoremap <C-K> <Esc>[sve<C-G>
snoremap <C-K> <Esc>b[sviw<C-G>

