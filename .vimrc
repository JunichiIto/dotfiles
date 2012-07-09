" http://d.hatena.ne.jp/holypp/20110515/1305443997
set nocompatible
filetype off

set rtp+=~/dev/dotfiles/vimfiles/vundle.git/
call vundle#rc()
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/dbext.vim'
Bundle 'nathanaelkane/vim-indent-guides'
filetype plugin indent on     " required!

set tags=~/.tags
set directory=~/.vimswap
set ruler
set cmdheight=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline+=%{fugitive#statusline()}
set title
set linespace=0
set wildmenu
set showcmd
set backupdir=$HOME/.vimbackup
set browsedir=buffer 
set smartcase
set listchars=tab:>\ ,extends:<
set hlsearch
set background=dark
set autoindent
set expandtab
set incsearch
set hidden
set list
set number
set showmatch
set smartindent
set shiftwidth=4
set smarttab
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
syntax on
colorscheme desert
highlight LineNr ctermfg=darkyellow

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" for dbext
let dbext_default_SQLITE_bin = 'sqlite3'

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" 末尾の半角スペースを視覚化
highlight WhiteSpaceEOL guibg=#fff
2match WhiteSpaceEOL /\S\@<=\s\+$/

" For vim-ref
let g:ref_refe_encoding = 'euc-jp'

" For vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
