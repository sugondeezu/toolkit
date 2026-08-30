@echo off
set drivepath=%~d0
set appname=Central Command
set appversletter=V
set appversnum=1.0
set appvers=%appvers%%appversnum%
set dev=neek
set title=%appname% %appvers%
set uic=f
set ggc=b
set infoc=b
set errc=c
set divider====================================================================================

:start
title %title%
cls
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
echo  %appname% %appvers% - by %dev%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %divider%
pause
goto home

:home
cls
color %uic%
echo.
echo.
echo %divider%
echo 	restore point [quick create].. [1]
echo 	device tools.................. [2]
echo 	diagnostics................... [3]
echo 	utilities..................... [4]
echo 	exit ......................... [0]
echo %divider%
echo.
set /p choice=Type option: || set choice=9
if "%choice%"=="1" goto save_point_start
if "%choice%"=="2" goto device_tools
if "%choice%"=="3" goto diagnostics
if "%choice%"=="4" goto utilities
if "%choice%"=="0" goto exit
goto home

:save_point_start
call :restore_setup
call :10
call :quick_save
call :1440
call :bell
pause
goto home

:bde
cls
echo.
echo manage-bde options:
echo.
echo %divider%
echo [1] status (all drives)
echo [2] status (one drives)
echo [3] key
echo [4] off
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option: || set choice=5
if "%choice%"=="1" goto bde_status_all_start
if "%choice%"=="2" goto bde_status_input_start
if "%choice%"=="3" goto bde_key_start
if "%choice%"=="4" goto bde_off_start
if "%choice%"=="5" goto bde_off_c_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto bde

:bde_status_all_start
call :bde_status_all
pause
goto bde
:bde_status_input_start
call :bde_status_input
pause
goto bde
:bde_key_start
call :bde_key
pause
goto bde
:bde_off_start
call :bde_off
pause
goto bde
:bde_off_c_start
call :bde_off_c
call :bde_status_c
pause
goto bde

:chkdsk
cls
echo.
echo chkdsk options:
echo.
echo %divider%
echo [1] read-only
echo [2] disk check
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto read_only_start
if "%choice%"=="2" goto frb_start
if "%choice%"=="2" goto cleanup_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto chkdsk

:read_only_start
call :read_only
pause
goto chkdsk
:frb_start
call :frb
pause
goto chkdsk
:cleanup_start
call :xsdcleanup
pause
goto chkdsk

:device_tools
cls
echo.
echo device tools:
echo.
echo %divider%
echo [1] computer mgr
echo [2] cmd
echo [3] device mgr
echo [4] event vwr
echo [5] start menu
echo [6] regedit
echo [7] users folder
echo %divider%
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto comp_mgr_start
if "%choice%"=="2" goto cmd_start
if "%choice%"=="3" goto device_mgr_start
if "%choice%"=="4" goto event_vwr_start
if "%choice%"=="5" goto start_start
if "%choice%"=="6" goto regedit_start
if "%choice%"=="7" goto users_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto device_tools

:comp_mgr_start
call :comp_mgr
pause
goto device_tools
:cmd_start
call :cmd
pause
goto device_tools
:device_mgr_start
call :device_mgr
pause
goto device_tools
:event_vwr_start
call :event_vwr
pause
goto device_tools
:start_start
call :start
pause
goto device_tools
:regedit_start
call :regedit
pause
goto device_tools
:users_start
call :users
pause
goto device_tools

:diagnostics
cls
echo.
echo diagnostics options:
echo.
echo %divider%
echo [1] chkdsk
echo [2] dism
echo [3] mdsched
echo [4] perfmon
echo [5] power configuration
echo [6] sfc
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto chkdsk
if "%choice%"=="2" goto dism
if "%choice%"=="3" goto mdsched_start
if "%choice%"=="4" goto perfmon_start
if "%choice%"=="5" goto powercfg
if "%choice%"=="6" goto sfc_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto diagnostics

:perfmon_start
call :perfmon_suite
goto diagnostics
:sfc_start
call :sfc
goto diagnostics
:mdsched_start
call :mdsched
goto diagnostics

:disk_mgmt
cls
echo.
echo disk management:
echo.
echo %divider%
echo [1] chkdsk
echo [2] defrag
echo [3] disk wiz suite
echo [4] dism
echo [5] sfc
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto chkdsk
if "%choice%"=="2" goto defrag_start
if "%choice%"=="3" goto disk_wiz_start
if "%choice%"=="4" goto dism
if "%choice%"=="5" goto sfc_start
if "%choice%"=="8" goto utilities
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto disk_mgmt

