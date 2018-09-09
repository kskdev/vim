# About
ぼくのかんがえたさいきょうのvimかいはつかんきょーをつくる

(永遠に終わらないのでは...?)

## How to install
1. $ git clone https://github.com/kskdev/vim
2. $ cd ./vim
3. $ sh ./install.sh
4. vimを起動したらプラグインのインストールが開始

(表示が色々とおかしなことになるかもしれないが，端末を開きなおすと直る)

基本的にはここで終了． <br>
もしvimのバージョンが8未満なら確実にエラーメッセージが飛んでくるため，以下を実行して回避<br>
1. ``` cd ~/.cache/dein/repos/github.com/Shougo/dein.vim  ``` <br>
2. ``` git checkout 1.5 ``` <br>
を実行するとvim7とかでもインストール出来るかもしれない.(1.5 は公式のREADMEに書いてあった) <br>
vim8なら関係ない話(vim8でエラーが出たら別の問題だと思われる．)


## Memo
- dein.vim + toml でプラグイン管理をできるようになった
- ctrlp(Ctrl + p) がすごくいい(Nerdtree要らんかも)

## Schedule
- Python の開発環境を最強にしたい 
  - 現在 neocomplete + jedi-vim で構成 何かいいもの無いかな？
  - neocomplete ベースの補完をメインにすること
  - あいまい補完が効いていない？
- 色んな環境で1発ｲﾝｽｺできるようにしたい( vim8のUbuntuとDockerで確認)
  - 基本的にVim8 やNeoVim向け(vim7でも動作させたい)
- ファイル補完もsublime的な動作をして欲しい(neocompleteが機能してない？<C-x><C-f>が面倒)
  - たぶんできるようになったはず...
- ALE(Linter)とGitGutter(Diffの表示)が画面左端で競合してる問題を何とかする
  - 出来れば同時に表示したい
- neoSnippetが機能していないような...?
- 動かし方が分からない！みたいなことが無いように最低限のコマンドくらいは示した方がいい(一部独自キーマッピングがあるため)
