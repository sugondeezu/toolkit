@echo off
set local enabledelayedexpansion
set total_tasks=5
set complete_tasks=0

:showprogress
set /a percent=(%complete_tasks%*100/%total_tasks%)
set "bar="
set fill=####################
set "empty= "
set total=10

set /a filled=(%percent%/5)
for /L %%i in (1,1,%filled%) do (
set /a percent=(%%i*100)/%total_tasks%
set "bar=!fill:~0,%%i!!empty:~%%i!"
<nul set /p =progress: [%bar%] %percent%%
)
::for /L %%i in (%filled%,1,20) do set "bar=%bar%..."

::<nul set /p =progress: [%bar%] %percent%%

if 

:task1
timeout /t 1 >nul
set /a complete_tasks+=1
call :showprogress
pause
goto :eof

:task2
timeout /t 1 >nul
set /a complete_tasks+=1
call :showprogress
goto :eof

:task3
timeout /t 1 >nul
set /a complete_tasks+=1
call :showprogress
goto :eof

:task4
timeout /t 1 >nul
set /a complete_tasks+=1
call :showprogress
goto :eof

:task5
echo task 5
timeout /t 1 >nul
set /a complete_tasks+=1
call :showprogress
goto :eof

cls
echo running tasks
call :task1
call :task2
call :task3
call :task4
call :task5

echo.
echo all tasks completed
pause
exit