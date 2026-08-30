@echo off
set driveletter=%~d0

:: checking if in safe mode
set safemodevar=%SAFEBOOT_OPTION%
if defined %safemodevar% (
	echo running in safe mode with option %safemodevar%
	pause
	goto start
) else (
	echo running in normal mode
)

:start
start %driveletter%central_command.bat
exit