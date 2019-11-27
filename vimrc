"//		vim setting and tips		//
" Backspaceで何でも文字を削除できるように設定
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
" □ や○ 文字が崩れ問題を解消
" set ambiwidth=double
" Concealの無効化(マルチバイト文字の修飾表現)
let g:tex_conceal = ''
" マウスの利用
" set mouse=a
" ファイル展開時,カーソル位置復元
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"::::::::::::::::::::::::::::::::::
"::::::::::display setting
" 行数を表示
set number
" ステータスラインに行数を表示
set ruler
" カーソル業をハイライト
set cursorline
" 対応する括弧をハイライト
set showmatch
" showmatchのハイライト時間を調整(1 is 0.1sec)
set matchtime=1
" 入力中のコマンドを表示
set showcmd
" 現在のコマンドモードを非表示
set noshowmode
" コマンドラインの行数
set cmdheight=1
" N行余裕を持たせてスクロール
set scrolloff=3
" ステータスラインを常に表示
set laststatus=2
" エディタの編集タイトルを表示しない
set notitle
" 左端2文字分の空間を常に表示
set signcolumn=yes

":::::::::::::::::::::::::::::::::::::
"::::::::::search setting
" 検索結果のハイライト表示
set hlsearch
" 大文字小文字無視して検索
set ignorecase
" 入力文字数を増やすと候補が絞られる
set incsearch
" Escで検索ハイライトを削除
nnoremap <silent><ESC> :nohlsearch<CR>

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
" 言語別設定
filetype on
filetype indent on
augroup fileTypeIndent
    autocmd!
    au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    au BufNewFile,BufRead *.zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au BufNewFile,BufRead *.sh setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au BufNewFile,BufRead *.tex setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

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
" 補完候補のポップアップ数
set pumheight=12

"::::::::::::::::::::::::::::::::::::::
"::::::::::Key Map

" Leaderキーの変更 from ',' to <Space>
let mapleader = "\<Space>"

"  vimのファイルパス補完のマッピングを変更
inoremap <C-x><C-f> <C-X><C-F><C-P>

" ノーマルモード時だけ ; と : を入れ替える(US配列に打ちやすさを考慮)
" ただし,検索リピートの邪魔になるので現在は無効化
" nnoremap ;; :

" インサートモードでのカーソル挙動
inoremap <C-l> <Right>

" 連続入力が必要なコマンドの入力受付時間[ms]
set timeoutlen=500
" ESCを押してからノーマルモードに移行するまでの待機時間[ms]
set ttimeoutlen=10

" 画面切り替え(Ctrl+wを2回も押すのは面倒)
nnoremap <C-w> <C-w><C-w>

" 左右のカーソルh,lで行間も移動可能にする(h,lの追加は非推奨らしい...)
set whichwrap=b,s,<,>,[,],h,l

" インサートモードからノーマルモードへ移行
" (Linux+fcitxの場合は日本語入力を無効化してノーマルモードに移行)
function! OffFcitx()
    call system('fcitx-remote -c')
endfunction
if has('unix')
    inoremap jj <ESC>:call OffFcitx()<CR>
    inoremap っｊ <ESC>:call OffFcitx()<CR>
else
    inoremap jj <ESC>
    inoremap っｊ <ESC>
endif

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
call dein#add('morhetz/gruvbox')
call dein#add('joshdick/onedark.vim')
call dein#add('cocopon/iceberg.vim')
call dein#add('jacoborus/tender.vim')
call dein#load_toml(s:toml_dir . '/Plugins/UIexpantion/statusline.toml')
call dein#load_toml(s:toml_dir . '/Plugins/utils.toml')
call dein#load_toml(s:toml_dir . '/Plugins/Autocompletion/deoplete.toml') " asyncomplete.toml と選択
" call dein#load_toml(s:toml_dir . './Plugins/Autocompletion/asyncomplete.toml') " deoplete.toml と選択
call dein#load_toml(s:toml_dir . '/Plugins/Autocompletion/lsp.toml')
call dein#load_toml(s:toml_dir . '/Plugins/Autocompletion/others.toml')
call dein#load_toml(s:toml_dir . '/Plugins/Filer/fzf.toml')  " denite.toml と選択
" call dein#load_toml(s:toml_dir . '/Plugins/Filer/denite.toml')  " fzf.toml と選択
call dein#end()

" プラグインが入っていなければvim起動時に自動でインストール
if dein#check_install()
    call dein#install()
endif
filetype plugin on

" カラースキーマの設定(vimとneovimで色分け)
syntax on
if has('nvim')
    " gruvboxを利用
    set termguicolors  " enable true colors support
    set background=dark
    colorscheme gruvbox
else
    colorscheme onedark
endif


