# About
ぼくのかんがえたさいきょうのvimかいはつかんきょーをつくる
(永遠に終わらないのでは...?)

目標:なるべくポータブルで使いやすいエディタを目指す

いつも利用している環境がどんな端末でも一瞬で整ってほしい
(プラグインを導入する前にあれこれ操作を要求しないで環境構築したい)

## Target Environment
- **neovim**
- vim8(動かないことは無いと思うが，自分の環境では動作の確認が出来ない)

## How to install
あらかじめ，python3系 の環境は用意しておく必要があることに注意．

python3 環境が整っている場合，以下を実行することでインストール
``` bash
git clone https://github.com/kskdev/vim && cd ./vim && bash ./install.sh && nvim
```
`nvim` or `vim` を起動したらプラグインのインストールが開始．
また，表示が色々とおかしなことになるかもしれないが，端末を開き直せばOK

もしpython補完を利用するなら以下をインストールする必要がある．
- `neovim`
- `python-language-server`

インストールは `pip` や `conda` 等と使うと良い．

e.g.<br>

*pip*

``` bash
pip3 install --user neovim python-language-server
```
*anaconda(miniconda)*

``` bash
conda install -c conda-forge neovim python-language-server 
```

基本的にはここで終了.

neovimがない場合の,インストール方法は以下の通り．
#### Ubuntu
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim
```
#### Mac
```
brew install neovim
```
#### Windows
- https://github.com/neovim/neovim/releases のlatest releaseからzipをダウンロードして展開
- 展開して出てきた`Neovim`ディレクトリを`C:/Program files`に移動し,パスを通す

インストールについて詳しいことは,
https://github.com/neovim/neovim/wiki/Installing-Neovim
に記述されているので参考に
<br>
<br>

因みにvim8のインストール方法(Ubuntu)は以下の通り.
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```
<br>
<br>

## Memo
- deoplete + LSP はlanguage-server がrunning 状態に遷移してから入力を始めないと言語の補完が上手く行かない
  - neosnippet も一度 Ctrl+k などで起動させないと動かなかった
- neco-look がlook コマンドに依存し，Windows環境で使いづらい(MinGWとかいるらしい)
  - deoplete-dictionary とかで補完したい(そのために './words' とか用意した)

- LSP + asyncomplete ベースは導入が楽だった
  - deoplete みたいに python ver3.6.1+ の縛りが無いから??(要確認)
  - ただし、deopleteで利用してたneco-lookが使えなくて意外と不便になった
  - 補完のsmart case か　ignore case が無いと個人的にしんどい
  - python インタプリタが複数存在するとき、どれを見ている?

- deopleteなどを利用する場合，要求されるPythonのバージョンが3.6.1+だったりする.
  - Python3であれば何でも良い訳じゃない...?

- インサートモードからノーマルモードに遷移する時,IMEがonのままならoffにするプラグインがほしい(作りたい)
  - 想像以上にダルそう

- 意外とCtrlキーを利用するキーマップになってしまった.小指がお亡くなりになる前にキーマップを再検討(無理そう)

- ctagsとの連携をしようか検討中(tagbarというプラグインの動作が重すぎた)
  - LSP + vista.vim で対応

## Update log
- 2019/09/17(treemanage branch)
 - ブランチの役割関係無く defx を導入した
   - とんでもなく使いやすいファイラープラグイン(可能性の塊)
   - 設定周りがまだ甘いので今後調整
   - nerdtree ともお別れかもしれない...
- 2019/09/16(treemanage branch)
  - プラグイン(.toml)のファイル構成を複数に分割
    - deoplete は動作確認済み．asyncomplete は動くがエラーが発生．
  - その他プラグインの設定の追加/変更
    - 追加 : echodoc.vim (関数の引数を画面に表示)
    - 変更 : lightline の色とかその程度の小さい変更がいろいろ
- 2019/08/26(twotype branch)
  - インストール時, 補完プラグインを deopleteベース or asyncomplete ベースにするかを選択するように変更
    - 理由: 補完は deoplete の方が好み(主に曖昧検索みたいなことが出来るから)だが. 要求してくる環境や手順がちょっと面倒
      - asyncomplete はバージョン指定無しのpython3さえあれば動くため導入が楽
      - そのため, deoplete でインストールに失敗したら asyncomplete で再挑戦
    - 様々な環境で動かしたいが, deoplete の要求基準を満たさないサーバでの作業を強いられたりする.最低でも補完が欲しい人間にとって死活問題

