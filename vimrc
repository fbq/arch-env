set nu
set nocp
syntax on

filetype on
filetype indent on
filetype plugin on

" setting for js
au BufCreate,BufEnter *.js setlocal sw=2 sts=2 et ts=2 sta
au BufCreate,BufEnter *.ejs setlocal sw=2 sts=2 et ts=2 sta si

" setting for scheme
au BufCreate,BufEnter *.ss setlocal et
