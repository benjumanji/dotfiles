set nocompatible
set shell=/bin/bash

syntax on
filetype plugin indent on

set diffopt=filler,vertical
set fillchars=

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'bkad/vim-terraform'
Plug 'bling/vim-airline'
Plug 'dag/vim-fish'
Plug 'derekwyatt/vim-scala'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'evidens/vim-twig'
Plug 'gilligan/vim-textobj-haskell'
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'
Plug 'Lokaltog/vim-easymotion'
Plug 'lukaszb/vim-web-indent'
Plug 'mustache/vim-mustache-handlebars'
Plug 'raichoo/haskell-vim'
Plug 'saltstack/salt-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'solarnz/thrift.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'whatyouhide/vim-gotham'
call plug#end()

" hybrid cool kid mode
set relativenumber
set number

set laststatus=2


"colors
colorscheme gotham
let g:airline_powerline_fonts = 1

" hi Normal             ctermbg=NONE
" hi Statement          ctermbg=NONE
" hi Title              ctermbg=NONE
" hi Todo               ctermbg=NONE
" hi Underlined         ctermbg=NONE
" hi ErrorMsg           ctermbg=NONE
" hi LineNr             ctermbg=NONE

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

" unite stuff
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>
nnoremap <leader>f :Unite file<CR>
nnoremap <Space>/ :Unite grep:.<CR>
nnoremap <leader>b :Unite -quick-match buffer<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>

if executable('ag')
    let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --smart-case --hidden'
    let g:unite_source_grep_recursive_opt = ''
endif

" nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" syntastic
let g:syntastic_always_populate_loc_list = 1

" TAB: if popup menu is visible then cycle that
"      else tab
imap <expr><TAB> pumvisible()
  \? "\<C-n>"
  \: "\<TAB>"

vmap <Enter> <Plug>(EasyAlign)
