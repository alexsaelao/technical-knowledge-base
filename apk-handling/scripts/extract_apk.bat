@echo off
setlocal enabledelayedexpansion

:: Check if a keyword is passed as an argument
if "%~1"=="" (
    echo No search keyword passed. Listing all packages...
    adb shell pm list packages
) else (
    echo Searching for packages containing "%~1"...
    adb shell pm list packages | findstr "%~1"
)

echo.
set /p PACKAGE_NAME=Enter the exact package name you want to pull APKs from: 

:: Set output folder
set "OUTPUT_DIR=output_apks\%PACKAGE_NAME%"
if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

echo.
echo Fetching APK paths for %PACKAGE_NAME%...
echo Saving files to %OUTPUT_DIR%
echo.

:: Pull each APK file
for /f "tokens=2 delims=:" %%i in ('adb shell pm path %PACKAGE_NAME%') do (
    set "APK_PATH=%%i"
    call :pull_apk
)

echo.
echo Done! APKs saved in %OUTPUT_DIR%
pause
exit /b

:pull_apk
setlocal enabledelayedexpansion
REM Remove leading space
set "CLEAN_PATH=!APK_PATH:~1!"
for %%f in (!CLEAN_PATH!) do set "FILENAME=%%~nxf"
echo Pulling !CLEAN_PATH! → %OUTPUT_DIR%\!FILENAME!
adb pull "!CLEAN_PATH!" "%OUTPUT_DIR%\!FILENAME!"
endlocal
exit /b
