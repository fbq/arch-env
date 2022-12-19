set nocp
filetype off

call plug#begin("~/.vim/plugged")
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
call plug#end()

filetype on
filetype indent on
filetype plugin on

syntax on
set nu

" setting for js
au FileType javascript setlocal sw=4 sts=4 et ts=4 sta si
au FileType html,xhtml setlocal sw=4 sts=4 et ts=4 sta si

" setting for python
au FileType python setlocal sw=4 sts=4 et ts=4 sta si

" setting for scheme
au FileType scheme setlocal sw=2 sts=2 et sta si

" setting for haskell
au FileType haskell setlocal sw=4 sts=4 et sta si

" setting for tex
au FileType tex setlocal sw=4 sts=4 et sta si
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "xelatex"
let g:Tex_DefaultTargetFormat = "pdf"

" seting for yaml
au FileType yaml setlocal sw=2 sts=2 et sta si

" settig for markdown
au FileType mkd setlocal sw=4 sts=4 et ts=4 sta si

" setting for java
au FileType java setlocal sw=4 sts=4 et ts=4 sta si

" setting for markdown
autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown

" setting for cscope
if filereadable("cscope.out")
  cs add ./cscope.out
endif
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set cscopetag

" always show the status line
set laststatus=2

" settings for vim-airline, stop using any fancy symbol
let g:airline_left_sep='>'
let g:airline_left_alt_sep='>'
let g:airline_right_sep='<'
let g:airline_right_alt_sep='<'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.whitespace='!'
let g:airline_symbols.linenr=':'
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.branch=''

" add ./include into the path to find header file
set path+=include

" make mouse event processible by terminal version vim
set mouse=a

au FileType c,cpp setlocal ts=8 sw=8 noet sts=0 colorcolumn=80
highlight ColorColumn ctermbg=darkgrey
set colorcolumn=+1 " highlight column after 'textwidth'

set clipboard+=unnamed
set clipboard+=unnamedplus

"let g:go_auto_type_info = 1
let mapleader = '\'

let g:pandoc#spell#enabled = 0
nmap gy :YDCVCursor<Enter>
vmap gy :YDCVRange<Enter>

" remember 1000 file location, and ignore /tmp/*
set viminfo='1000,r/tmp,n~/.nviminfo

" restore via viminfo record
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" set keybinding in cmdline mode
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" clang-format settings:
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
"set list lcs=tab:\¦\
"
set hidden

" LSP configuration:
lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

nvim_lsp.rust_analyzer.setup {
    cmd = {"rustup", "run", "nightly", "rust-analyzer"},
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("rust-project.json", "Cargo.toml"),
}
EOF

hi SpecialKey      term=bold ctermfg=81 guifg=Cyan
hi NonText         term=bold ctermfg=12 gui=bold guifg=Blue
hi Directory       term=bold ctermfg=159 guifg=Cyan
hi ErrorMsg        term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
hi IncSearch       term=reverse cterm=reverse gui=reverse
hi Search          term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi MoreMsg         term=bold ctermfg=121 gui=bold guifg=SeaGreen
hi ModeMsg         term=bold cterm=bold gui=bold
hi LineNr          term=underline ctermfg=11 guifg=Yellow
hi CursorLineNr    term=bold ctermfg=11 gui=bold guifg=Yellow
hi Question        term=standout ctermfg=121 gui=bold guifg=Green
hi StatusLine      term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi StatusLineNC    term=reverse cterm=reverse gui=reverse
hi VertSplit       term=reverse cterm=reverse gui=reverse
hi Title           term=bold ctermfg=225 gui=bold guifg=Magenta
hi Visual          term=reverse ctermbg=242 guibg=DarkGrey
hi VisualNOS       term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg      term=standout ctermfg=224 guifg=Red
hi WildMenu        term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi Folded          term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=DarkGrey
hi FoldColumn      term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi DiffAdd         term=bold ctermbg=4 guibg=DarkBlue
hi DiffChange      term=bold ctermbg=5 guibg=DarkMagenta
hi DiffDelete      term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
hi DiffText        term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
hi SignColumn      term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi Conceal         ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi SpellBad        term=reverse ctermbg=9 gui=undercurl guisp=Red
hi SpellCap        term=reverse ctermbg=12 gui=undercurl guisp=Blue
hi SpellRare       term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi SpellLocal      term=underline ctermbg=14 gui=undercurl guisp=Cyan
hi Pmenu           ctermfg=7 ctermbg=233 guibg=Magenta
hi PmenuSel        ctermfg=242 ctermbg=0 guibg=DarkGrey
hi PmenuSbar       ctermbg=248 guibg=Grey
hi PmenuThumb      ctermbg=15 guibg=White
hi TabLine         term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
hi TabLineSel      term=bold cterm=bold gui=bold
hi TabLineFill     term=reverse cterm=reverse gui=reverse
hi CursorColumn    term=reverse ctermbg=242 guibg=Grey40
hi CursorLine      term=underline cterm=underline guibg=Grey40
hi ColorColumn     term=reverse ctermbg=242 guibg=DarkRed
hi Cursor          guifg=bg guibg=fg
hi lCursor         guifg=bg guibg=fg
hi MatchParen      term=reverse ctermbg=6 guibg=DarkCyan
hi Error           term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Comment         term=bold ctermfg=14 guifg=#80a0ff
hi Constant        term=underline ctermfg=13 guifg=#ffa0a0
hi Special         term=bold ctermfg=224 guifg=Orange
hi Identifier      term=underline cterm=bold ctermfg=14 guifg=#40ffff
hi Statement       term=bold ctermfg=11 gui=bold guifg=#ffff60
hi PreProc         term=underline ctermfg=81 guifg=#ff80ff
hi Type            term=underline ctermfg=121 gui=bold guifg=#60ff60
hi Underlined      term=underline cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
hi Ignore          ctermfg=0 guifg=bg
hi Todo            term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