:defrag_start
call :defrag
goto diskmgmt
:disk_wiz_start
call :chkdsk & call :sfc & call :defrag & call :dism
goto diskmgmt

:dism
cls
echo.
echo dism options:
echo.
echo %divider%
echo [1] check health
echo [2] scan health
echo [3] restore health
echo [4] mount points
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto check_start
if "%choice%"=="2" goto scan_start
if "%choice%"=="3" goto restore_start
if "%choice%"=="4" goto mount_start
if "%choice%"=="8" goto disk_mgmt
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto dism

:check_start
call :check
goto dism
:scan_start
call :scan
goto dism
:restore_start
call :restore
goto dism
:mount_start
call :mount
goto dism

:network
cls
echo.
echo network options:
echo.
echo %divider%
echo [1] ping
echo [2] reset
echo [3] interfaces
echo [4] wifi report
echo [5] known networks
echo [6] wifi pwd
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto ping_start
if "%choice%"=="2" goto reset_start
if "%choice%"=="3" goto interfaces_start
if "%choice%"=="4" goto wifi_report_start
if "%choice%"=="5" goto known_networks_start
if "%choice%"=="6" goto wifi_pwd_start
if "%choice%"=="8" goto utilities
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto network

:ping_start
call :ping
pause
goto network
:reset_start
call :network_reset_suite
call :bell
pause
goto network
:interfaces_start
call :interfaces
pause
goto network
:wifi_report_start
call ::wifi_report
pause
goto network
:known_networks_start
call :known_networks
pause
goto network
:wifi_pwd_start
call :wifi_pwd
pause
goto network

:power
cls
echo.
echo power options:
echo.
echo %divider%
echo [1] restart
echo [2] shutdown
echo [3] bios
echo [4] recovery
echo [4] powercfg
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto restart
if "%choice%"=="2" goto shutdown
if "%choice%"=="3" goto bios
if "%choice%"=="4" goto recovery
if "%choice%"=="8" goto system_mgmt
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto power

:powercfg
cls
echo.
echo powercfg options:
echo.
echo %divider%
echo [1] battery report
echo [2] energy
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto powercfg_battery
if "%choice%"=="2" goto powercfg_energy
if "%choice%"=="8" goto system_mgmt
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto powercfg

:reset
cls
echo.
echo what to reset:
echo.
echo %divider%
echo [1] network
echo [2] security
echo [3] start menu
echo [4] update service
echo %divider%
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto network_reset_start
if "%choice%"=="2" goto winsec_reset_start
if "%choice%"=="2" goto start_menu_reset_start
if "%choice%"=="2" goto updates_reset_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto reset

:network_reset_start
call :network_reset_suite
goto reset
:winsec_reset_start
call :winsec_reset
goto reset
:start_menu_reset_start
call :start_menu_reset
goto reset
:winsec_reset_start
call :updates_reset
goto reset

:system_info
cls
echo.
echo hardware management:
echo.
echo %divider%
echo [1] bcdedit
echo [2] diagnostics
echo [3] manage-bde
echo [4] serial number
echo [5] system info
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto bcdedit_start
if "%choice%"=="2" goto diagnostics
if "%choice%"=="3" goto bde
if "%choice%"=="4" goto serialnumber_start
if "%choice%"=="5" goto systeminfo_start
if "%choice%"=="8" goto utilities
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto system_info

:bcdedit_start
call :bcdedit
pause
goto system_info
:serialnumber_start
call :serialnumber
pause
goto system_info
:systeminfo_start
call :systeminfo
pause
goto system_info

:system_mgmt
cls
echo.
echo system management:
echo.
echo %divider%
echo [1] power
echo [2] reset
echo %divider%
echo [8] back
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto power
if "%choice%"=="2" goto reset
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto system_mgmt

:utilities
cls
echo.
echo utilities:
echo.
echo %divider%
echo [1] disk mgmt
echo [3] hw mgmt
echo [4] network mgmt
echo [6] system mgmt
echo %divider%
echo [9] home
echo [0] exit
echo %divider%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto disk_mgmt
if "%choice%"=="2" goto file_mgmt
if "%choice%"=="3" goto system_info
if "%choice%"=="4" goto network
if "%choice%"=="5" goto services_mgmt
if "%choice%"=="6" goto system_mgmt
if "%choice%"=="7" goto reset
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto utilities

