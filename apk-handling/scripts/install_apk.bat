@echo off
setlocal enabledelayedexpansion

set "BASE_DIR=output_apks"

:: Check if base directory exists
if not exist "%BASE_DIR%" (
    echo Error: Directory '%BASE_DIR%' does not exist!
    exit /b 1
)

:: Show matching folders or list all
set "PACKAGE_FOUND=false"
if "%~1"=="" (
    echo No search keyword passed. Listing all extracted packages:
    for /d %%D in ("%BASE_DIR%\*") do (
        echo %%~nxD
        set "PACKAGE_FOUND=true"
    )
) else (
    echo Searching for extracted packages containing "%~1":
    for /d %%D in ("%BASE_DIR%\*%~1*") do (
        echo %%~nxD
        set "PACKAGE_FOUND=true"
    )
)

:: If no folders matched, exit early
if "%PACKAGE_FOUND%"=="false" (
    echo.
    echo No extracted APK folders found matching the criteria.
    exit /b 1
)

echo.
set /p PACKAGE_NAME=Enter the exact package name to install: 
set "APK_DIR=%BASE_DIR%\%PACKAGE_NAME%"

if not exist "%APK_DIR%" (
    echo Error: Folder '%APK_DIR%' does not exist!
    exit /b 1
)

:: Detect if connected device is an emulator
set IS_EMULATOR=false
for /f "tokens=1" %%D in ('adb devices ^| findstr /R "^[a-zA-Z0-9:-]*[ ]*device$"') do (
    for /f %%F in ('adb -s %%D shell getprop ro.kernel.qemu') do (
        if "%%F"=="1" (
            set IS_EMULATOR=true
            echo Detected device %%D is Emulator
        ) else (
            echo Detected device %%D is Real Device
        )
    )
)

:: Collect APKs
set "APK_LIST="

echo.
if "%IS_EMULATOR%"=="true" (
    echo Including all .apk files...
    for %%F in ("%APK_DIR%\*.apk") do (
        set "APK_LIST=!APK_LIST! "%%F""
    )
) else (
    echo Excluding split_config.x86_64.apk from install...
    for %%F in ("%APK_DIR%\*.apk") do (
        echo %%~nxF | findstr /I /V "split_config.x86_64.apk" >nul
        if !errorlevel! == 0 (
            set "APK_LIST=!APK_LIST! "%%F""
        )
    )
)

if "%APK_LIST%"=="" (
    echo No APK files found in %APK_DIR%
    exit /b 1
)

echo.
echo Installing APKs from: %APK_DIR%
echo.

call adb install-multiple %APK_LIST%

echo.
echo Installation complete (if no errors above).
endlocal
