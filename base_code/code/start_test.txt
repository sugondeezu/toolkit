@echo off
setlocal enabledelayedexpansion
set driveletter=%~d0
set safemodevar=%SAFEBOOT_OPTION%
echo pause 1
pause

goto :cc_file_start

:check_safemode
set safemodevar=%SAFEBOOT_OPTION%
echo safemodevar = %safemodevar%
pause
if not defined %safemodevar% (
	pause
	echo not defined
	pause
	echo running in safe mode with option %safemodevar%
	echo pause 2
	pause
	goto start
) else (
	pause
	echo defined
	pause
	echo running in normal mode
	echo pause 3
	pause 3
	goto check_admin
)

:: checking admin priv
:check_admin
pause
echo checking admin
pause
net session >nul 2>&1
if %errorlevel% equ 0 (
	echo running as admin...
	pause
	goto start
) else (
	echo requesting admin privileges...
	powershell -command "start-process -filepath '%~f0' -verb runas -argumentlist 'elevated'"
	pause
	exit /b
)
goto :eof

:cc_file_start
echo safemodevar = %safemodevar%
pause
echo checking safemode
pause

goto :eof



::call :check_safemode
::call :check_admin


:start
start %driveletter%central_command.bat
exit