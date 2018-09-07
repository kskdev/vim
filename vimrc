"//		vim setting and tips		//

" Backspaceで既存の文字を削除できるように設定
set backspace=start,eol,indent 
"Set character code as UTF-8
set encoding=utf-8 
"Set reading code
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8 
"ファイルに書き込む文字コードを指定する
set fileencoding=utf-8 
set fileformats=unix,dos,mac
" スワップファイル不要
set noswapfile  
" バックアップファイル不要
set nobackup 
" 背景の透過処理
highlight Normal ctermbg=none
" 24bitカラーの適用 (vim>=8.0 or Neovim>=0.1.5)
if (has("termguicolors")) 
 set termguicolors
endif

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


":::::::::::::::::::::::::::::::::::::
"::::::::::search setting
" 検索結果のハイライト表示
set hlsearch 
" 大文字小文字を無視して検索．ただしsmartcase と組み合わせることで，
"" 小文字検索:大小文字を無視. 大文字検索:大小文字を区別
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
"::::::::::indent autoComplete
" CLモードでTabキーによるファイル名補完を有効化
set wildmenu
" ファイル名補完の挙動 (lists:補完したリスト , full:Tabを押して次の候補を補完)
set wildmode=list:full

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


if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

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

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
