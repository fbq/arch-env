set nocp
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'fbq/mvp'
Bundle 'snipMate'

filetype on
filetype indent on
filetype plugin on

syntax on
set nu

" setting for js
au FileType javascript setlocal sw=4 sts=4 et ts=4 sta si
au FileType html setlocal sw=4 sts=4 et ts=4 sta si

" setting for python
au FileType python setlocal sw=4 sts=4 et ts=4 sta si

" setting for haskell
" this no need for setting for haskell, just download vim script from
" http://www.vim.org/scripts/script.php?script_id=4407
" and put it in ~/.vim/indent/

" setting for scheme
au FileType scheme setlocal sw=2 sts=2 et sta si

" setting for cscope
cs add ./cscope.out
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag

set laststatus=2
