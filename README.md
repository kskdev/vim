# About
ぼくのかんがえたさいきょうのvimかいはつかんきょーをつくる

(永遠に終わらないのでは...?)

## How to install
1. $ git clone https://github.com/kskdev/vim
2. $ cd ./vim
3. $ sh ./install-[n]vim.sh
4. [n]vimを起動したらプラグインのインストールが開始

(表示が色々とおかしなことになるかもしれないが，端末を開きなおすと直る)

基本的にはここで終了． <br>
もしvimのバージョンが8未満なら確実にエラーメッセージが飛んでくるため，以下を実行して回避<br>

vim8のインストール方法(Ubuntu)は以下の通り．
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```


## Schedule
- 2019/04/26
  - vim8 & neopcomplete ベースからneovim & deoplete ベースへ移行
  - vim7の対応はだるいからやめた
- 色んな環境で1発ｲﾝｽｺできるようにしたい( vim8のUbuntuとDockerで確認)
  - 基本的にVim8 やNeoVim向け(vim7でも動作させたい)
- ALE(Linter)とGitGutter(Diffの表示)が画面左端で競合してる問題を何とかする
  - 出来れば同時に表示したい