::bde section
:bde_status_all
echo checking bitlocker drive status for all mounted drives
manage-bde -status
goto :eof
:bde_status_input
echo enter drive letter:
set /p drive_input=enter letter A-Z
echo checking bitlocker drive status for drive:
manage-bde -status %drive_input%:
goto :eof
:bde_key
echo enter drive letter:
set /p drive_input=enter letter A-Z
echo fetching bitlocker key for drive %drive_input%:
manage-bde -protectors %drive_input%: -get
goto :eof
:bde_off_c
echo turning off bitlocker for drive c:
manage-bde -off c:
goto :eof
:bde_status_c
echo checking bitlocker drive status for c drive
manage-bde -status c:
goto :eof
:bde_off
echo enter drive letter:
set /p drive_input=enter letter A-Z
echo turning off bitlocker for drive: %drive_input%:
manage-bde -off %drive_input%:
goto :eof

::chkdsk section
:read_only
echo running read only mode
chkdsk c:
goto :eof
:frb
echo running /f (fixes errors) /r (recovers readable information) /b
chkdsk c: /f/r/b
goto :eof
:xsdcleanup
echo running /x/sdcleanup command in terminal
chkdsk c: /x/sdcleanup
goto :eof

::device tools section
:users
start "" "c:\Users\"
pause
goto :eof
:device_mgr
start cmd.exe /c (devmgmt)
pause
goto :eof
:comp_mgr
start cmd.exe /c (compmgmt)
pause
goto :eof
:event_vwr
start cmd.exe /c (eventvwr)
pause
goto :eof
:start
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"
pause
goto :eof
:cmd
echo cmd command:
set /p cmd_input=
start cmd.exe /k (%cmd_input%)
goto :eof
:regedit
echo calling regedit
start cmd.exe /c (regedit)
goto :eof

::diagnostics section
:defrag
start cmd.exe /c (defrag c: /u /x /v /o /l /g)
goto :eof
:perfmon_suite
echo running perfmon
perfmon & perfmon /report
goto :eof
:sfc
echo running sfc /scannow command in terminal
start cmd.exe /c (sfc /scannow)
goto :eof
:mdsched
echo running mdsched command in terminal
start cmd.exe /c (mdsched)
goto :eof
:powercfg_battery
echo running powercfg commands in terminal
powercfg /batteryreport
pause
goto :eof
:powercfg_energy
echo running powercfg commands in terminal
powercfg /energy
pause
goto :eof

::dism section
:check
start cmd.exe /c (dism /online /cleanup-image /checkhealth)
goto :eof
:scan
start cmd.exe /c (dism /online /cleanup-image /scanhealth)
goto :eof
:restore
start cmd.exe /c (dism /online /cleanup-image /restorehealth)
goto :eof
:mount
start cmd.exe /c (dism /online /cleanup-mountpoints)
goto :eof

::exit code
:exit
echo exiting application & call :restore_setup & call :10 & call :quick_save_exit & call :1440 & call :recycle_empty & echo deleting temp files & call :temp_clean & echo cleaning mount points & call :mount
exit

::network section
:firewall_reset
echo resetting windows firewall
netsh advfirewall reset & echo restoring local firewall defaults: & powershell -command "(new-object -comobject hnetcfg.fwpolicy2).restorelocalfirewalldefaults()"
echo windows firewall restored to default settings
goto :eof
:interfaces
echo showing network adapters
netsh interface show interface
goto :eof
:known_networks
echo generating list of known wifi networks
netsh wlan show profiles | findstr /R /C:"[ ]:[ ]"
goto :eof
:ping
echo testing internet connection
ping 8.8.8.8
goto :eof
:network_reset
echo resetting network adapters, connections, and firewall:
ipconfig /release & ipconfig /flushdns & ipconfig /renew & netsh winsock reset & netsh interface ipv4 reset & netsh interface ipv6 reset & netsh winsock reset catalog & netsh int ipv4 reset reset.log & netsh int ipv6 reset reset.log & netsh int ip reset & ren c:\windows\softwaredistribution softwaredistribution.old & ren c:\windows\system32\catroot2 catroot2.old
echo network reset complete
goto :eof
:network_reset_suite
call :network_reset & call :firewall_reset & call :ping
goto :eof
:wifi_pwd
echo enter wifi name:
set /p wifi_name=
echo generating %wifi_name% wifi password
netsh wlan show profile %wifi_name% key=clear | findstr /r "^....SSID Name, Key Content" & netsh wlan show profile %wifi_name% key=clear | findstr /r "^....SSID Name, Key Content" > C:\Users\Public\Desktop\%wifi_name%.txt
goto :eof
:wifi_report
echo generating wifi connection report
netsh wlan show wlanreport
echo copying report to public desktop
copy C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html C:\Users\Public\Desktop\
goto :eof

