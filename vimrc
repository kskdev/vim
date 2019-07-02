"//		vim setting and tips		//
"Backspaceで何でも文字を削除できるように設定
set backspace=start,eol,indent 
" バッファの文字コードの設定
set encoding=utf-8 
" 設定した候補から自動で文字コードを設定
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
"ファイルフォーマットをOSから自動で設定
set fileformats=unix,dos,mac
" スワップファイル不要
set noswapfile  
" バックアップファイル不要
set nobackup 
" 背景の透過処理
highlight Normal ctermbg=none

"::::::::::::::::::::::::::::::::::
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

" 分割ペインの背景色
augroup ChangeBackground
  autocmd!
  " 操作中のペインの背景色定義
  autocmd WinEnter * highlight Normal guibg=default
  " 非操作のペインの背景色定義
  autocmd WinEnter * highlight NormalNC guibg='#102020'
augroup END

":::::::::::::::::::::::::::::::::::::
"::::::::::search setting
" 検索結果のハイライト表示
set hlsearch 
" 小文字入力時,大文字も含めて検索
set ignorecase
set smartcase 
" 入力文字数を増やすと候補が絞られる
set incsearch 
" Escで検索ハイライトを削除
nnoremap <ESC> :nohlsearch<CR><ESC>

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
" スラッシュを入力した時，ファイルパス補完が自動発動 (deopleteに任せるので不要)
" imap <expr> / pumvisible() ? "\<C-E>/\<C-X>\<C-F>\<C-P>" : "/\<C-X>\<C-F>\<C-P>"

" 補完候補のポップアップ数
set pumheight=12

"::::::::::::::::::::::::::::::::::::::
"::::::::::Key Map

"  vimのファイルパス補完のマッピングを変更
inoremap <C-x><C-f> <C-X><C-F><C-P>

" ノーマルモード時だけ ; と : を入れ替える(US配列に打ちやすさを考慮)
" ただし,検索リピートの邪魔になるので現在は無効化
" nnoremap ;; :

" インサートモード時左右に動けるようにする
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 連続入力が必要なコマンドの入力受付時間[ms]
set timeoutlen=500
" ESCを押してからノーマルモードに移行するまでの待機時間[ms]
set ttimeoutlen=10

" 画面切り替え(Ctrl+wを2回も押すのは面倒)
nnoremap <C-w> <C-w><C-w>

" インサートモードでESCを入力した時,IMEをOFFにする
" 何とかしてmac版,win版を作りたいが作れるならとっくに誰かが作ってるはず...
" 現状 macはkarabinerを利用するしか無いかも?
function! OffFcitx()
    if has('unix')
        call system('fcitx-remote -c')
        echo 'switched [jp] -> [en]'
    else
        echo ''
    endif
endfunction

inoremap <ESC> <ESC>:call OffFcitx()<CR>
inoremap fff <ESC>:call OffFcitx()<CR><ESC>
inoremap fff <ESC>:call OffFcitx()<CR><ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  /$$$$$$$            /$$          
"  | $$__  $$          |__/          
"  | $$  \ $$  /$$$$$$  /$$ /$$$$$$$ 
"  | $$  | $$ /$$__  $$| $$| $$__  $$
"  | $$  | $$| $$$$$$$$| $$| $$  \ $$
"  | $$  | $$| $$_____/| $$| $$  | $$
"  | $$$$$$$/|  $$$$$$$| $$| $$  | $$
"  |_______/  \_______/|__/|__/  |__/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" OSごとの設定
if has('mac') " mac用の設定
    " ヤンクをClipboardに入れる
    set clipboard+=unnamed
    " Pythonインタープリターのパス指定
    let g:python3_path = substitute(system('which python3'),"\n","","")
    " プラグインのパス指定
    let s:neovim_dein_dir = expand('~/.config/nvim')
    let s:vim_dein_dir = expand('~/.vim/dein')
    let s:neovim_toml_dir = expand('~/.config/nvim')
    let s:vim_toml_dir = expand('~/.vim')

elseif has('unix') " unix用の設定
    " ヤンクをClipboardに入れる
    set clipboard+=unnamedplus
    " Pythonインタープリターのパス指定
    let g:python3_path = expand(substitute(system('which python3'),"\n","",""))
    " プラグインのパス指定
    let s:neovim_dein_dir = expand('~/.config/nvim')
    let s:vim_dein_dir = expand('~/.vim/dein')
    let s:neovim_toml_dir = expand('~/.config/nvim')
    let s:vim_toml_dir = expand('~/.vim')

elseif has('win64') && has('win32') " 64bit & 32bit windows用の設定
    " Pythonインタープリターのパス指定
    let g:python3_path = expand('~\Anaconda3\python.exe')
    " プラグインのパス指定
    let s:neovim_dein_dir = expand('~\.cache\dein')
    let s:vim_dein_dir = expand('~\.cache\dein')
    let s:neovim_toml_dir = expand('~\AppData\Local\nvim')
    let s:vim_toml_dir = expand('~\.cache\dein')

elseif has('win32unix') " Cygwin固有の設定
    echo 'No implementation!'
endif


" Python3インタープリターのパス指定(2系を指定する必要はほぼ無いかも)
let g:python3_host_prog = g:python3_path
" let g:python_host_prog = g:python2_path

" viとの互換を切る
if &compatible
    set nocompatible
endif

" dein.vimとtomlファイルのパスをセット
if has('nvim')
    let g:dein_dir = s:neovim_dein_dir
    let s:toml_dir = s:neovim_toml_dir
else
    let g:dein_dir = s:vim_dein_dir
    let s:toml_dir = s:vim_toml_dir
endif

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = g:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" プラグインのロード
call dein#begin(g:dein_dir)
call dein#add(s:dein_repo_dir)
call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
call dein#end()

" プラグインが入っていなければvim起動時に自動でインストール
if dein#check_install()
    call dein#install()
endif

filetype on
filetype plugin on
filetype indent on
syntax on
