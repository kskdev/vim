@ECHO OFF
REM --- plugin installer for GVim windows

SET HOME_PATH=%HOMEDRIVE%%HOMEPATH%
SET CURRENT_DIR=%~dp0
ECHO %HOME_PATH%
ECHO %CURRENT_DIR%

SET TARGET_DIR=%HOME_PATH%\GVim\
ECHO %TARGET_DIR%

REM ホームに管理用ディレクトリ作成(存在すれば削除してから作り直す)
IF EXIST %TARGET_DIR% (
	ECHO "exist."
	REM RMDIR /s /q %TARGET_DIR%  REM サブディレクトリも削除(確認メッセージ非表示)
	REM MKDIR %TARGET_DIR%
) ELSE (
	ECHO "not exist."
	MKDIR %TARGET_DIR%
)

REM 管理用ディレクトリにPlugins, cheatsheetをコピー
XCOPY /e %CURRENT_DIR%Plugins %TARGET_DIR%\Plugins\
ECHO %CURRENT_DIR%Plugins
XCOPY %CURRENT_DIR%cheatsheet.md %TARGET_DIR%
ECHO %CURRENT_DIR%cheatsheet.md
XCOPY %CURRENT_DIR%vimrc %HOME_PATH%\_vimrc
ECHO %CURRENT_DIR%_vimrc
