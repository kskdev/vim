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

## Schedule
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
- 'joshdick/onedark.vim'
  - カラースキーマ(エディタの見た目を変更するためのプラグイン
- 'vim-airline/vim-airline-themes'
  - vimのステータスバーの見た目を変更するためのプラグイン
- 'vim-airline/vim-airline'
  - vimのステータスバーを拡張するためのプラグイン
- 'nathanaelkane/vim-indent-guides'
  - インデントを可視化する
- 'rhysd/accelerated-jk'
  - j,k キーによるカーソル移動の高速化(キーマップを置き換えているだけ)
- 'easymotion/vim-easymotion'
  - sキー入力後，続けて文字を打つと特定の文字へカーソルがジャンプする
- 'airblade/vim-gitgutter'
  - gitで管理されているファイルについて編集箇所を可視化
- 'ctrlpvim/ctrlp.vim'
  - Ctrl+p でファイル検索を行う．
    - ファイルサイズが数万超えてくると重たいから別のプラグインへ移行 or 設定を見直したい
- 'thinca/vim-quickrun'
  - vimを開きながら編集中のファイルを実行 (:Quickrun)
- 'Townk/vim-autoclose'
  - 括弧を自動で補完してくれる．ただし，補完の効き方が好みじゃないのでsurround.vim あたりに変えたい
- 'junegunn/vim-easy-align'
  - ga入力後，揃えたい文字列を入力してコードの体裁を整える(綺麗に見えるから好き)
    - ビジュアルモードで選択後に行うことが多い
- 'tomtom/tcomment_vim'
  - gcc でコメント化/コメント解除
- 'nelstrom/vim-visual-star-search'
  - \* キー単語 or 範囲検索
- 'modsound/gips-vim'
  - カーソルキー使用禁止+何か表示される
- 'cespare/vim-toml'
  - tomlファイルに色付けする
- 'osyo-manga/vim-precious'
  - カーソル位置のコンテキストに合わせてftを切り替える．(下の'context_filetype.vim'と併用)
- 'Shougo/context_filetype.vim'
  - カーソル位置のコンテキストのftを判定
- 'w0rp/ale'
  - プログラムの危ない部分やエラーが出る場所をコード上に示してくれる

#### オートコンプリートプラグイン

- 'roxma/vim-hug-neovim-rpc'
  - deoplete をvim8で動作させるための追加プラグイン1(neovimでは不要)
- 'roxma/nvim-yarp'
  - deoplete をvim8で動作させるための追加プラグイン1(neovimでは不要)

- 'Shougo/deoplete.nvim'
  - 補完プラグイン．単体で使うより追加の専用プラグインと組み合わせることで真価を発揮
- 'zchee/deoplete-jedi'
  - deoplete用 python補完プラグイン
- 'zchee/deoplete-docker'
  - deoplete用 dockerfile記述支援プラグイン
- 'ujihisa/neco-look'
  - deopleteに適応した英単語補完プラグイン (lookコマンドとその辞書の導入が必須)
- 'Shougo/neosnippet.vim'
  - 定義されたスニペットを起動する
- 'Shougo/neosnippet-snippets'
  - 一般的なスニペットファイル
