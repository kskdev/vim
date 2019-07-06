# About
ぼくのかんがえたさいきょうのvimかいはつかんきょーをつくる
(永遠に終わらないのでは...?)

目標:なるべくポータブルで使いやすいエディタを目指す

いつも利用している環境がどんな端末でも一瞬で整ってほしい

## Target Environment
- neovim
- vim8
- vim7 は非同期処理が公式だけでは走らない(vimprocとかがいる)ので見送り(本当は対応したい...)

基本的にneovimでのみ動作を確認している.

vim8も**大体**は使える

## How to install
1. $ git clone https://github.com/kskdev/vim
2. $ cd ./vim
3. $ sh ./install-[win-]neovim.sh
4. `nvim`を起動したらプラグインのインストールが開始

(表示が色々とおかしなことになるかもしれないが，端末を開き直せばOK)

基本的にはここで終了.

neovimがない場合の,インストール方法は以下の通り．
#### Ubuntu
```
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install -y neovim
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

vim8でdeopleteやdeniteを有効化する場合はpythonの設定周りで少し手間がかかる．

(deopleteやdeniteはpythonを利用するため)

面倒なのでneovimインストールを推奨．

因みにvim8のインストール方法(Ubuntu)は以下の通り.
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

<br>
<br>
<br>

##### 注意
deopleteなどを利用する場合，要求されるPythonのバージョンが3.6.1+だったりする.
Python3であれば何でも良い訳じゃない...?

deoplete などを使おうとする場合,python モジュールの`neovim`が必要.
(バックエンドでpython3を使っているため?)

インストールは `pip install neovim` でOK.

環境の状況は,`:checkhealth`で状況の確認が可能.(Only neovim)

その後,`:UpdateRemotePlugins`を実行してエラーを吐かなければ恐らく動く.(Only neovim)

pythonのパスを指定する必要があるため,その辺は init.vim (vimrc) にて設定する.



## Update log
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

## Memo
- 最近LSPなるものの存在が気になる.
- インサートモードからノーマルモードに遷移する時,IMEがonのままならoffにするプラグインがほしい(作りたい)
  - 想像以上にダルそう
- 意外とCtrlキーを利用するキーマップになってしまった.小指がお亡くなりになる前にキーマップを再検討(無理そう)


## Plugins

面白そうなプラグイン(現在追加したプラグイン)について簡単に触れる

- 'vim-jp/vimdoc-ja'
  - ヘルプの日本語化

- 'Shougo/dein.vim'
  - 暗黒美夢王 製のプラグインマネージャー (この他のプラグイン管理はこいつに一任)

- 'morhetz/gruvbox'
  - カラースキーマ(エディタの見た目を変更するためのプラグイン)
  - http://vimcolors.com/ この辺りで探したりすると良いかも?
  - 個人的なおすすめ : 'joshdick/onedark.vim' 'cocopon/iceberg.vim' 'morhetz/gruvbox'

- 'itchyny/lightline.vim'
  - vimのステータスバーを拡張するためのプラグイン
  - 見た目を整えるために独自で関数を定義しているため，若干わかりにくい
  - 現状,冗長な部分があると感じているが対応はまた今度

- 'maximbaz/lightline-ale'
  - ALEによるlint結果をステータスラインに表示するためのlightlineの拡張
  - lightlineとaleに依存
  - aleの表示をカスタマイズさせたかった
  - 別にプラグインでなくても良いような...?

- 'mengelbrecht/lightline-bufferline'
  - ウィンドウ上部のタブ表示の拡張
  - 自分が今どのファイル(バッファ)を開いているかがわかりやすくなる
  - 画面上部のタブ周りと下部のstatusline周りの色の設定を記述した.

- 'scrooloose/nerdtree'
  - ファイルツリーを表示したりする
  - 個人的な使い方はツリーを表示するだけ(ファイルを開いたりするのは後述のfzfで行うため)
  - 現在, Ctrl + n でof/off切り替え

- 'mbbill/undotree'
  - 変更履歴をツリー形式で表示
  - 現在, Ctrl + u でof/off切り替え

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
  - 現在, Ctrl+d, Ctrl+f でハンク移動

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

- 'thinca/vim-quickrun'
  - vimを開きながら編集中のファイルを実行 (:Quickrun)
  - 最新のvimではpopupに対応したらしい?ので私も追従して対応したい...

- 'jiangmiao/auto-pairs'
  - 括弧を自動で補完してくれる．ただし，補完の効き方が好みじゃないのでsurround.vim あたりに変えたい(併用している)

- 'tpope/vim-surround'
  - 括弧やクォーテーションなどを囲む時に大変便利なやつ
    - visual mode -> S' : 選択範囲を囲む
    - normal mode -> cs': 囲んでいる範囲を置換
    - normal mode -> ds': 囲んでいる範囲を削除

- 'junegunn/vim-easy-align'
  - ga入力後，揃えたい文字列を入力してコードの体裁を整える(綺麗に見えるから好き)
    - ビジュアルモードで選択後に行うことが多い

- 'tomtom/tcomment_vim'
  - gcc でコメント化/コメント解除

- 'nelstrom/vim-visual-star-search'
  - ヴィジュアルモードの選択範囲をアスタリスクで検索
  - もちろんノーマルモードからカーソル上の単語を検索も可能

- 'osyo-manga/vim-anzu'
  - 検索位置の表示(マッチ数なども表示)
  - ビジュアルモードで任意の範囲の検索がしたい
  - TODO nelstrom/vim-visual-star-search と併用が出来ない...

- 'modsound/gips-vim'
  - カーソルキー使用禁止+利用すると何か表示される

- 'cespare/vim-toml'
  - tomlファイルに色付けする

- 'osyo-manga/vim-precious'
  - カーソル位置のコンテキストに合わせてfiletype(ft)を切り替える．(下の'context_filetype.vim'と併用)

- 'Shougo/context_filetype.vim'
  - カーソル位置のコンテキストのftを判定

- 'osyo-manga/vim-over'
  - 置換時に置換元文字列(before)と置換先文字列(after)のプレビューを表示
  - 因みに置換の基本コマンド: %s/before/after/g[c]

- 'w0rp/ale'
  - プログラムの危ない部分やエラーが出る場所をコード上に示してくれる
  - 設定で色々な言語に対応可能(この設定ファイルではpythonのみ)
  - 割とWarningがキツくて画面が騒がしい... Errorだけでも良いのに...
  - 現在インサートモードで Ctrl+j or Ctrl+k でWarningとErrorの位置に移動する

#### オートコンプリートプラグイン

- 'roxma/vim-hug-neovim-rpc'
  - deoplete をvim8で動作させるための追加プラグイン1(neovimでは不要)

- 'roxma/nvim-yarp'
  - deoplete をvim8で動作させるための追加プラグイン1(neovimでは不要)

- 'Shougo/deoplete.nvim'
  - 補完プラグイン．単体で使うより追加の専用プラグインと組み合わせることで真価を発揮
  - これが使いたいがためにneovimを導入したと言っても過言ではない

- 'zchee/deoplete-jedi'
  - deoplete用 python補完プラグイン

- 'zchee/deoplete-docker'
  - deoplete用 dockerfile記述支援プラグイン(いうほど使っていない)

- 'ujihisa/neco-look'
  - deopleteに適応した英単語補完プラグイン (lookコマンドとその辞書の導入が必須)
  - 現在win環境は未対応(lookが無い)

- 'lervag/vimtex'
  - tex記述用支援プラグイン
  - 詳しい仕様はまだ調査中...

- 'Shougo/neosnippet.vim'
  - 定義されたスニペットを起動する
  - 'Shougo/neosnippet-snippets'や自前のスニペットファイルがあると良い
  - deoppetなるものもあるらしいがまた今度
  - 現在,deopleteの補完候補表示時に補完ポップアップの右端に`[ns]`と書いてあるやつを選び,Ctrl+k で展開

- 'Shougo/neosnippet-snippets'
  - 一般的なスニペットファイル
  - 自作テンプレートの登録とかもすると便利そうだけど,面倒だからやらない