- 2019/08/09(deolsp branch)
  - deoplete + vim-lsp で補完する方針に戻る
    - 理由 deoplete は補完テキストの途中が抜けても補完してくれる(asyncompleteでは出来なかった．知らないだけ?)
      - e.g. *foobar* を補完したい時， *fb* と打てば候補に出てくる (asyncompleteでは不可能)
      - キーボード入力すら面倒な人間にとって大変重要な要素
    - ただし たまに変な挙動する(07/29 に書いた PIL のやつ)
    - 静的解析(LSP)からのLintや定義ジャンプ， neosnippet が補完は asyncomplete, deoplete どちらでも出来る
    - vista も使える
    - language server の状態が *running* になってから入力をしないとLSP補完が効かない(要検証)
  - 'mbbill/undotree' を削除
    - 思った以上に使わなかった
  - 'vim-surround' と 'vim-repeat' の代わりに'vim-sandwich' を導入
    - 前者との違いは textobj を操作出来るようになった
    - `sa`: 追加  `sd`: 削除  `sr`:置換
    - それに伴い，'easymotion/vim-easymotion' のトリガを `s` から `ss` へ変更
  - 'junegunn/fzf' のインストールがどんな環境でもインストール出来るようにしたい
    - 一部環境でインストール出来なかった
  - 'reireias/vim-cheatsheet' を導入
    - vimコマンドのチートシートを作成中
    - `:Cheat` で起動
      - float window にも対応．しかし，利用する端末ごとに環境が違うため，float window 利用の設定を無効化
- 2019/08/01(lsp branch)
  - vista.vim の導入によるタグジャンプを実現. ctags がいらないのでつよい
    - `:Vista` で起動
  - lightline を拡張してwarningやerrorの数をstatuslineに表示
    - カーソル位置の関数名等を表示
- 2019/07/31(lsp branch)
  - deoplete + vim-lsp から asyncomplete + vim-lsp ベースへ以降
    - vim8 でも動くようになった！(全てのプラグインが動くかは未確認)
  - lightline のステータスラインにエラーの数とかが表示出来るようになればおおよそ完成
  - neco-look と smart case completion の代わりが欲しい
  - ALE を捨てても大丈夫かもしれない??
  - winでの動作は未確認
  - colorscheme をvim8 と neovim で使い分ける
  - その他軽微な調整
- 2019/07/29(lsp branch)
  - pythonプラグインを deoplete-jedi から LSP(deoplete補完) へ以降
    - MacOSで "from PIL import Image"の後，"Image."と入力したらエラーが発生
      - Linux ではエラーは発生せず
      - OSによる問題では無いと考えられるが原因が不明
    - deoplete-jedi を使うか使用感がまだ何とも言えないため、deoplete-jediの方をコメントアウトしてある
  - 複数のインストーラファイルをinstall.shに統合(別にシンボリックリンクとか貼って置けば良い話だが...)
  - visual-star-search と vim-anzu の問題が解消
  - vim-repeat を追加
- 2019/07/09
  -  ripgrepによる文字列検索に対応(in fzf)
    - ripgrep:Rust製の高速grepツール(fuckin fast)
    - windowsでまだ上手く動いていない
    - コマンドラインから利用するなら sudo apt-get install ripgrep の方が良い
      - apt経由で入れないのはvimでしか使わないため
      - 何より余計なインストールの手間を省くことが目標
    - Rustを導入しなくても使えるようにバイナリを拾ってきた
      - Rustの導入は難しくないが依存関係が発生するのが嫌い

- 2019/07/07
  - 検索周りのプラグインの更新
  - ctagは導入したいけど外部ツールが必要で面倒
- 2019/07/02
  - ハイライト機能周りを追加(少しだけ)
- 2019/06/16
  - windows環境でもだいたい動作するように編集
    - win, mac, linux で動くようになったはず
    - fzfはwinだとビルドされなかったのでバイナリを取得する強引な方法で解決
    - win にはlookコマンドが無いのでdeopleteによる英単語補完に非対応(知らないだけ?)
      - 2019/06/28 追記:一応MinGWを経由で利用出来るが,面倒なので対応しないことにした.
        (外部ツールになるべく依存しない環境を作りたい(pythonとfzfは利便性を考慮して仕方なく...))
  - neovim(MBP, windows10)にて動作確認.
  - その他，fugitive.vimの導入など微調整
  - lazyロードの問題を早く対応すること.
  - deinのstate_save() とload_state()が微妙に機能してない(使わないことにした)
    - 利用すると,deoplete周りが動かなくなる...
