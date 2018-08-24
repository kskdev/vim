"//		vim setting and tips		//


" set backspace=indent,eol,start
set encoding=utf-8 "Set character code as UTF-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8 "Set reading code
set fileencoding=utf-8 "Set character code as UTF-8 in writing"
set fileformats=unix,dos,mac
set noswapfile  " No make swap file
set nobackup " No make backup file
highlight Normal ctermbg=none
set guioptions+=a "Yank clipboard"
" autocmd BufWritePre * :%s/\s\+$//ge "Delete wasted space at end of line

:"::::::::::::::::::::::::::::::::::
"::::::::::display setting
set number "行数を表示"
set ruler "ステータスラインに行数を表示 "
set cursorline "カーソル業をハイライトする"
set showmatch "対応する括弧をハイライトする"
set showcmd "入力中のコマンドを表示する"
set showmode "現在のモードを表示する"
set scrolloff=3 "N行余裕を持たせてスクロール"
set laststatus=2 "ステータスラインを常に表示"
set notitle "エディタの編集タイトルを表示しない"


":::::::::::::::::::::::::::::::::::::
"::::::::::search setting
set hlsearch
set ignorecase
set smartcase
set incsearch
" Delete highlight
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

"::::::::::::::::::::::::::::::::::::::
"::::::::::indent setting
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent


"::::::::::::::::::::::::::::::::::::::
"::::::::::indent autoComplete
set wildmenu
set wildmode=list:full

"::::::::::::::::::::::::::::::::::::::
"::::::::::Key Map
inoremap <silent> <ESC><ESC> <ESC>
inoremap <silent> fff <ESC>
inoremap <silent> っっｆ <ESC>

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

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
