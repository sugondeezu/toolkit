@echo off
cls
for /f "delims= " %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "black=%ESC%[30;1m"
set "red=%ESC%[31;1m"
set "green=%ESC%[32;1m"
set "yellow=%ESC%[33;1m"
set "blue=%ESC%[34;1m"
set "magenta=%ESC%[35;1m"
set "cyan=%ESC%[36;1m"
set "white=%ESC%[0m"
set driveletter=%~d0
set drivepath=%driveletter%\
set appname=toolkit
set appversletter=v
set appversnum=2.0.1
set appvers=%appvers%%appversnum%
set dev=neek
set title=%appname% - %appvers%
set uic=f
set ggc=b
set infoc=b
set errc=c

set divider======================================================
set subdivider1=====================================
set subdivider2==============================
set subdivider3=======================

:: =============================
:: initial start page
:: =============================
:start
title %title%
echo.
echo %divider%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo 	%appname% %appvers% - by %dev%
echo 	%subdivider1%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %divider%
pause>null
goto intro_page

:: =============================
:: initial start page
:: =============================
:intro_page
title %title%
color %uic%
echo.
echo %divider%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo 	this application was made to support data recovery and device health
echo 	by booting to this application, you are able to access your device outside of the operating system.  powerful stuff.  use with caution.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %white%%divider%
pause>null
goto main_menu

:: =============================
:: app menu
:: =============================
:main_menu
del null
title %title%
cls
echo.
echo %divider%
echo 	stage 1 [clean] ................ [01]
echo 	stage 2 [de-bloat] ............. [02]
echo 	stage 3 [disinfect] ............ [03]
echo 	stage 3 [test notepad] ......... [04]
echo 	stage 3 [test hijack] .......... [05]
echo 	stage 3 [call function] ........ [06]
echo 	stage 3 [data recovery] ........ [07]
echo %divider%
echo 	%subdivider1%
echo 	exit ........................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option: || set choice=9
if "%choice%"=="01" goto clean_menu
if "%choice%"=="02" goto debloat_menu
if "%choice%"=="03" goto disinfect_menu
if "%choice%"=="04" goto test_notepad
if "%choice%"=="05" goto test_hijack
if "%choice%"=="06" goto summon_function
if "%choice%"=="07" goto :robocopy_suite
if "%choice%"=="0" goto exit
goto error_program
pause>null

:summon_function
echo %subdivider1%
echo enter a function to call:
set /p user_function_input=
echo calling function %user_function_input%
call :%user_function_input%
echo %subdivider1%
echo 	call another function? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :summon_function
if %confirm%==2 goto main_menu

:cmd_start
echo starting cmd function... (press any key to continue)
pause>null
echo open new command window?
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=1
if %confirm%==1 goto :cmd
if %confirm%==2 goto :main_menu
:cmd
start cmd.exe
pause>null
echo open another window? (enter to cancel)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :cmd
if %confirm%==2 goto :eof

:xcopy_suite
echo starting xcopy suite...
echo this command is used to copy and paste data from one location to another
echo please ensure the locations you provide are accurate
echo do you know your os drive letter?  if not, use diskpart now...
echo open new command window? (enter to cancel)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :cmd
if %confirm%==2 goto :external_drive_check
:external_drive_check
echo do you know your external drive letter?  if not, use diskpart now...
echo open another window? (enter to cancel)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :cmd
if %confirm%==2 goto :main_menu
echo please enter starting folder location (data you want to copy)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :cmd
if %confirm%==2 goto :main_menu
echo please enter final folder location (location to save data to)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :cmd
if %confirm%==2 goto :main_menu

