" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
 
    " File Explorer
    Plug 'scrooloose/NERDTree'
 
    "Plug 'jiangmiao/auto-pairs'

    " Fuzzyfile finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Ack  uses ripgrep to find things in files
    Plug 'mileszs/ack.vim'

    Plug 'airblade/vim-rooter'

    " Themes
    " https://github.com/rafi/awesome-vim-colorschemes for lots more
    Plug 'joshdick/onedark.vim'

    Plug 'jeetsukumaran/vim-buffergator'

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    Plug 'vim-airline/vim-airline'

    Plug 'mhinz/vim-startify'

    Plug 'plasticboy/vim-markdown'

    "Plug 'liuchengxu/vim-which-key'

    " Broke coc completion in wiki and in markdown files
    "    Plug 'vimwiki/vimwiki'

    Plug 'vim-syntastic/syntastic'


    call plug#end()
