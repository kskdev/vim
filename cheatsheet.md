`:Cheat` : ,<Normal> [vim-cheatsheet] チートシートを表示

# Autocompletion (deoplete & vim-lsp)

# Search
  - `Ctrl+n`,           <Normal> [nerdtree]               ファイルツリーペインの表示切り替え
  - `Ctrl+p`,           <Normal> [fzf]                    ファイル一覧表示
  - `Ctrl+g`,           <Normal> [fzf]                    ripgrepによる文字列検索
  - `Ctrl+h`,           <Normal> [fzf]                    開いたファイルの履歴表示
  - `Ctrl+t`,           <Normal> [fzf]                    開いているバッファを表示
  - `*`,                <Visual> [vim-visual-star-search] Visualモードの選択範囲を検索

# Cursor jump
  - `s+s+{key}`,        <Normal> [vim-easymotion]         `{key}`がハイライトされる．
  - `Ctrl+d`,           <Normal> [vim-gitgutter]          次のハンクに移動
  - `Ctrl+f`,           <Normal> [vim-gitgutter]          前のハンクに移動
  - `:Gdiff`,           <Normal> [vim-fugitive]           git diff
  - `:Vista`,           <Normal> [vista.vim]              タグペインを起動

# Edit
  - `sa{op}{sign}`,     <Normal> [vim-sandwich]           {op} の対象を {sign} で囲む
  - `sd{op}{sign}`,     <Normal> [vim-sandwich]           {sign} で囲まれた {op} の対象を削除
  - `sr{sign1}{sign2}`, <Normal> [vim-sandwich]           囲み文字{sign1} を{sign2} に置換
  - `ga{sign}`,         <Visual> [vim-easy-align]         Visualモードの選択範囲を{sign}で揃える
  - `gcc`,              <Normal> [Normal]                 行のコメント化/コメント解除
  - `Ctrl+s`,           <Normal> [vim-over]               置換の起動
  - `sub`,              <Normal> [vim-over]               カーソル上のテキストオブジェクトを置換
