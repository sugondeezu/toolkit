@echo off
set driveletter=%~d0

powershell -command "& {$shell = new-object -comobject shell.application; $driveletter = '%driveletter%'; $drive = $shell.namespace(17).parsename($driveletter.trimend('\')); $drive.invokeverb('eject'); write-host "usb drive $driveletter ejected using shell.application"}"
pause
exit