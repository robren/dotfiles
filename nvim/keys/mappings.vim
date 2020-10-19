
"""""""" From Chris@machine. Many overlap with what I had in my og vimrc
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
"nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
"nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion. 
" coc wants to use tab so stick with coc usage for now
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

"""""""" End from the Chris@Machine 

"My own mapping for changing windows
map <silent> <leader>w <C-w><C-w>

"Run Ack in a new tab"
" TODO standardise on which search helper to use
nmap <silent> <leader>a :tab split <CR> :Ack --type=cc "" <Left>

"Run Ack in word under cursor"
nmap <silent> <leader>A :tab split <CR> :Ack  --type=cc  <C-r><C-w><CR>

" Run NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

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
" Goes to last buffer, This acts screwy whn we use Nerdtree since the
" Nerdtree pane is a new buffer so we end up going back to the Nerdree pane
" Hence my [b and ]b keymaps can be more useful or the bufergator
" plugin which I've installed, leader b is the way to invoke this.

map ,, <C-^>

