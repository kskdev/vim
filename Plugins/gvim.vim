" GVim用設定ファイル

"----------------------
" Screen UI
"----------------------
" ウインドウの高さ
set lines=30
" ウインドウの幅
set columns=100
" コマンドラインの高さ(GUI使用時)
set cmdheight=1
" タブバーCUI化
set guioptions-=e
" ツールバー非表示
set guioptions-=T
" メニューバー非表示
set guioptions-=m
" スクロールバー非表示(左右/水平)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=h

"----------------------
" Mouse UX
"----------------------
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切り替える)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

"----------------------
" Input for japanese
"----------------------
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=Purple
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  " (8.0.1114 でデフォルトになったが念のため残してある)
  set iminsert=0 imsearch=0
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"----------------------
" Font
"----------------------
" Windows用 (Win+R実行後，%windir%\fonts を入力すると確認できる)
" Cicaを入れることをおすすめ．理由は，Powerlineのようなシンボル文字が利用可能
" https://github.com/miiton/Cica/releases を選択した(withoutでも良いと思う)
set guifont=Cica-Regular:h16:cSHIFTJIS  " 使わなくても良いかも(くどい)
" set guifont=MS_Gothic:h12:cSHIFTJIS  " Default
"set guifont=MS_Mincho:h12:cSHIFTJIS   " Default
" 行間隔の設定
set linespace=1
" 一部のUCS文字の幅を自動計測して決める
if has('kaoriya')
  set ambiwidth=auto
endif
