
chcp 65001
@echo off
set log_file="E:\auto_sync_task.log"
echo "同步任务开始 %date% %time%" >> %log_file%
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
p4 set P4PORT=10.85.44.105:9666
echo %PERFORCE_PASSWD%|p4 login

: ============================================================
: P4 Update All
call :LogToFile "shlog P4 Update All Started"

call :LogToFile "开始同步 LT1_0_config\...#head"
p4 sync %ROOT_PATH%\LT1_0_config\...#head >> %log_file%

call :LogToFile "开始同步 LT1_ACMobileClient\...#head"
@REM echo "同步任务开始 %date% %time% sync LT1_ACMobileClient\...#head" >> %log_file%
p4 sync %ROOT_PATH%\LT1_ACMobileClient\...#head >> %log_file%

@REM call :LogToFile "开始同步 ACMobileClient\...#head"
@REM p4 sync %ROOT_PATH%\ACMobileClient\...#head >> %log_file%

@REM echo "sync LT1_0_config\...#head" >> %log_file%
@REM p4 sync %ROOT_PATH%\LT1_WinPackage\...#head

@REM echo "sync LT1_0_config\...#head" >> %log_file%
@REM p4 sync %ROOT_PATH%\WinPackage\...#head

@REM p4 sync %ROOT_PATH%\ACMobileDocument\...#head

@REM p4 sync %ROOT_PATH%\ACMTA\...#head

@REM p4 sync %ROOT_PATH%\TopxEngineBinary_git_windows_B\...#head
call :LogToFile "同步完成"
exit /b
:LogToFile
    echo "[LOG]%date% %time% %~1" >> %log_file%
    echo "[LOG]%date% %time% %~1"
exit /b 0