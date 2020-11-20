@ECHO OFF
REM --- plugin installer for GVim windows

REM �z�[���f�B���N�g���ƃJ�����g�f�B���N�g����ϐ��Ɋi�[
SET HOME_PATH=%HOMEDRIVE%%HOMEPATH%
SET CURRENT_DIR=%~dp0
ECHO %HOME_PATH%
ECHO %CURRENT_DIR%

REM �z�[���f�B���N�g����vimrc_alone �����l�[�����ăR�s�[
ECHO ----------------------------------------
ECHO "Rename Copy ::: %CURRENT_DIR%vimrc_alone   ->   %HOME_PATH%\_vimrc"
XCOPY %CURRENT_DIR%vimrc_alone %HOME_PATH%\_vimrc

ECHO ----------------------------------------
ECHO "Rename Copy ::: %CURRENT_DIR%vimrc_alone   ->   %HOME_PATH%\_gvimrc"
XCOPY %CURRENT_DIR%vimrc_alone %HOME_PATH%\_gvimrc

REM �C���X�g�[���̂��߂�GVim���N��(���ϐ��Ƀp�X���ʂ��Ă���Ɠ���)
ECHO -------------------------------------
ECHO LaunchGVim(�F�X�E�B���h�E�������オ��(���I���ŗǂ�))
gvim.exe

REM FZF�p�o�C�i��������̏ꏊ�ɃR�s�[(BIN_SRC�͓K�X�ύX���邱�ƁI)
SET BIN_SRC=%CURRENT_DIR%\bins\fzf_bin\fzf-0.23.0-windows_amd64\fzf
SET BIN_DST=%HOME_PATH%\.vim\dein\repos\github.com\junegunn\fzf\bin\fzf.exe
ECHO ----------------------------------
ECHO "Copy ::: %BIN_SRC%   ->   %BIN_DST%"
XCOPY %BIN_SRC% %BIN_DST% 

REM FZF�p(Ripgrep)�o�C�i��������̏ꏊ�ɃR�s�[(BIN_SRC�͓K�X�ύX���邱�ƁI)
SET BIN_SRC=%CURRENT_DIR%\bins\rg\ripgrep-12.1.1-x86_64-pc-windows-msvc\rg
SET BIN_DST=%HOME_PATH%\.vim\dein\repos\github.com\junegunn\fzf\bin\rg.exe
ECHO ----------------------------------
ECHO "Copy ::: %BIN_SRC%   ->   %BIN_DST%"
XCOPY %BIN_SRC% %BIN_DST% 

REM �����m�F�̂��߂ɍēxGVim���N��
ECHO -------------------------------------
ECHO Re-launchGVim(�F�X�E�B���h�E�������オ��(���I���ŗǂ�))
gvim.exe
