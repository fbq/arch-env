set nu
set nocp
syntax on

filetype on
filetype indent on
filetype plugin on

" setting for js
au FileType javascript setlocal sw=2 sts=2 et ts=2 sta si
au FileType html setlocal sw=2 sts=2 et ts=2 sta si

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

