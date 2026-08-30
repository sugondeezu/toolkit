@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
  echo requesting admin privileges...
  powershell -command "start-process '%~f0' -verb runas"
  exit /b
  ) else (
  goto start
)

:start
set drivepath=%~dp0
start %drivepath%source\central_command.bat
exit
