@echo off
set driveletter=%~d0

:: check admin privileges
net session >nul 2>&1
if %errorlevel% equ 0 (
	echo running as admin...
	echo continuing with script...
	goto start
) else (
	echo requesting admin privileges...
	powershell -command "start-process -filepath '%~f0' -verb runas -argumentlist 'elevated'"
	exit /b
)

:start
start %driveletter%central_command.bat
exit