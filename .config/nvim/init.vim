call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" requires install go get -u github.com/nsf/gocode & python3 (maybe using pyenv)
Plug 'zchee/deoplete-go', { 'do': 'make'}
" for java
Plug 'artur-shaik/vim-javacomplete2'
Plug 'sbdchd/neoformat'
" for python
Plug 'zchee/deoplete-jedi'
" ale
Plug 'w0rp/ale'
call plug#end()

" set 24 bit colors
set termguicolors

" deoplete options
let g:python3_host_prog = expand("$HOME") . '/.pyenv/versions/3.6.3/bin/python'
let g:deoplete#enable_at_startup = 1

" deoplete-go options
set completeopt+=noinsert
set completeopt+=noselect
set ts=2
set showcmd
set updatetime=100
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#gocode_binary = expand("$HOME") . '/go/bin/gocode'

" vim-go options
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_auto_type_info = 1

" airline options
let g:airline_powerline_fonts = 1

" personal shortcuts
let mapleader = ","
" get away from the faraway escape key!!
inoremap <esc> <nop>
inoremap jk <esc>
vnoremap <esc> <nop>
vnoremap jk <esc>
tnoremap jk <c-\><c-n>
" get away from arrow keys everywhere! 
inoremap <left>     <c-w>w
inoremap <right>    <c-w>w
nnoremap <left>     <c-w>w
nnoremap <right>    <c-w>w
tnoremap <left>     <c-\><c-n><c-w>w
tnoremap <right>    <c-\><c-n><c-w>w
" make it easier to edit vim config
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" quote a word
nnoremap <leader>"  viw<esc>a"<esc>bi"<esc>lel
" save file
nnoremap <leader>w  :w<cr>
" quit file
nnoremap <leader>q  :q<cr>
" open terminal
nnoremap <leader>sh :split term://bash<cr>A
" open NERDtree
nnoremap <leader>ls :NERDTreeToggle<cr>
" make it convenient to copy/ paste from system clipboards
noremap <leader>y "*y
noremap <leader>p "*p

augroup nerdtree_defaults
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup end

augroup filetype_golang
  autocmd!
  autocmd FileType go nnoremap <leader>cc :GoInstall<cr>
  autocmd FileType go iabbrev lwe if err != nil {<cr>logger.WithError(err).WithFields(logger.Fields{}).Error()<cr>}
  autocmd FileType go iabbrev lwf logger.WithFields(logger.Fields{}).Info()jk8hi
augroup end

augroup filetype_java
  autocmd!
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd BufWritePre * undojoin | Neoformat
augroup end

