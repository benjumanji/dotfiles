set nocompatible
set shell=/bin/bash

syntax on
filetype plugin indent on

set diffopt=filler,vertical
set fillchars=
set hidden

set wildmode=longest,list,full
set wildmenu

call plug#begin('~/.vim/plugged')
Plug 'AlessandroYorba/Sierra'
Plug 'bkad/vim-terraform'
Plug 'cespare/vim-toml'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'dag/vim-fish'
Plug 'derekwyatt/vim-scala'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'evidens/vim-twig'
Plug 'gilligan/vim-textobj-haskell'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'jwalton512/vim-blade'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-slash'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'
Plug 'Lokaltog/vim-easymotion'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'raichoo/haskell-vim'
Plug 'rust-lang/rust.vim'
Plug 'saltstack/salt-vim'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'solarnz/thrift.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'whatyouhide/vim-gotham'
call plug#end()

" hybrid cool kid mode
set relativenumber
set number

set laststatus=2


"colors
if (has("termguicolors"))
  set termguicolors
endif

colorscheme tender
let g:lightline = { 'colorscheme': 'tenderplus' }

" tab width 4 spaces
" size of a hard tabstop
set tabstop=2

" size of an "indent"
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

" You may also want to try the following:
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" my mappings
let mapleader = " "
let maplocalleader = "-"

" edit vim file
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" edit i3 config
nnoremap <leader>ei :edit ~/.config/i3/config<cr>

" removetrailing whitespace
nnoremap <silent> <leader>rw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

""misc
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
nnoremap <leader>/ :Unite grep:.<CR>
nnoremap <leader>b :Unite -start-insert buffer<CR>
nnoremap <leader>o :Unite outline<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>

if executable('ag')
    let g:unite_source_rec_async_command =
      \ ['ag', '--follow', '--nocolor', '--nogroup',
      \  '--hidden', '-g', '']
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --smart-case --hidden'
    let g:unite_source_grep_recursive_opt = ''
endif

" syntastic
let g:syntastic_always_populate_loc_list = 1

" TAB: if popup menu is visible then cycle that
"      else tab
imap <expr><TAB> pumvisible()
  \? "\<C-n>"
  \: "\<TAB>"

vmap <Enter> <Plug>(EasyAlign)

" vimfiler
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_ignore_pattern = ".*\.swp$"
nnoremap <leader>f :VimFilerBufferDir<cr>

"gundo
nnoremap <leader>u :GundoToggle<cr>
set undofile
set undodir=~/.vim/undo

"dispatch
nnoremap <leader>d :Dispatch<cr>

"jsx
let g:jsx_ext_required = 0

"easy motion
nmap s <Plug>(easymotion-s2)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Switch off Background Color Erase
set t_ut=
