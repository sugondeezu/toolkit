@echo off
set local enabledelayedexpansion
set cleanup_file=cleanup_new.bat
set driveletter=%~d0
if exist "%cleanup_file%" del %cleanup_file%
call :createselfdeletingbat "%cleanup_file%"
exit /b

:createselfdeletingbat
set "file=%~1"
set "code=%~2"
(
echo @echo off
echo %code%
echo powershell -command "& {$shell = new-object -comobject shell.application; $driveletter = '%driveletter%'; $drive = $shell.namespace(17).parsename($driveletter.trimend('\')); $drive.invokeverb('eject'); write-host "usb drive $driveletter ejected using shell.application"}"
echo all applications from %driveletter% have been closed
echo echo this script will now self-destruct
echo start "" cmd /c del "%%~f0"
echo exit
) > "%file%"
start "" "%file%"
exit /b
goto :eof