- 2019/06/07
  - ctrlpからfzfへ以降(検索速度が速いから)
  - statuslineのプラグインをairlineからlightlineへ以降
    - statuslineにALEの警告とエラーが表示されなかった問題を修正
  - neovim(MBP)にて動作確認. vim8(MBP)でも動作を確認
- 2019/04/30
  - 手元のMBPでvim8.1 及び neovim で動作を確認．
  - ALEなどを追加 & 補完プラグインが上手く動作しないときがあった問題を修正
  - lazy に読みたいプラグインがあるが，指定すると働かなくなってしまうので修正はまた今度
- 2019/04/26
  - vim8 & neopcomplete ベースからneovim & deoplete ベースへ移行
  - vim7の対応はだるいからやめた
- ALE(Linter)とGitGutter(Diffの表示)が画面左端で競合してる問題を何とかする
  - 出来れば同時に表示したい

## Plugins

面白そうなプラグインについて簡単に触れる<br>
若干グダグダになってきた...

- 'vim-jp/vimdoc-ja'
  - ヘルプの日本語化

- 'Shougo/dein.vim'
  - 暗黒美夢王 製のプラグインマネージャー (この他のプラグイン管理はこいつに一任)

- 'morhetz/gruvbox'
  - カラースキーマ(エディタの見た目を変更するためのプラグイン)
  - http://vimcolors.com/ この辺りで探したりすると良いかも?
  - 個人的なおすすめ
    - 'joshdick/onedark.vim'
    - 'cocopon/iceberg.vim'
    - 'morhetz/gruvbox'

- 'itchyny/lightline.vim'
  - vimのステータスバーを拡張するためのプラグイン
  - 現状,冗長な部分があると感じているが対応はまた今度

- 'maximbaz/lightline-ale'
  - ALEによるlint結果をステータスラインに表示するためのlightlineの拡張
  - lightlineとaleに依存
  - aleの表示をカスタマイズさせたかった
  - 別にプラグインでなくても良いような...?
  - ale から vim-lsp に乗り換えたため，現在は使っていない

- 'mengelbrecht/lightline-bufferline'
  - ウィンドウ上部のタブ表示の拡張
  - 自分が今どのファイル(バッファ)を開いているかがわかりやすくなる
  - 画面上部のタブ周りと下部のstatusline周りの色の設定を記述した.
  - TODO バッファ番号が連続しない理由は以下のURLを参考に
    - " https://stackoverflow.com/questions/28394713/vim-what-happened-to-buffer-2

- 'scrooloose/nerdtree'
  - ファイルツリーを表示したりする
  - 個人的な使い方はツリーを表示するだけ(ファイルを開いたりするのは後述のfzfで行うため)
  - 現在, [ Ctrl + n ] でof/off切り替え

- 'mbbill/undotree'
  - 変更履歴をツリー形式で表示
  - 現在, [ Ctrl + u ] でof/off切り替え
  - 便利だったが，意外と使わなかったため，削除した

- 'machakann/vim-highlightedyank'
  - ヤンク(コピー)領域をハイライト表示する
    - どこがコピーされたかを可視化するのはNoobieに必須

- 'nathanaelkane/vim-indent-guides'
  - インデントを可視化する

- 'rhysd/accelerated-jk'
  - j,k キーによるカーソル移動の高速化(キーマップを置き換えているだけ)
  - たのしい(重要)

