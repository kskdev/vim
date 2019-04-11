"//		vim setting and tips		//

"Backspaceで既存の文字を削除できるように設定
set backspace=start,eol,indent 
" バッファの文字コードの設定
set encoding=utf-8 
" 設定した候補から自動で文字コードを設定
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8 
"ファイルフォーマットをOSから自動で設定
set fileformats=unix,dos,mac
" スワップファイル不要
set noswapfile  
" バックアップファイル不要
set nobackup 
" 背景の透過処理
highlight Normal ctermbg=none


:"::::::::::::::::::::::::::::::::::
"::::::::::display setting
"行数を表示
set number 
"ステータスラインに行数を表示 
set ruler 
"カーソル業をハイライト
set cursorline 
"対応する括弧をハイライト
set showmatch 
" showmatchのハイライト時間を調整(1 is 0.1sec)
set matchtime=1
"入力中のコマンドを表示
set showcmd 
"現在のコマンドモードを表示
set showmode 
"N行余裕を持たせてスクロール
set scrolloff=3 
"ステータスラインを常に表示
set laststatus=2 
"エディタの編集タイトルを表示しない
set notitle 
" 補完候補ポップアップの数を調整
set pumheight=10

":::::::::::::::::::::::::::::::::::::
"::::::::::search setting
" 検索結果のハイライト表示
set hlsearch 
" 大文字小文字を無視して検索．smartcaseとの組み合わせで，小文字検索:大小文字を無視 and 大文字検索:大小文字を区別
set ignorecase 
set smartcase 
" 入力文字数を増やすと候補が絞られる
set incsearch 
" Esc2回押しで検索ハイライトを削除
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>


"::::::::::::::::::::::::::::::::::::::
"::::::::::indent setting
" Tabを押した時，Tab文字を使わず半角スペースを使う
set expandtab
" タブ文字の幅の設定
set tabstop=4
" 自動インデントの幅
set shiftwidth=4
" 改行時に行からインデントの増減を行う．
set smartindent

"::::::::::::::::::::::::::::::::::::::
"::::::::::autoComplete setting
" CLモードでTabキーによるファイル名補完を有効化
set wildmenu
" 大文字小文字を無視
set wildignorecase
" 補完一覧を表示
set wildmode=list,full

" 補完候補が1つでもポップアップを表示
set completeopt=menuone
" ファイルパス補完 (スラッシュを入力した時，補完が自動発動)
" ref : http://io-fia.blogspot.com/2012/11/vimvimrc.html)
imap <expr> / pumvisible() ? "\<C-E>/\<C-X>\<C-F>\<C-P>" : "/\<C-X>\<C-F>\<C-P>"
" inoremap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-O>\<C-P>'

"::::::::::::::::::::::::::::::::::::::
"::::::::::Key Map
" Normal Mode に戻るためのコマンド
inoremap <silent> <ESC><ESC> <ESC>
inoremap <silent> fff <ESC>
inoremap <silent> っっｆ <ESC>

" ノーマルモード時だけ ; と : を入れ替える(US配列に打ちやすさを考慮)
nnoremap ;; :

" 日本語入力モードでもコマンドを入力できるようにする
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   dein.vim setting
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on
filetype plugin on
filetype indent on
syntax enable


if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.vim/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.vim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" プラグインが入っていなければvim起動時に自動でインストール
if dein#check_install()
  call dein#install()
endif
