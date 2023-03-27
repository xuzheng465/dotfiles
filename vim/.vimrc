set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible
set hidden
" highlight search
set hlsearch

set autoindent
set smartindent

set mouse=a
set tabstop=4
set shiftwidth=4

set t_Co=256
syntax on

set number
set showmatch
" use ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

nnoremap <F5> :source ~/.vimrc<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>g :Commits<CR> 
nnoremap <silent> <Leader>H :Helptags<CR> 
nnoremap <silent> <Leader>hh :History<CR> 
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" strike esc twice cancel the highlight
nnoremap <esc><esc> :noh<return><esc>
