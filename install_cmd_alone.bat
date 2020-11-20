@ECHO OFF
REM --- plugin installer for GVim windows

REM ホームディレクトリとカレントディレクトリを変数に格納
SET HOME_PATH=%HOMEDRIVE%%HOMEPATH%
SET CURRENT_DIR=%~dp0
ECHO %HOME_PATH%
ECHO %CURRENT_DIR%

REM ホームディレクトリにvimrc_alone をリネームしてコピー
ECHO ----------------------------------------
ECHO "Rename Copy ::: %CURRENT_DIR%vimrc_alone   ->   %HOME_PATH%\_vimrc"
XCOPY %CURRENT_DIR%vimrc_alone %HOME_PATH%\_vimrc

ECHO ----------------------------------------
ECHO "Rename Copy ::: %CURRENT_DIR%vimrc_alone   ->   %HOME_PATH%\_gvimrc"
XCOPY %CURRENT_DIR%vimrc_alone %HOME_PATH%\_gvimrc

REM インストールのためにGVimを起動(環境変数にパスが通っていると動く)
ECHO -------------------------------------
ECHO LaunchGVim(色々ウィンドウが立ち上がる(即終了で良い))
gvim.exe

REM FZF用バイナリを所定の場所にコピー(BIN_SRCは適宜変更すること！)
SET BIN_SRC=%CURRENT_DIR%\bins\fzf_bin\fzf-0.23.0-windows_amd64\fzf
SET BIN_DST=%HOME_PATH%\.vim\dein\repos\github.com\junegunn\fzf\bin\fzf.exe
ECHO ----------------------------------
ECHO "Copy ::: %BIN_SRC%   ->   %BIN_DST%"
XCOPY %BIN_SRC% %BIN_DST% 

REM FZF用(Ripgrep)バイナリを所定の場所にコピー(BIN_SRCは適宜変更すること！)
SET BIN_SRC=%CURRENT_DIR%\bins\rg\ripgrep-12.1.1-x86_64-pc-windows-msvc\rg
SET BIN_DST=%HOME_PATH%\.vim\dein\repos\github.com\junegunn\fzf\bin\rg.exe
ECHO ----------------------------------
ECHO "Copy ::: %BIN_SRC%   ->   %BIN_DST%"
XCOPY %BIN_SRC% %BIN_DST% 

REM 挙動確認のために再度GVimを起動
ECHO -------------------------------------
ECHO Re-launchGVim(色々ウィンドウが立ち上がる(即終了で良い))
gvim.exe
