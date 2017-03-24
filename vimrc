" encoding is important!
set encoding=utf-8

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Fortran formatting (NOT GOOD)
"Plugin 'rudrab/vimf90'
" undo tree visualization
Plugin 'sjl/gundo.vim'
" fragment file name search
Plugin 'kien/ctrlp.vim'

" source tree panel
Plugin 'scrooloose/nerdtree'
" tabs in nerdtree
Plugin 'jistr/vim-nerdtree-tabs'
" git indicator in nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" more info status line
Plugin 'vim-airline/vim-airline'
" search and moving in screen
Plugin 'easymotion/vim-easymotion'

" syntax checking
Plugin 'vim-syntastic/syntastic'
" PEP8 checking
Plugin 'nvie/vim-flake8'
" smart folding in python
Plugin 'tmhedberg/SimpylFold'
" smart indentation in python
Plugin 'vim-scripts/indentpython.vim'
" Interaction with IPython
Plugin 'ivanov/vim-ipython'
" Tab completion
Plugin 'ervandew/supertab'

" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

" Git support
Plugin 'tpope/vim-fugitive'

" LaTex support
Plugin 'vim-latex/vim-latex'

" Examples from original vundle file
" plugin on GitHub repo
"" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
" Git plugin not hosted on GitHub
"" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ====================================================================

" load some default settings
" source ~/.vim/defaults.vim

" load the MS-Windows like behaviors
" source $VIMRUNTIME/mswin.vim
" behave mswin

" Plugin setup for vim-latex
" grep setting
set grepprg=grep\ -nH\ $*
" .tex empty files got correct
let g:tex_flavor='latex'

" Plugin setup and configurations
" Gundo setup
nnoremap gu<CR> :GundoToggle<CR>

" NerdTree ignore certain files
let NERDTreeIgnore=['\.pyc$', '.o$', '\~$']
" NERDTabTree toggle
map <C-n> :NERDTreeToggle<CR>
" NERDTabTree auto startup
"0 for disable, 1 for always, 2 for directories only
let g:nerdtree_tabs_open_on_console_startup=2
" use old school markers for NERDTree, not arrows
let g:NERDTreeDirArrows=0
" NERDTree Git status display
"let g:NERDTreeIndicatorMapCustom = {
"    \ 'Modified'  : '?',
"    \ 'Staged'    : '?',
"    \ 'Untracked' : '?',
"    \ 'Renamed'   : '?',
"    \ 'Unmerged'  : '-',
"    \ 'Deleted'   : '?',
"    \ 'Dirty'     : '?',
"    \ 'Clean'     : '??',
"    \ 'Ignored'   : '?',
"    \ 'Unknown'   : '?'
"    \ }

" Highlight cursor settings
:set cursorline
:hi CursorLine
:hi CursorColumn
:nnoremap <Leader>c :set cursorline!<CR>
" Split window location set
set splitbelow
set splitright

" Split window navigation 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Python folding with DocString appear
let g:SimpylFold_docstring_preview = 1
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Turn on line numbering
set nu

" Set the autocommand to be verbose
" set verbose=9
" Python PEP8 indentation
:au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h,*.F90
    \ match BadWhitespace /\s\+$/
" Remove trailing whitespaces
nnoremap tw<CR> :%s/\s\+$//e<CR>
" Automatically delete trailing whitespaces when write
" Be careful with this feature if trailing whitespaces are essential
autocmd BufWritePre *.py,*.pyw,*.c,*.h %s/\s\+$//e
" Python highlighting
let python_highlight_all=1
syntax on

" Fortran indentation
:au BufNewFile,BufRead *.F90,*.F95,*.F03
    \ set smarttab |
    \ set expandtab |
    \ set smartindent |
    \ set autoindent |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |

" Color Scheme
if has('gui_runnning')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
