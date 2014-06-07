set nocompatible
set shell=/bin/bash

call pathogen#infect()
syntax on
filetype plugin indent on

set relativenumber
set laststatus=2


" let g:zenburn_transparent = 1
" colors zenburn

"colors
set background=dark
colorscheme lucius
let g:lucius_no_term_bg = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'lucius'

hi Normal             ctermbg=NONE
hi Statement          ctermbg=NONE
hi Title              ctermbg=NONE
hi Todo               ctermbg=NONE
hi Underlined         ctermbg=NONE
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
let mapleader = ","
let maplocalleader = "-"

" edit vim file
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" removetrailing whitespace
nnoremap <silent> <leader>rw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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

" haskell
augroup haskGroup
    autocmd!
    " for hothasktags
    au BufNewFile,BufRead *.hs :set iskeyword=a-z,A-Z,_,.,39,48-57
    " show types in autocomplete
    au BufNewFile,BufRead *.hs :let g:necoghc_enable_detailed_browse = 1
augroup END


" neocomplcache
let g:neocomplete#enable_at_startup = 1
" Sets minimum char length of syntax keyword.
let g:neocomplete#sources#syntax#min_keyword_length = 3

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" airline stuff
let g:airline#extensions#tabline#enabled = 1

" unite stuff
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>
nnoremap <leader>f :Unite file<CR>
nnoremap <Space>/ :Unite grep:.<CR>
nnoremap <leader>b :Unite -quick-match buffer<CR>
if executable('ag')
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
endif

" nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>

let g:toggle_list_restore = 0

" syntastic
let g:syntastic_always_populate_loc_list = 1

" neosnippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" TAB: if popup menu is visible then cycle that
"      else check for an exandable snippet
"      else tab
imap <expr><TAB> pumvisible() 
  \? "\<C-n>" 
  \: neosnippet#expandable_or_jumpable() 
    \? "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable()
  \? "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
