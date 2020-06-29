`:Cheat` ,<Normal> [vim-cheatsheet] チートシートを表示
`Ctrl+c` ,<Normal> [vim-cheatsheet] チートシートを開く/閉じる(:Cheat のショートカット)
# Autocompletion (deoplete & vim-lsp)
- `<Tab>`,            <Insert>  [deoplete]       (候補表示中に)次の候補を選択
- `<Shift+Tab>`,      <Insert>  [deoplete]       (候補表示中に)前の候補を選択
- `Ctrl+l`,           <Normal>  [vim-lsp]        定義元へジャンプ
- `Ctrl+j`,           <Normal>  [vim-lsp]        次のエラー行へジャンプ
- `Ctrl+k`,           <Normal>  [vim-lsp]        前のエラー行へジャンプ
# Search
- `<Leader>a`,        <Normal>  [fzf]            ripgrepによる文字列検索
- `<Leader>s`,        <Normal>  [fzf]            現在展開中のバッファの文字列を検索
- `<Leader>d`,        <Normal>  [fzf]            開いているバッファを表示
- `<Leader>f`,        <Normal>  [fzf]            ファイル一覧表示
- `<Leader>q`,        <Normal>  [fzf]            開いたファイルの履歴表示
- `<Leader>w`,        <Normal>  [fzf]            マークの一覧表示
- `Ctrl+f`,           <Insert>  [fzf]            カレントディレクトリ以下のファイルパス補完
- `<Leader><Leader>`, <Terminal>[fzf]            fzfウィンドウを閉じる[fzfウィンドウ専用]
# Cursor jump
- `ss{key}`,          <Normal>  [vim-easymotion] `{key}`がハイライト&ジャンプ．
- `Ctrl+d`,           <Normal>  [vim-gitgutter]  次のハンクに移動
- `Ctrl+f`,           <Normal>  [vim-gitgutter]  前のハンクに移動
- `:Gdiff`,           <Normal>  [vim-fugitive]   git diff
- `:Vista`,           <Normal>  [vista.vim]      タグペインを起動
# Edit
- `sa{op}{sign}`,     <Normal>  [vim-sandwich]   {op} の対象を {sign} で囲む
- `sd{op}{sign}`,     <Normal>  [vim-sandwich]   {sign} で囲まれた {op} の対象を削除
- `sr{sign1}{sign2}`, <Normal>  [vim-sandwich]   囲み文字{sign1} を{sign2} に置換
- `ga{sign}`,         <Visual>  [vim-easy-align] Visualモードの選択範囲を{sign}で揃える
- `gcc`,              <Normal>  [Normal]         行のコメント化/コメント解除
- `Ctrl+s`,           <Normal>  [vim-over]       置換の起動
- `sub`,              <Normal>  [vim-over]       カーソル上のテキストオブジェクトを置換
- `<Leader>i`,        <Normal>  [deol]           仮想ターミナル起動
- `<ESC>`,            <Terminal>[deol]           deolウィンドウを閉じる
- `<Leader><Space>`,  <Terminal>[deol]           deolウィンドウを閉じる
- `Ctrl+e`,           <Normal>  [neoterm]        カーソル行のコードを評価
- `Ctrl+e`,           <Visual>  [neoterm]        選択範囲のコードを評価
- `<ESC>`,            <Terminal>[neoterm]        neotermウィンドウを閉じる
# Marks (Vim standard function)
- `m[a-z]`            <Normal>                   カーソル位置をmark(カレントバッファ専用)
- `m[A-Z]`            <Normal>                   カーソル位置をmark(別ファイルへのジャンプ可能)
- `Ctrl+o`            <Normal>                   前のカーソル位置へ移動
- `Ctrl+i`            <Normal>                   次のカーソル位置へ移動
- `g;`                <Normal>                   直前の編集位置へ移動
- `dm[a-zA-Z]`        <Normal>                   マークを削除
- `:delmarks!`        <Normal>                   マークを一括削除
# Defx (Filer)
- `Ctrl+n`,           <Normal>  [defx]           画面左側に起動
  - `<CR>`    : ペインを残したままファイルを展開
  - `o`       : ペインを削除してファイルを展開
  - `<ESC>`   : ペインを閉じる
  - `q`       : ペインを閉じる
  - `m`       : 切り取り
  - `c`       : コピー
  - `p`       : ペースト
  - `f`       : 新しいファイルの作成
  - `d`       : 新しいディレクトリの作成
  - `r`       : リネーム
  - `x`       : ファイル削除
  - `y`       : ファイルのパスをyank
  - `u`       : 一つ上のディレクトリに移動
  - `~`       : ホームディレクトリへ移動
  - `w`       : vimのワーキングディレクトリを設定
  - `a`       : 隠しファイル/ディレクトリの表示/非表示
  - `.`       : 直前の操作を実行
  - `e`       : 外部コマンドを実行
  - `<SPACE>` : 選択
  - `*`       : 全選択
  - `j`       : カーソル上移動
  - `k`       : カーソル下移動
  - `<C-g>`   : ステータスラインにフルパスを表示