:robocopy_suite
cls
echo ============================================================
echo                     DATA RECOVERY
echo ============================================================
echo.
echo current disks and volumes:
echo.
set "DPSCRIPT=%driveletter%dp_volumes.txt"
>"%DPSCRIPT%" echo list volume
>>"%DPSCRIPT%" echo exit
diskpart /s "%DPSCRIPT%"
del "%DPSCRIPT%" >nul 2>&1
echo.
echo ============================================================
echo.
set /p "SOURCE=enter SOURCE drive letter (example: D): "
set /p "DEST=enter DESTINATION drive letter (example: E): "
set "SOURCE=%SOURCE::=%"
set "DEST=%DEST::=%"
if not defined SOURCE (
    echo.
    echo error: no source drive was entered
    echo returning to start of suite...
    pause
    goto robocopy_suite
)
if not defined DEST (
    echo.
    echo error: no destination drive was entered
    echo returning to start of suite...
    pause
    goto robocopy_suite
)
if not exist "%SOURCE%:\" (
    echo.
    echo error: source drive %SOURCE%: does not exist
    echo returning to start of suite...
    pause
    goto robocopy_suite
)
if not exist "%DEST%:\" (
    echo.
    echo error: destination drive %DEST%: does not exist
    echo returning to start of suite...
    pause
    goto robocopy_suite
)
if /I "%SOURCE%"=="%DEST%" (
    echo.
    echo error: source and destination cannot be the same drive
    echo returning to start of suite...
    pause
    goto robocopy_suite
)
if /I "%DEST%"=="X" (
    echo.
    echo error: X: is the WinPE RAM drive and cannot be used as the recovery destination
    echo.
    pause
    goto robocopy_suite
)
set "SOURCEPATH=%SOURCE%:\Users"
set "DESTPATH=%DEST%:\Recovery\Users"
if not exist "%SOURCEPATH%\" (
    echo.
    echo error: the windows users folder was not found:
    echo %SOURCEPATH%
    echo.
    echo verify that %SOURCE%: is the windows operating system drive
    echo.
    pause
    goto robocopy_suite
)
echo.
:confirm_recovery
echo ============================================================
echo                     CONFIRM RECOVERY
echo ============================================================
echo.
echo source:
echo   %SOURCEPATH%
echo.
echo destination:
echo   %DESTPATH%
echo.
echo make sure %DEST%: is the external recovery drive
echo continue? (return to cancel)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==2 goto :robocopy_suite
if not %confirm%==1 goto :robocopy_suite
echo starting recovery...
echo.
if not exist "%DEST%:\Recovery" (
    mkdir "%DEST%:\Recovery"
)
robocopy "%SOURCEPATH%" "%DESTPATH%" /E /COPY:DAT /DCOPY:DAT /XJ /R:1 /W:1 /TEE /LOG:"%DEST%:\Recovery\Recovery.log"
set "ROBOCODE=%ERRORLEVEL%"
echo.
echo ============================================================
if %ROBOCODE% LSS 8 (
    echo recovery operation completed successfully
    echo robocopy exit code: %ROBOCODE%
) else (
    echo warning: recovery completed with copy errors.
    echo robocopy exit code: %ROBOCODE%
    echo.
    echo review the recovery log for files that could not be copied:
    echo %DEST%:\Recovery\Recovery.log
)
echo ============================================================
echo.
pause >nul
goto :eof

:test_notepad
echo %subdivider2%
start %driveletter%Apps\utilities\notepad++\notepad++.exe
echo %subdivider2%
pause>null
goto :main_menu

:test_hijack
echo %subdivider2%
start %driveletter%Apps\av\hijack\HiJackThis.exe
echo %subdivider2%
pause>null
goto :main_menu

:: =============================
:: xcopy section
:: =============================
:xcopy_suite
echo starting xcopy suite for data recovery to an external drive...

:: =============================
:: success message
:: =============================
:success
echo %green%
echo %divider%
echo.
echo 	success!
echo.
echo %divider%
echo %white%
pause>null
goto :eof

:: =============================
:: error message retry
:: =============================
:error_retry
echo %red%
echo #
echo # %divider%
echo # %appname% %appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo #
echo 	error
echo 	retrying, please wait
echo #
echo # %divider%
echo #
echo %white%
pause>null
goto :eof

:: =============================
:: error message failure
:: =============================
:error_fail
::color %errc%
echo %red%
echo #
echo # %divider%
echo # %appname% %appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo #
echo 	error
echo 	%custom_failure_msg%
echo #
echo # %divider%
echo #
echo %white%
pause>null
goto main_menu

rem =============================
rem program error
rem =============================
:error_program
del null
cls
title %appname% %appvers% - %appstat% [Error]
echo %red%
echo #
echo # %divider%
echo # %appname% %appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo #
echo # error
echo # invalid option, please try again...
echo #
echo # %divider%
echo #
echo # press any key to continue... (except power button lol)
echo %white%
pause>null
goto main_menu
