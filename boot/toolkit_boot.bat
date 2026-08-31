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
echo %divider%
echo 	%subdivider1%
echo 	exit ........................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option: || set choice=9
if "%choice%"=="01" goto clean_menu
if "%choice%"=="02" goto debloat_menu
if "%choice%"=="03" goto disinfect_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

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
