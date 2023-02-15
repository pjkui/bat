
chcp 65001
@echo off

set /a HOURS=0
set /a MINS=0
set /p HOURS=3
set /p MINS=1
set /a HOURS_MUL=3600
set /a MINS_MUL=60
set /a RESULT=%HOURS%*3600+%MINS%*60

TIMEOUT /t %RESULT%
: ============================================================
: User Config 需要手动配置
set PERFORCE_PASSWD=Mima2101
set PERFORCE_USER=quinnpan
set PERFORCE_WORKSPACENAME=quinn01
set ROOT_PATH=e:\acm

: ============================================================
: P4 Login
p4 set P4USER=%PERFORCE_USER%
p4 set P4PASSWD=%PERFORCE_PASSWD%
p4 set P4CLIENT=%PERFORCE_WORKSPACENAME%
p4 set P4IGNORE=%PERFORCEIgnore%
p4 set P4PORT=10.85.44.40:9666
echo %PERFORCE_PASSWD%|p4 login

: ============================================================
: P4 Update All
echo "shlog P4 Update All Started"
p4 sync %ROOT_PATH%\LT1_0_config\...#head
p4 sync %ROOT_PATH%\LT1_ACMobileClient\...#head
p4 sync %ROOT_PATH%\LT1_WinPackage\...#head
p4 sync %ROOT_PATH%\WinPackage\...#head

@REM p4 sync %ROOT_PATH%\ACMobileDocument\...#head

@REM p4 sync %ROOT_PATH%\ACMTA\...#head

@REM p4 sync %ROOT_PATH%\TopxEngineBinary_git_windows_B\...#head