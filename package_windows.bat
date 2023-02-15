@echo off

set CLIENT_PATH=E:\acm\ACMobileClient
echo %CLIENT_PATH%
set CLIENT_CODE_PATH=E:\acm\ACMobileClientSrc
echo %CLIENT_CODE_PATH%

rd %CLIENT_PATH%\Source
mklink /D %CLIENT_PATH%\Source %CLIENT_CODE_PATH%\Source
rem xcopy /e/y/i/f %CLIENT_CODE_PATH%\Source %CLIENT_PATH%\Source

echo " ================================== copy over =================================="

set SAVE_DIR=%CLIENT_PATH%\Saved
echo %SAVE_DIR%

set P4_DIR=E:\acm\TOPXACProj\ACMEngine
echo %P4_DIR%

SET RUN_UAT=%P4_DIR%\Engine\Build\BatchFiles\RunUAT.bat
echo %RUN_UAT%"

SET OUTPUT_DIR=%CLIENT_PATH%\..\WinPackage
echo %OUTPUT_DIR%

@REM set WINDOWS_OPEN=%CLIENT_PATH%\windows_open
@REM echo %WINDOWS_OPEN%

rd /s /q %OUTPUT_DIR%
md %OUTPUT_DIR%
@REM md %OUTPUT_DIR%\WindowsNoEditor
@REM copy %WINDOWS_OPEN%\* %OUTPUT_DIR%\WindowsNoEditor 

@REM rd /s /q %SAVE_DIR%


cd %CLIENT_PATH%

echo %RUN_UAT% BuildCookRun -project="%CLIENT_PATH%\ACMobileClient.uproject" -noP4 -platform=Win64 -clientconfig=Development -serverconfig=Development -cook -allmaps -build -stage -pak -archive -archivedirectory="%OUTPUT_DIR%" -nocompileeditor -targetplatform=Win64 -unversionedcookedcontent -distribution -compressed -package -cmdline=" -Messaging"  -compile 
%RUN_UAT% BuildCookRun -project="%CLIENT_PATH%\ACMobileClient.uproject" -noP4 -platform=Win64 -clientconfig=Development -serverconfig=Development -cook -allmaps -build -stage -pak -archive -archivedirectory="%OUTPUT_DIR%" -nocompileeditor -targetplatform=Win64 -unversionedcookedcontent -distribution -compressed -package -cmdline=" -Messaging"  -compile 
echo %errorlevel%
pause

:failed
echo "gen sln error"
exit /b 1