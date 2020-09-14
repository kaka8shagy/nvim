" ********** Editor config starts ********** "
" Use Vim settings, rather than Vi settings
set nocompatible
" Indent by 4 spaces when hitting tab
set softtabstop=4
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
" ignore this files
set wildignore=*.swp,*.bak,*.pyc,*.class
" maps system keyboard to vim's paste buffer
set clipboard=unnamedplus


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


" Disable mouse
set mouse-=a
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
" Show existing tab with 2 spaces width.
set tabstop=2
" When indenting with ‘>’, use 2 spaces width.
set shiftwidth=2
" On pressing tab, insert 2 spaces.
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
set foldmethod=indent


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

" to skip pressing Shift everytime
" suggestion taken from https://nvie.com/posts/how-i-boosted-my-vim/
nnoremap ; :

" use jk to switch to normal mode to be more efficient
" going to Esc key is too tiring :-)
inoremap jk <ESC>


" run ruby code using leader-r only when inside a .rb file
autocmd BufRead, *.rb nmap <leader>r :!ruby %<cr>

" run python code using leader-p only when inside a .py file
autocmd BufRead, *.py nmap <leader>p :!python %<cr>

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

" Plugin for status line
Plug 'itchyny/lightline.vim'
" Plugin to display open buffers
Plug 'mengelbrecht/lightline-bufferline'

" Intellisence engine for nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-css'
Plug 'neoclide/coc-python'
Plug 'neoclide/coc-emmet'
Plug 'neoclide/coc-html'
Plug 'neoclide/coc-rls'
Plug 'neoclide/coc-tsserver'
Plug 'elixir-lsp/coc-elixir'
Plug 'hyhugh/coc-erlang_ls'
Plug 'felippepuhle/coc-graphql'
Plug 'fannheyward/coc-julia'
Plug 'fannheyward/coc-rust-analyzer'
Plug 'voldikss/coc-todolist'
Plug 'neoclide/coc-prettier'

" For markdown support in vim
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" easy motion inside vim
Plug 'easymotion/vim-easymotion'

" devicons
Plug 'ryanoasis/vim-devicons'

" limelight, highlight lines around the cursor
Plug 'junegunn/limelight.vim'

" For closing all except current buffer
source $HOME/.config/nvim/bufonly.vim

" Initialize plugin system
call plug#end()
" ********** Plugins ends ********** "


































" ********** Plugins config start ********** "
colorscheme gruvbox


" fzf mapping to Ctrl-p like
" Ctrl-p plugin
noremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
\}


" lightline bufferline config
set showtabline=2 " always show tabline

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline#bufferline#filename_modifier = ':t' " only show filename

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}


" Setting to remap go to definitions and implementation using language servers
" with the help of coc language servers
" Remap keys for gotos:
let g:coc_disable_startup_warning = 1

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" EasyMotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7

" set fira code as the font for vim
set guifont=Fira\ Code\ Regular\ Nerd\ Font\ Complete

" ********** Plugins config ends ********** "
