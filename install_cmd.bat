@ECHO OFF
REM --- plugin installer for GVim windows

REM �z�[���f�B���N�g���ƃJ�����g�f�B���N�g����ϐ��Ɋi�[
SET HOME_PATH=%HOMEDRIVE%%HOMEPATH%
SET CURRENT_DIR=%~dp0
ECHO %HOME_PATH%
ECHO %CURRENT_DIR%

REM �^�[�Q�b�g�f�B���N�g���̃p�X��ݒ�
ECHO ----------------------------------------
ECHO "Target Dir ::: %TARGET_DIR%
SET TARGET_DIR=%HOME_PATH%\GVim\

REM �^�[�Q�b�g�f�B���N�g���쐬
ECHO ----------------------------------------
IF EXIST %TARGET_DIR% (
    REM ���݂���΍폜���Ă����蒼��
    ECHO "Target Dir is existed."
    REM RMDIR /s /q %TARGET_DIR%  REM �T�u�f�B���N�g�����폜(�m�F���b�Z�[�W��\��)
    REM MKDIR %TARGET_DIR%
) ELSE (
    REM �^�[�Q�b�g�f�B���N�g�����쐬
    ECHO "Target Dir is not existed."
    MKDIR %TARGET_DIR%
)

REM �^�[�Q�b�g�f�B���N�g����Plugins, cheatsheet���R�s�[
rem ECHO ----------------------------------------
rem XCOPY /e %CURRENT_DIR%Plugins %TARGET_DIR%\Plugins\
rem ECHO %CURRENT_DIR%Plugins
rem XCOPY %CURRENT_DIR%cheatsheet.md %TARGET_DIR%
rem ECHO %CURRENT_DIR%cheatsheet.md
rem XCOPY %CURRENT_DIR%vimrc %HOME_PATH%\_vimrc
rem ECHO %CURRENT_DIR%_vimrc


REM Plugins/ ���R�s�[
SET SRC=%CURRENT_DIR%Plugins
SET DST=%TARGET_DIR%Plugins\
ECHO ----------------------------------
ECHO "Copy ::: %SRC%   ->   %DST%"
XCOPY /e %SRC% %DST% 

REM cheatsheet���R�s�[
SET SRC=%CURRENT_DIR%cheatsheet.md
SET DST=%TARGET_DIR%
ECHO ----------------------------------
ECHO "Copy ::: %SRC%   ->   %DST%"
XCOPY %SRC% %DST% 

REM vimrc ���z�[���f�B���N�g���� _vimrc, _gvimrc �Ƃ��ăR�s�[
SET VIMRC_SRC=%CURRENT_DIR%vimrc
SET VIMRC_DST1=%HOME_PATH%\_vimrc
SET VIMRC_DST2=%HOME_PATH%\_gvimrc
ECHO ----------------------------------
ECHO "Copy ::: %VIMRC_SRC%   ->   %VIMRC_DST1%"
XCOPY %VIMRC_SRC% %VIMRC_DST1% 
ECHO "Copy ::: %VIMRC_SRC%   ->   %VIMRC_DST2%"
XCOPY %VIMRC_SRC% %VIMRC_DST2% 

REM FZF�p�o�C�i��������̏ꏊ�ɃR�s�[(BIN_SRC�͓K�X�ύX���邱�ƁI)
SET BIN_SRC=%CURRENT_DIR%bins\fzf_bin\fzf-0.23.0-windows_amd64\fzf
SET BIN_DST=%HOME_PATH%\GVim\repos\github.com\junegunn\fzf\bin\fzf.exe
ECHO ----------------------------------
ECHO "Copy ::: %BIN_SRC%   ->   %BIN_DST%"
XCOPY %BIN_SRC% %BIN_DST% 

REM FZF�p(Ripgrep)�o�C�i��������̏ꏊ�ɃR�s�[(BIN_SRC�͓K�X�ύX���邱�ƁI)
SET BIN_SRC=%CURRENT_DIR%bins\rg\ripgrep-12.1.1-x86_64-pc-windows-msvc\rg
SET BIN_DST=%HOME_PATH%\GVim\repos\github.com\junegunn\fzf\bin\rg.exe
ECHO ----------------------------------
ECHO "Copy ::: %BIN_SRC%   ->   %BIN_DST%"
XCOPY %BIN_SRC% %BIN_DST% 

