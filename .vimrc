" http://d.hatena.ne.jp/holypp/20110515/1305443997
set nocompatible
filetype off

set nocompatible

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 末尾の半角スペースを視覚化
NeoBundle 'bronson/vim-trailing-whitespace'
" less用のsyntaxハイライト
NeoBundle 'KohPoll/vim-less'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等(使いこなせていない)
NeoBundle 'tpope/vim-surround'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" 余談: neocompleteは合わなかった。ctrl+pで補完するのが便利

set tags=~/.tags
set noswapfile
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
set shiftwidth=2
set smarttab
set tabstop=2
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
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" http://inari.hatenablog.com/entry/2014/05/05/231307
" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" For vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""

" filetypeの自動検出
filetype on

" 前回開いた位置を覚える
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" 自動的に閉じ括弧を入力
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" よく使うコマンド
" 移動系
" HML
" z
" e, w, b
" *で検索
" %でカッコを行き来する
" :nでn行目に移動
" ggで先頭に移動
" Gで末尾に移動
" ctrl+F / ctrl+B
" ctrl+e / ctrl+yで移動
" 0 ^ $
"
"
" 編集系
" ci" catとか
" 複数行をひとまとめに
" 置換
" .で繰り返し
" 2ddとか
" oやO
" 矩形選択、矩形編集
" I / A
" cとsとiとa
" dwで単語削除
" >>でインデント
" D
" Rで置換
" ctrl+a ctrl+xで数字を上下
" ~やgU等で大文字小文字を入れ返る
" uでアンドゥ
" ctrl+p
"
"
" ウインドウ操作等
" ウインドウ分割
" エンコード変換
" set filetype
" set nowrap
" zf zO
