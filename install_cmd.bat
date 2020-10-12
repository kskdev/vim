@ECHO OFF
REM --- plugin installer for GVim windows

REM ホームディレクトリとカレントディレクトリを変数に格納
SET HOME_PATH=%HOMEDRIVE%%HOMEPATH%
SET CURRENT_DIR=%~dp0
ECHO %HOME_PATH%
ECHO %CURRENT_DIR%

REM ターゲットディレクトリのパスを設定
ECHO ----------------------------------------
ECHO "Target Dir ::: %TARGET_DIR%
SET TARGET_DIR=%HOME_PATH%\GVim\

REM ターゲットディレクトリ作成
ECHO ----------------------------------------
IF EXIST %TARGET_DIR% (
    REM 存在すれば削除してから作り直す
    ECHO "Target Dir is existed."
    REM RMDIR /s /q %TARGET_DIR%  REM サブディレクトリも削除(確認メッセージ非表示)
    REM MKDIR %TARGET_DIR%
) ELSE (
    REM ターゲットディレクトリを作成
    ECHO "Target Dir is not existed."
    MKDIR %TARGET_DIR%
)

REM ターゲットディレクトリにPlugins, cheatsheetをコピー
rem ECHO ----------------------------------------
rem XCOPY /e %CURRENT_DIR%Plugins %TARGET_DIR%\Plugins\
rem ECHO %CURRENT_DIR%Plugins
rem XCOPY %CURRENT_DIR%cheatsheet.md %TARGET_DIR%
rem ECHO %CURRENT_DIR%cheatsheet.md
rem XCOPY %CURRENT_DIR%vimrc %HOME_PATH%\_vimrc
rem ECHO %CURRENT_DIR%_vimrc


REM Plugins/ をコピー
SET SRC=%CURRENT_DIR%\Plugins
SET DST=%TARGET_DIR%\Plugins\
ECHO ----------------------------------
ECHO "Copy ::: %SRC%   ->   %DST%"
XCOPY /e %SRC% %DST% 

REM cheatsheetをコピー
SET SRC=%CURRENT_DIR%\cheatsheet.md
SET DST=%TARGET_DIR%
ECHO ----------------------------------
ECHO "Copy ::: %SRC%   ->   %DST%"
XCOPY %SRC% %DST% 

REM vimrc をホームディレクトリに _vimrc, _gvimrc としてコピー
SET VIMRC_SRC=%CURRENT_DIR%\vimrc
SET VIMRC_DST1=%HOME_PATH%\_vimrc
SET VIMRC_DST2=%HOME_PATH%\_gvimrc
ECHO ----------------------------------
ECHO "Copy ::: %VIMRC_SRC%   ->   %VIMRC_DST1%"
XCOPY %VIMRC_SRC% %VIMRC_DST1% 
ECHO "Copy ::: %VIMRC_SRC%   ->   %VIMRC_DST2%"
XCOPY %VIMRC_SRC% %VIMRC_DST2% 

REM FZF用バイナリを所定の場所にコピー(BIN_SRCは適宜変更すること！)
SET BIN_SRC=%CURRENT_DIR%\bins\fzf_bin\fzf-0.23.0-windows_amd64\fzf
SET BIN_DST=%HOME_PATH%\GVim\repos\github.com\junegunn\fzf\bin\fzf.exe
ECHO ----------------------------------
ECHO "Copy ::: %BIN_SRC%   ->   %BIN_DST%"
XCOPY %BIN_SRC% %BIN_DST% 

REM FZF用(Ripgrep)バイナリを所定の場所にコピー(BIN_SRCは適宜変更すること！)
SET BIN_SRC=%CURRENT_DIR%\bins\rg\ripgrep-12.1.1-x86_64-pc-windows-msvc\rg
SET BIN_DST=%HOME_PATH%\GVim\repos\github.com\junegunn\fzf\bin\rg.exe
ECHO ----------------------------------
ECHO "Copy ::: %BIN_SRC%   ->   %BIN_DST%"
XCOPY %BIN_SRC% %BIN_DST% 

