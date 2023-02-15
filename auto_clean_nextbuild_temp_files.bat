chcp 65001
@echo off
set log_file="E:\auto_remove_nextbuild_temp_file_task.log"
set tmp_file="E:\Temp\nextbuild\.fbuild.tmp\worker\"
call :LogToFile "清理开始 %tmp_file%" 
@REM dir %tmp_file% >> %log_file%
@REM rmdir /s /q  %tmp_file% >> %log_file%
del /s /q /f  %tmp_file% >> %log_file%
call :LogToFile "清理完成" 
exit /b
:LogToFile
    echo "[LOG]%date% %time% %~1" >> %log_file%
    echo "[LOG]%date% %time% %~1"
exit /b 0