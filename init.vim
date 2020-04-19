set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
set laststatus=2
call plug#begin('~/.local/share/nvim/plugged')
" Other plugins
Plug 'mbbill/undotree' " Undo tree
Plug 'vim-airline/vim-airline' " Status line
Plug 'vim-airline/vim-airline-themes' " vim-airline themes
Plug 'tpope/vim-fugitive' " Show git branch
Plug 'scrooloose/nerdtree' " Tree explorer
Plug 'scrooloose/nerdcommenter' " Comment stuff out
Plug 'sheerun/vim-polyglot' " Language Pack
Plug 'nvie/vim-flake8' " Flake8 checker with PEP8 support
Plug 'airblade/vim-gitgutter' " Show diffs in vim
Plug 'mileszs/ack.vim' " grep within vim
Plug 'slashmili/alchemist.vim' " Elixir Integration
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy search
Plug 'junegunn/fzf',  " Fuzzy search
Plug 'junegunn/goyo.vim' " Distraction Free
Plug 'junegunn/limelight.vim' " Hyperfocus
Plug 'mhinz/vim-startify' " Fancy start screen
Plug 'Yggdroot/indentLine' " Indention lines
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Async Completion
Plug 'davidhalter/jedi-vim', {'for': 'python'} " Jedi autocompletion and GoTo
" Color Scheme
Plug 'rafi/awesome-vim-colorschemes' " A lot of colors in in plugins
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-janah'
Plug 'notpratheek/vim-luna'
Plug 'jnurmine/zenburn'

call plug#end()            " required
" Key bindings
"
" UndoTree
nnoremap <F5> :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" End UndoTree

" Airline fonts and symbols
"set guifont=Literation\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_theme='gruvbox'
" Airline ends
"
" ctrlp starts
nmap <C-p> :CtrlPMRUFiles<CR>
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<CR>'],
    \ }

" ctrlp ends
" NERDTree
map <C-l> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close tree on tab close
" NerdCommenter
let g:NERDSpaceDelims = 1

" Global Key Mappings
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

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
set termguicolors

"colorscheme molokai
"autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'
set background=dark    " Setting dark mode

au BufNewFile,BufReadPost *.emblem,*.js,*.css,*.haml,*.hbs,*.coffee,*.yml,*.yaml,*.jade setl tabstop=2 shiftwidth=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
cmap w!! w !sudo tee > /dev/null %
" Flake8 additions
autocmd BufWritePost *.py call Flake8()
" Py Settings
au BufNewFile,BufRead *.py,*js setl colorcolumn=80 tabstop=4 shiftwidth=4 softtabstop=4 autoindent

autocmd BufWritePre *.py,*.js :%s/\s\+$//e "Trim the line endings

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.git/*,*/node_modules*/,*/bower_components/*


" Flake8 additions complete
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

" Transparent Background
"hi Normal ctermbg=none


" jedi-vim settings
" let g:jedi#use_tabs_not_buffers = 1
" jedi-vim settings end

" ack.vim with silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" deoplete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/bin/python3'
"
" Insert Commands
:ia pdb import pdb; pdb.set_trace()
:ia ipdb import ipdb; ipdb.set_trace()
:ia pudb import pudb; pudb.set_trace()
:ia rdb from celery.contrib import rdb; rdb.set_trace()
