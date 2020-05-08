" ********** Editor config starts ********** "
" Use Vim settings, rather than Vi settings
set nocompatible
" Indent by 2 spaces when hitting tab
set softtabstop=2
" Indent by 4 spaces when auto-indenting
set shiftwidth=4
" Show existing tab with 4 spaces width
set tabstop=4
" Enable syntax highlighting
syntax on
" Enable indenting for files
filetype indent on
" Enable auto indenting
set autoindent
" Enable line numbers
set number
" Show relative line numbers
set relativenumber
" Set nice looking colorscheme
colorscheme default
" Disable backup files
set nobackup
" Display command line's tab complete options as a menu.
set wildmenu


set cursorline
hi CursorLine term=bold cterm=bold


" Enable spell check
set spell


" Allow backspacing over indention, line breaks and insertion
set backspace=indent,eol,start
" Set bigger history of commands
set history=1000
" Show current mode at the bottom
set showmode
" Automatically re-read files if unmodified inside Vim.
set autoread
" Manage multiple buffers effectively: the current buffer can be “sent” to the
" background without writing to disk. When a background buffer becomes current
" again, marks and undo-history are remembered.
set hidden


" Always display the status bar.
set laststatus=2
" Always show cursor position.
set ruler
" Display command lines tab complete options as a menu.
set wildmenu
" Maximum number of tab pages that can be opened from the command line
set tabpagemax=40


" Enable mouse for scrolling and resizing
set mouse=a
" Use colors that suit a dark background
set background=dark


" disable all swap and backup files
set noswapfile
set nobackup
set nowb


" INDENTATION OPTIONS
" New lines inherit the indentation of previous lines.
set autoindent
" Smart auto indentation (instead of old smart indent option).
filetype plugin indent on
" Show existing tab with 4 spaces width.
set tabstop=4
" When indenting with ‘>’, use 2 spaces width.
set shiftwidth=2
" On pressing tab, insert 4 spaces.
set expandtab
" Do wrap lines
set wrap
" allow maximum 80 characters in a line
set textwidth=80


" SEARCH OPTIONS
" Find the next match as we type the search
set incsearch
" Highlight searches by default
set hlsearch
" Ignore case when searching
set ignorecase
" unless you type a capital
set smartcase


" TEXT RENDERING OPTIONS
" use encoding that supports Unicode
set encoding=utf-8
" wrap lines at convenient points
set linebreak
" The number of screen lines to keep above and below the cursor
set scrolloff=3
" The number of screen columns to keep to the left and right of the cursor
set sidescrolloff=5
" Enable syntax highlighting
syntax enable


" Display a confirmation dialog when closing an unsaved file
set confirm


" STATUSLINE OPTIONS
"show status line
set laststatus=2
" tail of the filename
set statusline=%t
" file format
set statusline+=\ %{&ff}
" help file flag
set statusline+=\ %h
" modified flag
set statusline+=\ %m
" read only flag
set statusline+=\ %r
" filetype
set statusline+=\ %y
" cursor column
set statusline+=\ %c,
" cursor line/total lines
set statusline+=\ %l/%L
" percent through file
set statusline+=\ %P


" enable project specific vimrc
set exrc


" Maintain undo history between sessions
set undofile
set undodir=~/.config/nvim/undodir


" Highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespace before save
autocmd BufWritePre * %s/\s\+$//e


" map arrow keys to switch buffers
map <Left> :bprev<CR>
map <Right> :bnext<CR>


" make . to work with visually selected lines
vnoremap . :normal.<CR>


" search down into subfolders
" Provides tab completion for all file -related tasks
set path=**
" Display all matching files when we tab complete
set wildmenu

" Enable folding
set foldenable
" Open most of the folds by default.
" If set to 0, all folds will be closed.
set foldlevelstart=10
" Folds can be nested.
" Setting a max value protects you from too many folds
set foldnestmax=10
" Defines the type of folding
" Other values are indent, syntax, marker,
" expr, diff
set foldmethod=manual


" save file on pressing Ctrl-s
nnoremap <C-s> :update<CR>


" show relative number in normal mode
" show absolute number in insert mode
" augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber


" set leader key
let mapleader = "\<Space>"


" just for example
nnoremap <Leader>w :w<CR>


" mapping to yank, delete paste to/from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p

nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p


" clear highlighted search
nmap <Leader>/ :nohlsearch<CR>


" Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>

" Create file's directory before saving, if it doesn't exist.
" Original: https://stackoverflow.com/a/4294176/151048
" Copied from https://sharats.me/posts/automating-the-vim-workplace/
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
fun! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file !~# '\v^\w+\:\/'
    call mkdir(fnamemodify(a:file, ':h'), 'p')
  endif
endfun
" ********** Editor config ends ********** "


































" ********** Plugins starts ********** "
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" color schemes
Plug 'morhetz/gruvbox'
Plug 'KeitaNakamura/neodark.vim'

Plug 'junegunn/vim-easy-align'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax highlighting for many languages
Plug 'sheerun/vim-polyglot'

" Plugin to update ctags automatically on file save
Plug 'craigemery/vim-autotag'

" Show git diff integrationa and add/remove highlight
Plug 'airblade/vim-gitgutter'
" Git plugin for vim to help in some git commands.
" Mainly using this to help lightline with git
Plug 'tpope/vim-fugitive'

" Plugin to run test from within vim
Plug 'janko/vim-test'

" Plugin to comment code
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()
" ********** Plugins ends ********** "


































" ********** Plugins config start ********** "
colorscheme gruvbox

" fzf mapping to Ctrl-p like
" Ctrl-p plugin
noremap <C-p> :FZF<CR>

" ********** Plugins config ends ********** "
