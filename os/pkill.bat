@echo off
set driveletter=%~d0

powershell -command "& {$driveletter = '%driveletter%'; get-process | where-object {$_.path -and $_.path.startswith($driveletter)} | foreach-object {write-host 'closing process:'$_.name 'from' $_.path stop-process -id $_.id -force}}"
echo all applications from %driveletter% have been closed
pause
exit