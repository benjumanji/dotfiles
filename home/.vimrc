call pathogen#infect()
syntax on
filetype plugin indent on
set shell=/usr/bin/bash

" let g:zenburn_transparent = 1
" colors zenburn

"colors
set background=dark
colors solarized
let g:solarized_termtrans = 1

hi Normal             ctermbg=NONE     
hi Statement          ctermbg=NONE
hi Title              ctermbg=NONE
hi Todo               ctermbg=NONE
hi Underlined         ctermbg=NONE
hi DiffAdd            ctermbg=NONE
hi DiffText           ctermbg=NONE
hi ErrorMsg           ctermbg=NONE
hi LineNr             ctermbg=NONE

" tab width 4 spaces
" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" You may also want to try the following:
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" my mappings
let mapleader = "-"
let maplocalleader = "\\"

" edit vim file
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

""misc
nnoremap <leader>c ddO
inoremap jk <esc>
"inoremap <esc> <nop>
onoremap H ^
onoremap L $
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" ghc mod
" augroup haskGroup
"     autocmd!
"     autocmd BufNewFile,BufRead *.hs call hsf#SetGhcPackagePath()
"     autocmd BufNewFile,BufRead *.hs call hsf#SetTags()
" augroup END

" for hothasktags
set iskeyword=a-z,A-Z,_,.,39

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" neco-ghc
let g:necoghc_enable_detailed_browse = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
