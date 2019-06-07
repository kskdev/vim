# About
ぼくのかんがえたさいきょうのvimかいはつかんきょーをつくる

(永遠に終わらないのでは...?)

## Target Environment

- Vim 8 over
- neovim

## How to install
1. $ git clone https://github.com/kskdev/vim
2. $ cd ./vim
3. $ sh ./install-[neo]vim.sh
4. [n]vimを起動したらプラグインのインストールが開始

(表示が色々とおかしなことになるかもしれないが，端末を開き直せばOK)

基本的にはここで終了． <br>
もしvimのバージョンが8未満なら確実にエラーメッセージが飛んでくるため，以下を実行して回避<br>

vim8のインストール方法(Ubuntu)は以下の通り．
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

vim8でdeopleteを有効化する場合はpythonの設定周りで少し手間がかかる．

面倒な場合はneovimインストールを推奨．
neovimのインストール方法(Ubuntu)は以下の通り．
pip install はdeopleteなどを利用する場合，必須のプラグイン.
```
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install -y neovim
pip install neovim
```

## Schedule
- 2019/06/07
  - ctrlpからfzfへ以降
  - statuslineのプラグインをairlineからlightlineへ以降
  - neovim(MBP)にて動作確認
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

面白そうなプラグインについて簡単に触れる

- 'Shougo/dein.vim'
  - 暗黒美夢王 製のプラグインマネージャー (この他のプラグイン管理はこいつに一任)

- 'morhetz/gruvbox'
  - カラースキーマ(エディタの見た目を変更するためのプラグイン
  - http://vimcolors.com/ この辺りで探したりすると良いかも?
  - 個人的なおすすめ : 'joshdick/onedark.vim' 'cocopon/iceberg.vim' 'morhetz/gruvbox'

- 'itchyny/lightline.vim'
  - vimのステータスバーを拡張するためのプラグイン
  - 見た目を整えるために独自で関数を定義しているため，若干わかりにくい
  - 現状,冗長な部分があると感じているが対応はまた今度

- 'maximbaz/lightline-ale'
  - ALEによるlint結果をステータスラインに表示するためのlightlineの拡張
  - lightlineとaleに依存
  - aleの表示をスッキリさせたかった

- 'mengelbrecht/lightline-bufferline'
  - ウィンドウ上部のタブ表示の拡張
  - 自分が今どのファイル(バッファ)を開いているかがわかりやすくなる

- 'scrooloose/nerdtree'
  - ファイルツリーを表示したりする
  - 個人的な使い方はツリーを表示するだけ(ファイルを開いたりするのは後述のfzfで行うため)

- 'nathanaelkane/vim-indent-guides'
  - インデントを可視化する

- 'rhysd/accelerated-jk'
  - j,k キーによるカーソル移動の高速化(キーマップを置き換えているだけ)
  - たのしい(重要)

- 'easymotion/vim-easymotion'
  - sキー入力後，続けて文字を打つと特定の文字へカーソルがジャンプする
  - ジャンプできる範囲は現在が画面に表示されている領域のみ

- 'airblade/vim-gitgutter'
  - gitで管理されているファイルについて編集箇所を可視化
  - TODO : 画面左端に表示しているが,ALEと競合している... いつか頑張って直す

- 'junegunn/fzf'
  - ファイル検索
  - 同等の機能を有した ctrlp より高速だったためこちらを採用
  - このプラグインはビルド用? 本体機能は 'junegunn/fzf.vim' なのか? 

- 'thinca/vim-quickrun'
  - vimを開きながら編集中のファイルを実行 (:Quickrun)
  - 最新のvimではpopupに対応したらしいので私も追従して対応したい...

- 'jiangmiao/auto-pairs'
  - 括弧を自動で補完してくれる．ただし，補完の効き方が好みじゃないのでsurround.vim あたりに変えたい

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

#### オートコンプリートプラグイン

- 'roxma/vim-hug-neovim-rpc'
  - deoplete をvim8で動作させるための追加プラグイン1(neovimでは不要)

- 'roxma/nvim-yarp'
  - deoplete をvim8で動作させるための追加プラグイン1(neovimでは不要)

- 'Shougo/deoplete.nvim'
  - 補完プラグイン．単体で使うより追加の専用プラグインと組み合わせることで真価を発揮
  - 控えめに言って「神プラグイン」

- 'zchee/deoplete-jedi'
  - deoplete用 python補完プラグイン

- 'zchee/deoplete-docker'
  - deoplete用 dockerfile記述支援プラグイン

- 'ujihisa/neco-look'
  - deopleteに適応した英単語補完プラグイン (lookコマンドとその辞書の導入が必須)

- 'Shougo/neosnippet.vim'
  - 定義されたスニペットを起動する
  - 'Shougo/neosnippet-snippets'や自前のスニペットファイルがあると良い

- 'Shougo/neosnippet-snippets'
  - 一般的なスニペットファイル

