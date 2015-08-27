set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
filetype off
set laststatus=2
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#end()            " required
filetype plugin indent on 
" Let vundle manage itself
Plugin 'gmarik/Vundle.vim'
" Other plugins
Plugin 'sjl/gundo.vim' " Undo tree
Plugin 'bling/vim-airline' " Status line
Plugin 'tpope/vim-fugitive' " Show git branch
Plugin 'godlygeek/tabular' " Aligning text. To be used for MarkDown
Plugin 'plasticboy/vim-markdown' "allow markdown highlighting
Plugin 'nvie/vim-flake8' "Flake8 checker with PEP8 support
Plugin 'kchmck/vim-coffee-script' "Coffeescript support
" Color Scheme
Plugin 'tomasr/molokai'
syntax on  "Enables syntax highlighting for programming languages
" Airline fonts and symbols
"set guifont=Literation\ Mono\ for\ Powerline\ 10 
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
" Airline ends
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set tabstop=4  "How much space Vim gives to a tab
set number  "Enables line numbering
set smarttab  "Improves tabbing
set shiftwidth=4  "Assists code formatting
set incsearch
set hlsearch
set t_Co=256
set encoding=utf-8
set expandtab
colorscheme molokai
au BufNewFile,BufReadPost *.coffee,*.rb,*.yml,*.yaml,*.js,*.jade setl tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.coffee   set syntax=coffee
cmap w!! w !sudo tee > /dev/null %
" Flake8 additions
autocmd BufWritePost *.py call Flake8()
au BufNewFile,BufRead *.py,*js set colorcolumn=80
autocmd BufWritePre *.py,*.js :%s/\s\+$//e "Trim the line endings
" Flake8 additions complete
"colorscheme darkblue  "Changes the color scheme. Change this to your liking. Lookin /usr/share/vim/vim73/colors/ for options.
"setlocal spell  "Enables spell checking (CURRENTLY DISABLED because it's kinda annoying). Make sure to uncomment the next line if you use this.
"set spellfile=~/.vimwords.add  "The location of the spellcheck dictionary. Uncomment this line if you uncomment the previous line.
set foldmethod=manual  "Lets you hide sections of code
"--- The following adds a sweet menu, press F4 to use it.
source $VIMRUNTIME/menu.vim
set wildmenu