:temp_clean
del /q/f/s %TEMP%\* & del /s/q c:\windows\temp\* & del /q/f/s c:\windows\softwaredistribution\download\*
goto :eof
:recycle_empty
echo emptying recycle bins for all drives
powershell -command "clear-recyclebin -force"
goto :eof
:updates_reset
echo resetting windows update service:
net stop bits & net stop wuauserv & net stop appidsvc & net stop cryptsvc & ren c:\\windows\\softwaredistribution softwaredistribution.old & ren c:\\windows\\system32\\catroot2 catroot2.old & net start bits & net start wuauserv & net start appidsvc & net start cryptsvc
goto :eof
:bell
powershell -command "[console]::beep(800,200); [console]::beep(800,200); [console]::beep(800,200)"
goto :eof

::power section
:restart
echo intitiating device restart
pause
shutdown /g /f /t 0
goto :eof
:shutdown
echo shutting down device
pause
shutdown /s /f /t 0
goto :eof
:bios
echo restarting to bios
pause
shutdown /r /fw /t 0
goto :eof
:recovery
pause
echo restarting to recovery partition
shutdown /r /o /t 0
goto :eof

::save point section
:quick_save
set /p restore_point_name=name for your restore point: || set restore_point_name=%date%-%time%
echo creating restore point: %restore_point_name%
powershell -Command "& {$var='%restore_point_name%'; checkpoint-computer -description "$var" -restorepointtype "MODIFY_SETTINGS"}"
if %errorlevel% equ 0 (
  echo.
  echo success
  echo.
  goto :eof
  ) else (
  echo.
  echo error
  echo.
  echo retrying
  echo.
  goto :restore_setup
)
goto :eof
:quick_save_exit
echo creating restore point: %date%-%time%
powershell -Command "& {$var='%date%-%time%'; checkpoint-computer -description "$var" -restorepointtype "MODIFY_SETTINGS"}"
if %errorlevel% equ 0 (
  color %ggc%
  echo.
  echo success
  echo.
  color %uic%
  goto :eof
  ) else (
  color %errc%
  echo.
  echo error
  echo.
  echo retrying
  echo.
  color %uic%
  goto :restore_setup
)
goto :eof
:10
echo setting time interval to 10 minutes
powershell -command "set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' -name 'SystemRestorePointCreationFrequency' -value 10"
goto :eof
:60
echo setting time interval to 60 minutes
powershell -command "set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' -name 'SystemRestorePointCreationFrequency' -value 60"
goto :eof
:1440
echo setting time interval to 24 hours
powershell -command "set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' -name 'SystemRestorePointCreationFrequency' -value 1440"
goto :eof
:restore_setup
echo enabling restore point creation
powershell -command "enable-computerrestore -drive 'c:\'"
goto :eof

::system info section
:sysinfo
echo gathering system information
call :systeminfo & call :serialnumber & call :bcdedit
:systeminfo
echo running system info command in terminal
systeminfo & systeminfo > c:\systeminfo.txt
goto :eof
:serialnumber
echo running serial number command in terminal
wmic bios get serialnumber & wmic /output:c:\serial_number.txt bios get serialnumber
if %errorlevel% equ 0 (
  color %ggc%
  echo.
  echo success
  echo.
  color %uic%
  goto :eof
  ) else (
  color %errc%
  echo.
  echo error
  echo.
  echo retrying
  echo.
  goto :wmic_install
  echo.
  echo please try again after enabling wmic
  echo.
  color %uic%
  goto :eof
)
:wmic_install
echo setting up wmi for use
start cmd.exe /c (dism /online /add-capability /capabilityname:wmic~~~~)
goto :eof
:bcdedit
echo running bcdedit command in terminal
bcdedit & bcdedit > c:\bcdedit.txt
goto :eof
:dxdiag
echo running dxdiag command in terminal
dxdiag
goto :eof

::system_mgmt section
:start_menu_reset
echo resetting start menu icons
regsvr32 /i shell32.dll
if %errorlevel% equ 0 (
  color %ggc%
  echo.
  echo success
  echo.
  color %uic%
  goto :eof
  ) else (
  color %errc%
  echo.
  echo error
  echo.
  echo unable to reset start menu
  color %ggc%
  echo.
  goto :eof
)
goto :eof
:timeout
timeout /t 10 /nobreak
goto :eof

::winsec section
:winsec_reset
echo initiating windows security reset
echo.
powershell -command "get-appxpackage microsoft.sechealthui -allusers | reset-appxpackage"
goto :eof
