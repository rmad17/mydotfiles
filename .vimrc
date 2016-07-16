set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
set laststatus=2
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#end()            " required
filetype plugin indent on
" Let vundle manage itself
Plugin 'gmarik/Vundle.vim'
" Other plugins
Plugin 'sjl/gundo.vim' " Undo tree
Plugin 'vim-airline/vim-airline' " Status line
Plugin 'vim-airline/vim-airline-themes' " vim-airline themes
Plugin 'tpope/vim-fugitive' " Show git branch
Plugin 'godlygeek/tabular' " Aligning text. To be used for MarkDown
Plugin 'scrooloose/nerdtree' " Tree explorer in vim
Plugin 'plasticboy/vim-markdown' " allow markdown highlighting
Plugin 'nvie/vim-flake8' " Flake8 checker with PEP8 support
" Plugin 'kchmck/vim-coffee-script' " Coffeescript support
Plugin 'aperezdc/vim-template' " Skeleton when creating a file
Plugin 'vim-ruby/vim-ruby' " ruby support
Plugin 'tpope/vim-rails' " rails support
Plugin 'pangloss/vim-javascript' " better javascript support
Plugin 'junegunn/fzf' " Fuzzy search
" Color Scheme
Plugin 'tomasr/molokai' " Theme
Plugin 'morhetz/gruvbox'
syntax on  "Enables syntax highlighting for programming languages
" Key bindings
nnoremap <F5> :GundoToggle<CR> 
" Airline fonts and symbols
"set guifont=Literation\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_theme='murmur'
" Airline ends
" fzf starts
let g:fzf_action = {
  \ 'ctrl-m': 'e',
  \ 'ctrl-a': 'tabnew',
  \ 'ctrl-t': 'tabedit',
  \ 'alt-j':  'botright split',
  \ 'alt-k':  'topleft split',
  \ 'alt-h':  'vertical topleft split',
  \ 'alt-l':  'vertical botright split' }
" fzf ends
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set tabstop=4  "How much space Vim gives to a tab
set number  "Enables line numbering
set shiftwidth=4  "Assists code formatting
set incsearch
set t_Co=256
set encoding=utf-8
set expandtab
set fileformat=unix
set softtabstop=4
set ignorecase      "ignore case while searching
set smartcase       "if camel-cased, dont ignore case
set nocompatible    "non compatibe
set hlsearch        "Highlight the search term

colorscheme molokai

au BufNewFile,BufReadPost *.emblem,*.js,*.css,*.haml,*.coffee,*.yml,*.yaml,*.jade setl tabstop=4 shiftwidth=2
au BufNewFile,BufReadPost *.rb,*.erb setl tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.coffee   set syntax=coffee
autocmd Filetype html setlocal ts=2 sts=2 sw=2
cmap w!! w !sudo tee > /dev/null %
" Flake8 additions
autocmd BufWritePost *.py call Flake8()
" Py Settings
au BufNewFile,BufRead *.py,*js setl colorcolumn=80 tabstop=4 shiftwidth=4 softtabstop=4 autoindent

autocmd BufWritePre *.py,*.js :%s/\s\+$//e "Trim the line endings

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.git/*,*/node_modules*/,*/bower_components/*

" Flake8 additions complete
"colorscheme darkblue  "Changes the color scheme. Change this to your liking. Lookin /usr/share/vim/vim73/colors/ for options.
"setlocal spell  "Enables spell checking (CURRENTLY DISABLED because it's kinda annoying). Make sure to uncomment the next line if you use this.
"set spellfile=~/.vimwords.add  "The location of the spellcheck dictionary. Uncomment this line if you uncomment the previous line.
set foldmethod=manual  "Lets you hide sections of code

" set paste method
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
" set paste ends