- 'rhysd/clever-f.vim'
  - [ f , F ] キージャンプの拡張
  - [ ; , # ] を使わずに[ f , F ]で移動する
  - 移動先をハイライト表示
  - 行間移動も可能

- 'easymotion/vim-easymotion'
  - sキー入力後，続けて文字を打つ(2文字 or 1文字+Enter)とジャンプ先の候補が表示され,その文字を入力するばカーソルがジャンプする
  - ジャンプできる範囲は現在が画面に表示されている領域のみ

- 'airblade/vim-gitgutter'
  - gitで管理されているファイルについて編集箇所を可視化
  - TODO : 画面左端に表示しているが,ALEと競合している... いつか頑張って直す
  - https://github.com/w0rp/ale/issues/569
  - 現在, [ Ctrl + d ], [ Ctrl + f ] でハンク移動

- 'tpope/vim-fugitive'
  - vim上でgit操作を行うことが可能
  - :Gdiff によるdiffがお気に入り
  - :Gblame もなかなか
  - lightlineと連携

- 'junegunn/fzf'
  - ファイル検索ツール
  - 同等の機能を有した ctrlp より高速だったためこちらを採用
    - fzf: GO-lang製, ctrlp: Pure vim script
  - vim用のプラグインは 'junegunn/fzf.vim' として提供
  - このプラグインはビルド用
    - ビルドと言いつつwinでやるのは面倒だったからwin環境だけfzf.exeをwgetしてしまった...
  -  ripgrepによる文字列検索に対応 (すごいつよい)
    - ripgrep:Rust製の高速grepツール
    - コマンドラインから利用するなら sudo apt-get install ripgrep の方が良い
      - apt経由で入れないのはvimでしか使わないため
      - 何より余計なインストールの手間を省くことが目標
    - Rustを導入しなくても使えるようにバイナリを拾ってきた
      - Rustの導入は難しくないが依存関係が発生するのが嫌い
    - 中々マヌケなのでもっとスマートな方法で入れたい
  - 現在の設定
    - [ Ctrl + t ] : 展開中のバッファ一覧を表示
    - [ Ctrl + p ] : カレントディレクトリ以下を検索
    - [ Ctrl + h ] : 最近展開したファイルを表示
    - [ Ctrl + g ] : ripgrep を利用した文字列検索

- 'thinca/vim-quickrun'
  - vimを開きながら編集中のファイルを実行 (:Quickrun)
  - 最新のvimではpopupに対応したらしい?ので私も追従して対応したい...

- 'jiangmiao/auto-pairs'
  - 括弧を自動で補完してくれる．ただし，補完の効き方が好みじゃないのでsurround.vim あたりに変えたい(併用している)

- 'tpope/vim-surround'
  - 括弧やクォーテーションなどを囲む時に大変便利なやつ
    - visual mode -> S' : 選択範囲を' 'で囲む
    - normal mode -> cs': 囲み記号を置換
    - normal mode -> ds': 囲み記号を削除
  - 現在は使っていない

- 'tpope/vim-repeat'
  - vim-surround 等の処理をドットコマンドで繰り返し処理が可能
  - 現在は使っていない

- 'machakann/vim-sandwich'
  - 記号ペアで範囲を囲んだり置換や削除を行う
  - 'tpope/vim-surround', 'tpope/vim-repeat' の機能を兼ね備えたプラグイン
    - このプラグイン1つで代用可能
    - 個人的にこのプラグインの方が直感的にわかりやすい

- 'junegunn/vim-easy-align'
  - ga入力後，揃えたい文字列を入力してコードの体裁を整える(綺麗に見えるから好き)
    - ビジュアルモードで選択後に行うことが多い

- 'tomtom/tcomment_vim'
  - gcc でコメント化/コメント解除
    - ビジュアルモードで選択中の範囲も適用可能

- 'nelstrom/vim-visual-star-search'
  - ヴィジュアルモードの選択範囲をアスタリスクで検索
  - もちろんノーマルモードからカーソル上のテキストオブジェクトを検索可能

- 'osyo-manga/vim-anzu'
  - 検索位置の表示(マッチ数なども表示)

- 'modsound/gips-vim'
  - カーソルキー使用禁止+利用すると何か表示される
  - 矢印キー絶対許さないマンによる厳しい指導

- 'cespare/vim-toml'
  - tomlファイルに色付けする

- 'osyo-manga/vim-precious'
  - カーソル位置のコンテキストに合わせてfiletype(ft)を切り替える．(下の'context_filetype.vim'と併用)

- 'Shougo/context_filetype.vim'
  - カーソル位置のコンテキストのftを判定

- 'osyo-manga/vim-over'
  - 置換時に置換元文字列(before)と置換先文字列(after)のプレビューを表示
  - 因みに置換の基本コマンド: %s/before/after/g[c]

- 'reireias/vim-cheatsheet'
  - 作成したファイルを `:Cheat` で呼び出し，チートシート確認出来る
  - ファイルタイプごとの作成も可能
  - float window にも対応．(使っていないが)

- 'w0rp/ale'
  - プログラムの危ない部分やエラーが出る場所をコード上に示してくれる
  - 設定で色々な言語に対応可能(この設定ファイルではpythonのみ)
    - 外部のリンターを利用するためリンターの指定は必要
  - 割とWarningがキツくて画面が騒がしい... Errorだけでも良いのに...
  - 現在 'prabirshrestha/vim-lsp' と 'liuchengxu/vista.vim' を利用しているため，使っていない

- 'liuchengxu/vista.vim' 
  - タグジャンプ等や定義元へジャンプすることが出来るようになる
    - vim-lsp の力を借りて実行
    - fzf と連携し，定義やシンボルの検索も可能


#### 現在利用中のオートコンプリートプラグイン(deoplete + vim-lsp)

- 'Shougo/deoplete.nvim'
  - 補完プラグイン．単体で使うより追加の専用プラグインと組み合わせることで真価を発揮
  - これが使いたいがためにneovimを導入したと言っても過言ではない
  - 変数や関数,スニペット呼び出し,パス補完 etc... の補完が出来る

- 'roxma/vim-hug-neovim-rpc'
  - deoplete をvim8で動作させるための追加プラグイン1(neovimでは不要)

- 'roxma/nvim-yarp'
  - deoplete をvim8で動作させるための追加プラグイン1(neovimでは不要)

- 'zchee/deoplete-jedi'
  - deoplete用 python補完プラグイン

- 'zchee/deoplete-docker'
  - deoplete用 dockerfile記述支援プラグイン(いうほど使っていない)

- 'ujihisa/neco-look'
  - deopleteに適応した英単語補完プラグイン (lookコマンドとその辞書の導入が必須)
  - 現在win環境は未対応(look コマンドが無い)

- 'lervag/vimtex'
  - tex記述用支援プラグイン
  - 詳しい仕様はまだ調査中...

- 'Shougo/neosnippet.vim'
  - 定義されたスニペットを起動する
  - 'Shougo/neosnippet-snippets'や自前のスニペットファイルがあると良い
  - deoppetなるものもあるらしいがまた今度
  - 現在,deopleteの補完候補表示時に補完ポップアップの右端に`[ns]`と書いてあるやつを選び,[ Ctrl + k ] で展開

- 'Shougo/neosnippet-snippets'
  - 一般的なスニペットファイル
  - 自作テンプレートの登録とかもすると便利そうだけど,面倒だからやらない

- 'prabirshrestha/vim-lsp'
  - vimで Language Server Protocol を利用するためのプラグイン
  - 現在,pythonで動作を確認(deoplete-jediと使用感を比較する必要があるかも)
    - `pip install python-Language-server` が必要
   - 定義ジャンプとか色々出来る

- 'prabirshrestha/async.vim'
  - LSP を非同期で動かすためのプラグイン?(よく分かっていない...)
  - 'prabirshrestha/vim-lsp' に必要らしい(とりあえず入れている感がすごい)
  - 詳しく調べておりません

- 'lighttiger2505/deoplete-vim-lsp'
  - deoplete でLSPを利用するためのプラグイン
   - 'prabirshrestha/vim-lsp', 'prabirshrestha/async.vim' を利用した
  - 詳しく調べておりません

- 'thomasfaingnaert/vim-lsp-snippets'
  - vim-lsp でスニペット補完を利用するためのプラグイン
  - 詳しく調べておりません

repo = 'thomasfaingnaert/vim-lsp-neosnippet'
  - vim-lsp で neosnippet を利用するためのプラグイン
  - 詳しく調べておりません

#### オートコンプリートプラグイン(asyncomplete + vim-lsp)

- 'prabirshrestha/asyncomplete.vim'
  - 非同期で補完を行うためのプラグイン(deoplete.nvimみたいなもの)
  プラグイン単体では威力を発揮しない.複数のsourceを利用することで真価を発揮

- 'prabirshrestha/vim-lsp'
  - vimで Language Server Protocol を利用するためのプラグイン
  - 現在,pythonで動作を確認(deoplete-jediと使用感を比較する必要があるかも)
    - `pip install python-Language-server` が必要
  - 恐らく他の言語にも容易に対応できると思う
    - 強い
  - 競合相手は 'coc.nvim' ?

- 'prabirshrestha/async.vim'
  - LSP を非同期で動かすためのプラグイン(よく分かっていない...)
  - 'prabirshrestha/vim-lsp' に必要らしい(とりあえず入れている感がすごい)

- 'prabirshrestha/asyncomplete-lsp.vim'
  - asyncomplete.vim のLSP補完拡張

- 'prabirshrestha/asyncomplete-buffer.vim'
  - asyncomplete.vim のバッファ補完拡張

- 'prabirshrestha/asyncomplete-file.vim'
  - asyncomplete.vim のファイル補完拡張

- 'prabirshrestha/asyncomplete-necovim.vim'
  - asyncomplete.vim のvim script補完拡張

- 'prabirshrestha/asyncomplete-neosnippet.vim'
  - asyncomplete.vim のNeosnippet補完拡張

