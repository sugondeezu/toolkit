:: =============================
:: WiFi Passview - https://github.com/WarenGonzaga/wrn-passview
:: An open source batch script based program that can recover your WiFi Password easily in seconds.
:: Version: 5.0.0 [Sohee]
:: Github: https://github.com/WarenGonzaga/wrn-passview
:: Licensed Under The MIT License: http://opensource.org/licenses/MIT
:: copyright (c) 2025 nick salvetti
::
:: twitter: @sugondeezu
:: github: https://github.com/nick-spaghetti
::
:: donate or support!
:: https://buymeacoffee.com/nsal
:: =============================

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
set drivepath=%~d0
set appname=Central Command
set appversletter=V
set appversnum=1.2
set appvers=%appvers%%appversnum%
set dev=neek
set title=%appname% - %appvers%
set uic=f
set ggc=b
set infoc=b
set errc=c
::  0 = Black  8 = Gray
::  1 = Blue  9 = Light Blue
::  2 = Green  A = Light Green
::  3 = Aqua  B = Light Aqua
::  4 = Red  C = Light Red
::  5 = Purple  D = Light Purple
::  6 = Yellow  E = Light Yellow
::  7 = White  F = Bright White

set divider================================================
set subdivider1=====================================
set subdivider2==============================
set subdivider3=======================

:: =============================
:: initial page
:: =============================
:start
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
echo %white%%divider%
pause>null
goto home

:: =============================
:: main menu
:: =============================
:home
del null
title %title%
cls
color %uicolor%
echo.
echo.
echo %divider%
echo 	save point ................. [1]
echo 	anti-virus ................. [2]
echo 	device tools ............... [3]
echo 	diagnostics ................ [4]
echo 	utilities .................. [5]
echo 	nick favs .................. [6]
echo 	un/install ................. [7]
::echo 	test ....................... [8]
::echo 	call a function ........... [88]
::echo 	art test .................. [99]
echo 	exit ....................... [0]
echo %divider%
::echo 	Automated (Default) ....... [1]
::echo 	Manual .................... [2]
::echo 	Donate .................... [3]
::echo 	Credits ................... [4]
::echo 	Options ................... [5]
::echo 	Exit ...................... [6]
::echo ===============================================
::echo %divider%
echo.
set /p choice=Type option: || set choice=9
if "%choice%"=="1" goto save_point
if "%choice%"=="2" goto av
if "%choice%"=="3" goto device_tools
if "%choice%"=="4" goto diagnostics
if "%choice%"=="5" goto utilities
if "%choice%"=="6" goto nick_favs
if "%choice%"=="7" goto un_install
if "%choice%"=="8" goto test
if "%choice%"=="88" goto call_function
if "%choice%"=="99" goto art_test
::if "%choice%"=="map" goto map
if "%choice%"=="9" goto let_it_run
if "%choice%"=="0" goto exit
::goto home
goto error_program
pause>null

:test
set "black=%ESC%[3;30;1m"
set "red=%ESC%[31;1m"
set "green=%ESC%[32;1m"
set "yellow=%ESC%[33;1m"
set "blue=%ESC%[34;1m"
set "magenta=%ESC%[35;1m"
set "cyan=%ESC%[40;36m"
set "white=%ESC%[37;1m"
echo %subdivider2%
echo %black%test 1: black
echo %red%
echo test 2: red
echo %subdivider1%
echo %subdivider2%
echo %subdivider3%
echo %green%test 3: green
echo %yellow%test 4: yellow
echo %blue%test 5: blue
echo %magenta%test 6: magenta
echo %cyan%test 7: cyan%white% - %yellow%test 9: yellow%white% more text here
echo %white%test 8: white%white%
echo %subdivider2%
pause>null
goto home

:call_function
echo %subdivider1%
echo enter a function to call:
set /p user_function_input=
echo calling function %user_function_input%
call :%user_function_input%
echo %subdivider1%
pause>null
goto home

:let_it_run
echo %subdivider1%
call :new_setup_nf
echo %subdivider1%
call :bell
pause>null
goto home

:art_test
echo %subdivider1%
@ECHO OFF
ECHO DON'T WORRY, BE HAPPY!
type %driveletter%\art.txt
echo %subdivider1%
pause>null
goto home

:: =============================
:: av menu
:: =============================
:av
del null
cls
echo.
echo antivirus options:
echo.
echo %divider%
echo [1] mrt
echo [2] npe
echo [3] rootkit
echo [4] stinger
echo [5] process killer
echo [6] solitaire
echo [7] tdsskiller
echo [8] malwarebytes
echo [10] hijackthis
echo [11] winsec
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto mrt_start
if "%choice%"=="2" goto npe_start
if "%choice%"=="3" goto rr_start
if "%choice%"=="4" goto stinger_start
if "%choice%"=="5" goto pk_start
if "%choice%"=="6" goto solitaire_start
if "%choice%"=="7" goto tdsskiller_start
if "%choice%"=="8" goto mwb_start
if "%choice%"=="10" goto hjt_start
if "%choice%"=="11" goto winsec
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:mrt_start
call :mrt
pause>null
goto av
:mpscan_start
echo %subdivider1%
echo starting full scan
call :winsec_full
echo %subdivider1%
call :bell
pause>null
goto av
:pk_start
call :pk
pause>null
goto av
:solitaire_start
call :solitaire
pause>null
goto av
:npe_start
call :npe
pause>null
goto av
:stinger_start
call :stinger
pause>null
goto av
:rr_start
call :rr
pause>null
goto av
:tdsskiller_start
call :tdsskiller
pause>null
goto av
:mwb_start
call :mwb
pause>null
goto av
:hjt_start
call :hjt
pause>null
goto av


:: =============================
:: bde menu
:: =============================
:bde
del null
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
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option: || set choice=5
if "%choice%"=="1" goto bde_status_all_start
if "%choice%"=="2" goto bde_status_input_start
if "%choice%"=="3" goto bde_key_start
if "%choice%"=="4" goto bde_off_start
if "%choice%"=="5" goto bde_off_c_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:bde_status_all_start
echo %subdivider1%
call :bde_status_all
echo %subdivider1%
pause>null
goto bde
:bde_status_input_start
echo %subdivider1%
call :bde_status_input
echo %subdivider1%
pause>null
goto bde
:bde_key_start
echo %subdivider1%
call :bde_key
echo %subdivider1%
pause>null
goto bde
:bde_off_start
echo %subdivider1%
call :bde_off
echo %subdivider1%
pause>null
goto bde
:bde_off_c_start
echo %subdivider1%
call :bde_off_c
call :bde_status_c
echo %subdivider1%
pause>null
goto bde

:: =============================
:: chkdsk menu
:: =============================
:chkdsk
del null
cls
echo.
echo chkdsk options:
echo.
echo %divider%
echo [1] online
echo [2] offline
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto chkdsk_online_start
if "%choice%"=="2" goto chkdsk_offline_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:chkdsk_online_start
echo %subdivider1%
call :chkdsk_online
echo %subdivider1%
call :bell
pause>null
goto chkdsk
:chkdsk_offline_start
echo %subdivider1%
call :chkdsk_offline
echo %subdivider1%
call :bell
pause>null
goto chkdsk

:: =============================
:: device tools menu
:: =============================
:device_tools
del null
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
echo %subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
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
goto error_program
pause>null

:comp_mgr_start
call :comp_mgr
pause>null
goto device_tools
:cmd_start
call :cmd
pause>null
goto device_tools
:device_mgr_start
call :device_mgr
pause>null
goto device_tools
:event_vwr_start
call :event_vwr
pause>null
goto device_tools
:start_start
call :start
pause>null
goto device_tools
:regedit_start
call :regedit
pause>null
goto device_tools
:users_start
call :users
pause>null
goto device_tools

:: =============================
:: diagnostics menu
:: =============================
:diagnostics
del null
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
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
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
goto error_program
pause>null

:perfmon_start
echo %subdivider1%
call :perfmon_suite
echo %subdivider1%
pause>null
goto diagnostics
:sfc_start
echo %subdivider1%
call :sfc
echo %subdivider1%
pause>null
goto diagnostics
:mdsched_start
echo %subdivider1%
call :mdsched
echo %subdivider1%
pause>null
goto diagnostics

:: =============================
:: disk management menu
:: =============================
:disk_mgmt
del null
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
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
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
goto error_program
pause>null

:defrag_start
echo %subdivider1%
call :defrag
echo %subdivider1%
pause>null
goto diskmgmt
:disk_wiz_start
echo %subdivider1%
call :chkdsk & call :sfc & call :defrag & call :dism
echo %subdivider1%
pause>null
goto diskmgmt

:: =============================
:: dism menu
:: =============================
:dism
del null
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
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto check_start
if "%choice%"=="2" goto scan_start
if "%choice%"=="3" goto restore_start
if "%choice%"=="4" goto mount_start
if "%choice%"=="8" goto disk_mgmt
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:check_start
echo %subdivider1%
call :check
echo %subdivider1%
pause>null
goto dism
:scan_start
echo %subdivider1%
call :scan
echo %subdivider1%
pause>null
goto dism
:restore_start
echo %subdivider1%
call :restore
echo %subdivider1%
pause>null
goto dism
:mount_start
echo %subdivider1%
call :mount
echo %subdivider1%
pause>null
goto dism

:: =============================
:: file management menu
:: =============================
:file_mgmt
del null
cls
echo.
echo file management:
echo.
echo %divider%
echo [1] 7zFM
echo [2] file assc fix
echo [2] migration asst
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" start %drive_letter%:\win\utilities\file_management\7zFM.lnk
if "%choice%"=="2" start %drive_letter%:\win\utilities\file_management\file-association-fix.lnk
if "%choice%"=="3" start %drive_letter%:\win\utilities\file_management\WindowsMigrationAssistantSetup.exe
if "%choice%"=="8" goto utilities
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:: =============================
:: network menu
:: =============================
:network
del > null
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
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
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
goto error_program
pause>null

:ping_start
echo %subdivider1%
call :ping
echo %subdivider1%
call :bell
pause>null
goto network
:reset_start
echo %subdivider1%
call :network_reset_suite
echo %subdivider1%
call :bell
pause>null
goto network
:interfaces_start
echo %subdivider1%
call :interfaces
echo %subdivider1%
call :bell
pause>null
goto network
:wifi_report_start
echo %subdivider1%
call ::wifi_report
echo %subdivider1%
call :bell
pause>null
goto network
:known_networks_start
echo %subdivider1%
call :known_networks
echo %subdivider1%
call :bell
pause>null
goto network
:wifi_pwd_start
echo %subdivider1%
call :wifi_pwd
echo %subdivider1%
call :bell
pause>null
goto network

:: =============================
:: nick favs menu
:: =============================
:nick_favs
del null
cls
echo.
echo nick's favorites:
echo.
echo %divider%
echo [1] av blast
echo [2] diags
echo [3] disk wiz
echo [4] new setup
echo [5] nukem
echo [6] temp dump
echo [7] updates (win / sec)
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto av_blast_nf_start
if "%choice%"=="2" goto diags_nf_start
if "%choice%"=="3" goto disk_wiz_nf_start
if "%choice%"=="4" goto new_setup_nf_start
if "%choice%"=="5" goto nukem_nf_start
if "%choice%"=="6" goto temp_clean_nf_start
if "%choice%"=="7" goto updates_full_nf_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:av_blast_nf_start
echo %subdivider1%
call :av_blast_nf
echo %subdivider1%
call :bell
pause
goto nick_favs
:diags_nf_start
echo %subdivider1%
call :diags_nf
echo %subdivider1%
call :bell
pause
goto nick_favs
:disk_wiz_nf_start
echo %subdivider1%
call :disk_wiz_nf
echo %subdivider1%
call :bell
pause
goto nick_favs
:new_setup_nf_start
echo %subdivider1%
call :new_setup_nf
echo %subdivider1%
call :bell
pause
goto nick_favs
:nukem_nf_start
echo %subdivider1%
call :nukem_nf
echo %subdivider1%
call :bell
pause
goto nick_favs
:temp_clean_nf_start
echo %subdivider1%
call :temp_clean_nf
echo %subdivider1%
call :bell
pause
goto nick_favs
:updates_full_nf_start
echo %subdivider1%
call :updates_full_nf
echo %subdivider1%
call :bell
pause
goto nick_favs

:: =============================
:: power menu
:: =============================
:power
del null
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
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto restart
if "%choice%"=="2" goto shutdown
if "%choice%"=="3" goto bios
if "%choice%"=="4" goto recovery
if "%choice%"=="8" goto system_mgmt
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:: =============================
:: power config menu
:: =============================
:powercfg
del null
cls
echo.
echo powercfg options:
echo.
echo %divider%
echo [1] battery report
echo [2] energy
echo [3] disable delayed startup
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto powercfg_br_start
if "%choice%"=="2" goto powercfg_e_start
if "%choice%"=="8" goto powercfg_ds_start
if "%choice%"=="8" goto system_mgmt
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:powercfg_br_start
call :powercfg_br
goto :powercfg
powercfg_e_start
call :powercfg_e
goto :powercfg
powercfg_ds_start
call :powercfg_ds
goto :powercfg


:: =============================
:: reset menu
:: =============================
:reset
del null
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
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto network_reset_start
if "%choice%"=="2" goto winsec_reset_start
if "%choice%"=="2" goto start_menu_reset_start
if "%choice%"=="2" goto updates_reset_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:network_reset_start
echo %subdivider1%
call :network_reset_suite
echo %subdivider1%
call :bell
goto reset
:winsec_reset_start
echo %subdivider1%
call :winsec_reset
echo %subdivider1%
call :bell
goto reset
:start_menu_reset_start
echo %subdivider1%
call :start_menu_reset
echo %subdivider1%
call :bell
goto reset
:winsec_reset_start
echo %subdivider1%
call :updates_reset
echo %subdivider1%
call :bell
goto reset

:: =============================
:: save point menu
:: =============================
:save_point
del null
cls
echo.
echo restore point options:
echo.
echo %divider%
echo [1] quick save
echo [2] 10 minutes
echo [3] 1 hour
echo [4] 24 hours
echo [5] custom time
echo [6] custom storage size
echo [7] restore point enable / disable
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto quick_save_start
if "%choice%"=="2" goto 10_start
if "%choice%"=="3" goto 60_start
if "%choice%"=="4" goto 1440_start
if "%choice%"=="5" goto custom_time_start
if "%choice%"=="6" goto custom_size_start
if "%choice%"=="7" goto restore_setup_start
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:quick_save_start
call :quick_save
call :bell
pause
goto :save_point
:10_start
call :10
pause
goto :save_point
:60_start
call :60
pause
goto :save_point
:1440_start
call :1440
pause
goto :save_point
:custom_time_start
call :custom_time
pause
goto :save_point
:custom_size_start
call :shadow_size
pause
goto :save_point
:restore_setup_start
call :restore_setup
pause
goto :save_point

:: =============================
:: services management menu
:: =============================
:services_mgmt
del null
cls
echo.
echo services management:
echo.
echo %divider%
echo [1] ccleaner install
echo [1] ccleaner uninstall
echo [1] reg mech install
echo [1] reg mech uninstall
echo [3] restore services
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto ccleaner_install
if "%choice%"=="2" goto ccleaner_uninstall
if "%choice%"=="3" goto regmech_install
if "%choice%"=="4" goto regmech_uninstall
if "%choice%"=="5" goto restore_services
if "%choice%"=="8" goto utilities
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:: =============================
:: system info menu
:: =============================
:system_info
del null
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
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
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
goto error_program
pause>null

:bcdedit_start
echo %subdivider1%
call :bcdedit
echo %subdivider1%
pause
goto system_info
:serialnumber_start
echo %subdivider1%
call :serialnumber
echo %subdivider1%
pause
goto system_info
:systeminfo_start
echo %subdivider1%
call :systeminfo
echo %subdivider1%
pause
goto system_info

:: =============================
:: system management menu
:: =============================
:system_mgmt
del null
cls
echo.
echo system management:
echo.
echo %divider%
echo [1] autoruns
echo [2] power
echo [3] process explorer
echo [4] start menu reset
echo [5] windows updates reset
echo [6] winsec
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" start %drive_letter%:\win\utilities\system_management\autoruns.lnk
if "%choice%"=="2" goto power
if "%choice%"=="3" start %drive_letter%:\win\utilities\windows_tools\misc\process_exp\procexp.exe
if "%choice%"=="4" goto :start_menu_reset
if "%choice%"=="5" call :updates_reset
if "%choice%"=="6" goto winsec
if "%choice%"=="5" goto utilities
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:: =============================
:: un/install menu
:: =============================
:un_install
del null
cls
echo.
echo install / uninstall:
echo.
echo %divider%
echo [1] revo uninstaller
echo [2] winget
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto revo_start
if "%choice%"=="2" goto winget
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:revo_start
call :revo
goto :un_install

:: =============================
:: utilities menu
:: =============================
:utilities
del null
cls
echo.
echo utilities:
echo.
echo %divider%
echo [1] disk mgmt
echo [2] file mgmt
echo [3] hw mgmt
echo [4] network mgmt
echo [6] system mgmt
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
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
goto error_program
pause>null

:: =============================
:: winget menu
:: =============================
:winget
del null
cls
echo.
echo winget options:
echo.
echo %divider%
echo [1] list
echo [2] search
echo [3] install
echo [4] uninstall
echo [5] popular options
echo [6] update all
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto winget_list_start
if "%choice%"=="2" goto winget_search_start
if "%choice%"=="3" goto winget_install_input_start
if "%choice%"=="4" goto winget_uninstall_input_start
if "%choice%"=="5" goto winget_options_start
if "%choice%"=="6" goto winget_update_start
if "%choice%"=="8" goto nick_favs
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:winget_list_start
echo %subdivider1%
echo listing winget entries:
call :winget_list
echo %subdivider1%
pause
goto winget
:winget_search_start
echo %subdivider1%
echo winget search:
echo enter search item:
call :winget_search
echo %subdivider1%
pause
goto winget
:winget_install_input_start
echo %subdivider1%
call :winget_install_input
echo %subdivider1%
pause
goto winget
echo
:winget_uninstall_input_start
echo %subdivider1%
call :winget_uninstall_input
echo %subdivider1%
pause
goto winget
:winget_options_start
echo %subdivider1%
call :winget_options
echo %subdivider1%
pause
goto winget
:winget_update_start
echo %subdivider1%
call :winget_update
echo %subdivider1%
pause
goto winget

:: =============================
:: winsec menu
:: =============================
:winsec
del null
cls
echo.
echo windows security:
echo.
echo %divider%
echo [1] quick scan
echo [2] full scan
echo [3] offline scan
echo [4] update
echo [5] reset
echo %divider%
echo 	%subdivider1%
echo [7] av
echo [8] system mgmt
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="1" goto winsec_quick_start
if "%choice%"=="2" goto winsec_full_start
if "%choice%"=="3" goto winsec_offine_start
if "%choice%"=="4" goto winsec_update_start
if "%choice%"=="5" goto winsec_reset_start
if "%choice%"=="7" goto av
if "%choice%"=="8" goto system_mgmt
if "%choice%"=="9" goto home
if "%choice%"=="0" goto exit
goto error_program
pause>null

:winsec_quick_start
call :winsec_quick
call :bell
pause
goto winsec
:winsec_full_start
call :winsec_full
call :bell
pause
goto winsec
:winsec_offine_start
call :winsec_offline
call :bell
pause
goto winsec
:winsec_update_start
echo %subdivider1%
call :winsec_update
echo %subdivider1%
call :bell
pause
goto winsec
:winsec_reset_start
echo %subdivider1%
call :winsec_reset
echo %subdivider1%
call :bell
pause
goto winsec

:: =============================
:: av section
:: =============================
:mrt
start cmd.exe /c (mrt)
goto :eof
:pk
start %driveletter%\win\av\processkiller\ProcessKiller.exe
goto :eof
:solitaire
start %driveletter%\win\av\rkill\solitaire64.exe
goto :eof
:npe
start %driveletter%\win\av\NPE.exe
goto :eof
:rr
start %driveletter%\win\av\mcafee\rootkitremover.exe
goto :eof
:stinger
start %driveletter%\win\av\mcafee\stinger64-epo\stinger.exe
goto :eof
:tdsskiller
start %driveletter%\win\av\tdsskiller.exe
goto :eof
:mwb
start %driveletter%\win\av\mwb\MBSetup.exe
goto :eof
:hjt
start %driveletter%\win\av\hijack\HiJackThis.exe
goto :eof


:: =============================
:: bde section
:: =============================
:bde_status_all
echo checking bitlocker drive status for all mounted drives
manage-bde -status
goto :eof
:bde_status_input
echo enter drive letter:
set /p drive_input=enter letter A-Z... || set drive_input=1
if %drive_input%==1 goto :eof
echo checking bitlocker drive status for drive:
manage-bde -status %drive_input%:
goto :eof
:bde_key
echo enter drive letter:
set /p drive_input=enter letter A-Z... || set drive_input=1
if %drive_input%==1 goto :eof
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
echo enter drive letter...
set /p drive_input=enter letter A-Z || set drive_input=1
if %drive_input%==1 goto :eof
echo turning off bitlocker for drive: %drive_input%:
manage-bde -off %drive_input%:
goto :eof

:: =============================
:: chkdsk section
:: =============================
:read_only
echo running read only mode
chkdsk c:
goto :eof
:chkdsk_offline
echo running chkdsk offline scan and fix
chkdsk c: /f/r/b/x/offlinescanandfix/spotfix
goto :eof
:chkdsk_online
echo running chkdsk online scan and fix
chkdsk c: /scan/forceofflinefix
goto :eof
:chkdsk_loop_check
chkntfs c:
goto :eof
:chkdsk_loop_off
chkntfs /x c:
goto :eof

:: =============================
:: device tools section
:: =============================
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
set /p cmd_input= || set confirm=1
if %confirm%==1 goto :eof
start cmd.exe /k "%cmd_input%"
goto :eof
:regedit
echo calling regedit
start cmd.exe /c (regedit)
goto :eof
:::device_lookup
::for /f "delims=" %%A in ('powershell -Command "get-ciminstance -classname win32_computersystem | select-object manufacturer"') do set manufacturer=%%A
::echo %manufacturer% | findstr /i "dell"
::if exist "%manufacturer%" (
::echo device manufacturer: %manufacturer%
::if
::(findstr /ic:"Dell Inc." >nul && echo. & echo success & echo. & goto :dell_setup & goto :eof) || (echo. & echo error & echo. & echo unable to fetch device info for device setup & pause & goto :eof)
::else if
::(findstr /ic:"HP" >nul && echo. & echo success & echo. & goto :hp_setup & goto :eof) || (echo. & echo error & echo. & echo unable to fetch device info for device setup & pause & goto :eof)
::else if
::(findstr /ic:"Lenovo" >nul && echo. & echo success & echo. & goto :lenovo_setup & goto :eof) || (echo. & echo error & echo. & echo unable to fetch device info for device setup & pause & goto :eof)
::else
::	if %errorlevel% equ 0 (
::echo.
::echo success
::	echo.
::	goto :%manufacturer%_setup
::goto :eof
::	) else if (
::		echo.
::		echo success
::		echo.
::		goto :%manufacturer%_setup
::		goto :eof
::	) else if %%==(
::		echo.
::		echo success
::		echo.
::		goto :%manufacturer%_setup
::		goto :eof
::	) else (
::		echo.
::		echo error
::		echo.
::		echo unable to fetch device info for device setup
::		pause
::		goto :eof
::	)
::)
::goto :eof
:::hp_setup
::winget install 9WZDNCRFHWLH 9P4PNDG7L782 9MTKLT3PWWN1 9MTKS9PR7R3N 9PHBC65ZG12V
::if %errorlevel% equ 0 (
::	echo.
::	echo success
::	echo.
::	goto :eof
::) else (
::	echo error
::	echo.
::	echo unable to install winget
::	pause
::	goto :eof
::)
:::dell_setup
::winget install Dell.CommandUpdate 9PPRLNT023WC XP9B49CJ91XF01
::if %errorlevel% equ 0 (
::	echo.
::echo success
::echo.
::goto :eof
::) else (
::	echo error
::	echo.
::	echo unable to install winget
::	pause
::	goto :eof
::)
:::lenovo_setup
::winget install 9WZDNCRFJ4MV 9N6PGT5DKQFQ XP8JRF5SXV03ZM
::if %errorlevel% equ 0 (
::	echo.
::	echo success
::	echo.
::	goto :eof
::) else (
::	echo error
::	echo.
::	echo unable to install lenovo packet
::	pause
::	goto :eof
::)

:: =============================
:: diagnostics section
:: =============================
:diags
echo running diags
start %driveletter%\win\_nicks_favs\diags.lnk
goto :eof
:defrag_suite
echo running defrag bananza
call :defrag1 & call :timeout & call :defrag2
goto :eof
:defrag1
start cmd.exe /c (defrag c: /u /x /v)
pause
start cmd.exe /c (defrag c: /o /l /g)
goto :eof
:defrag2
start cmd.exe /c (defrag c: /o /l /g)
goto :eof
:perfmon_suite
echo running perfmon
start cmd.exe /c (perfmon /report)
goto :eof
:sfc
echo running sfc /scannow command in terminal
start cmd.exe /c (sfc /scannow)
goto :eof
:mdsched
echo running mdsched command in terminal
start cmd.exe /c (mdsched)
goto :eof


:: =============================
:: dism section
:: =============================
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
dism /cleanup-mountpoints
goto :eof

::test eject code
:eject
diskpart &
::set /p list_disk=
::echo
::list disk
list volume
set /p volume_entry= || set confirm=1
if %confirm%==1 goto :eof
pause>null
echo pick volume entry number:
select volume %volume_entry% & ::ove all dismount

:: =============================
:: exit code
:: =============================
:exit
echo exiting application
call :restore_enable & call :10 & call :quick_save_exit & call :1440 & call :recycle_empty & echo deleting temp files & call :temp_clean & echo cleaning mount points & call :mount & call :chkdsk_loop_off & call :powercfg_ds 
call :self_delete_setup & exit

:self_delete_setup
set local enabledelayedexpansion
set cleanup_file=cleanup_new.bat
set driveletter=%~d0
if exist "%cleanup_file%" del %cleanup_file%
call :createselfdeletingbat "%cleanup_file%"
goto :eof

:createselfdeletingbat
::set driveletter=%~d0
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
::exit

:: =============================
:: network section
:: =============================
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
ping -n 10 -l 500 8.8.8.8
goto :eof
:network_reset
echo resetting network adapters, connections, and firewall:
::call :wifi_disable & call :wifi_enable &
ipconfig /release & ipconfig /flushdns & ipconfig /renew & netsh winsock reset & netsh interface ipv4 reset & netsh interface ipv6 reset & netsh winsock reset catalog & netsh int ipv4 reset reset.log & netsh int ipv6 reset reset.log & netsh int ip reset & ren c:\windows\softwaredistribution softwaredistribution.old & ren c:\windows\system32\catroot2 catroot2.old
echo network reset complete
goto :eof
:network_reset_suite
call :network_reset & call :firewall_reset & call :ping
goto :eof
:wifi_pwd
echo enter wifi name... enter to cancel
set /p wifi_name= || set wifi_name=cancel
if %wifi_name%==cancel goto :eof
netsh wlan show profiles name=%wifi_name% key=clear | findstr /r "^....SSID Name, Key Content"
pause>null
echo.
echo %subdivider1%
echo 	export report?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :export_report
if %confirm%==2 goto :eof
pause>null
:export_report
cls
echo.
echo generating and exporting %wifi_name% wifi password report...
netsh wlan show profile %wifi_name% key=clear | findstr /r "^....SSID Name, Key Content"
echo.
echo exporting wifi credentials...
netsh wlan show profile %wifi_name% key=clear | findstr /r "^....SSID Name, Key Content" > C:\Users\Public\Desktop\%wifi_name%.txt
echo.
echo 	wifi credentials has been saved to "%wifi_name%.txt"
echo %subdivider1%
echo 	open the file?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :open_file
if %confirm%==2 goto :eof
pause>null
:open_file
start "" C:\Users\Public\Desktop\%wifi_name%.txt
goto :eof
pause>null
:wifi_report
echo generating wifi connection report
netsh wlan show wlanreport
echo %subdivider1%
echo copy the report to the computer desktop?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :export_report
if %confirm%==2 goto :export_report_declined
pause>null
:export_report
echo copying report to public desktop
copy C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html C:\Users\Public\Desktop\
echo %subdivider1%
echo open the report?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :open_report
if %confirm%==2 goto :eof
pause>null
:export_report_declined
echo report can be found at: C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html
pause>null
goto :eof
:open_report
start "" "C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html"
goto :eof
pause>null
:wifi_enable
netsh interface set interface name="WiFi" admin=enable
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  set custom_failure_msg=unable to enable wifi
  call :error_failure %custom_failure_msg%
  goto :eof
)
:wifi_disable
netsh interface set interface name="WiFi" admin=disabled
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :wifi_disable
)

:: =============================
:: nick_favs section
:: =============================
:av_blast_nf
call :solitaire
pause>null
echo running mrt command in terminal: & call :mrt & call :npe
echo starting full windows security scan: & call :winsec_full
goto :eof
:diags_nf
echo starting nicks's diags selection
call :sysinfo & call :timeout & call :perfmon_suite & call :disk_wiz_nf
goto :eof
:disk_wiz_nf
echo starting disk wiz selection
call :dxdiag & call :timeout & call :chkdsk_online & call :chkdsk_offline & call :timeout & dfrgui & call :timeout & call :defrag1 & call :timeout & call :sfc & call :timeout & call :check & call :scan & call :restore & call :mount
goto :eof
:new_setup_nf
echo starting new setup suite: & echo %subdivider2% & call :restore_enable & call :shadow_size_5 & call :10 & call :quick_save & call :1440 & call :gs_support & start "" %driveletter%\win\device_tools\user_accounts.lnk & call :network_reset_suite & call :timeout & call :revo & call :timeout & call :updates_win_nf & call :winsec_suite & call :timeout & call :winget_pchealth & call :winget_update & start ms-settings:storagesense & call :timeout & call :powercfg_ds & call :bde_off_c & echo blue screen section: & call :bsod_on & echo numlock section & call :numlock_on & call :s_mode_reg_0 & echo %subdivider2% & goto :eof
:nukem_nf
echo nuke it
call :new_setup_nf & start %driveletter%\win\device_tools\user_accounts.lnk & call :timeout & call :av_blast_nf & call :timeout & appwiz.cpl & call :timeout & netplwiz & call :timeout & start %driveletter%\win\device_tools\Startup.lnk & call :timeout & start %driveletter%\win\utilities\file_management\file-association-fix.lnk & call :timeout & start %driveletter%\win\utilities\services_management\restore-default-services.lnk & call :timeout & call :diags_nf & call :network_reset_suite & call :timeout & call :temp_clean_plus
goto :eof
:temp_clean
del /q/f/s %TEMP%\* & del /s/q c:\windows\temp\* & del /q/f/s c:\windows\softwaredistribution\download\*
goto :eof
:temp_clean_plus
echo running temp file cleaning suite
cleanmgr /verylowdisk & del /q/f/s %TEMP%\* & del /s/q c:\windows\temp\* & del /q/f/s c:\windows\softwaredistribution\download\*
goto :eof
:recycle_empty
echo emptying recycle bins for all drives
powershell -command "clear-recyclebin -force"
goto :eof
:titustech
powershell -command "irm https://github.com/ChrisTitusTech/winutil/releases/latest/download/winutil.ps1 | iex"
goto :eof
:updates_full_nf
echo starting updates suite
call :updates_win_nf & call :winsec_update
goto :eof
:updates_win_nf
echo running windows updates
usoclient startinteractivescan
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :updates_win_nf
)
:updates_reset
echo resetting windows update service:
net stop bits & net stop wuauserv & net stop appidsvc & net stop cryptsvc & ren c:\\windows\\softwaredistribution softwaredistribution.old & ren c:\\windows\\system32\\catroot2 catroot2.old & net start bits & net start wuauserv & net start appidsvc & net start cryptsvc
goto :eof
:gs_support
copy "%driveletter%\win\installers\support\Geek Squad Support.exe" C:\Users\Public\Desktop
goto :eof
:revo
start "" %driveletter%\win\uninstallers\revo_uninstaller\RevoUPort.exe
goto :eof
:notepad
start "" %driveletter%\win\utilities\windows_tools\misc\notepad++\notepad++.exe
goto :eof
:bell
powershell -command "[console]::beep(800,200); [console]::beep(800,200); [console]::beep(800,200)"
goto :eof
:upgrade
set upgradeversion=
curl -s https://www.apple.com/ > c:\temp.txt
findstr /i "visuallyhidden" c:\temp.txt > nul > c:\target.txt
if %upgradeversion%>=%appversion% (
  echo hey upgrade available!
  echo %appversion% < %upgradeversion%
  echo go to https:// to download newest version
  ) else (
  goto :eof
)
pause
goto :eof

:: =============================
:: power section
:: =============================
:restart
echo intitiating device restart
echo.
echo %subdivider1%
echo 	restart device?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :restart_confirm
if %confirm%==2 goto :eof
pause>null
:restart_confirm
echo restarting device
shutdown /g /f /t 0
goto :eof
:shutdown
echo shutting down device
echo.
echo %subdivider1%
echo 	shut down device?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :shutdown_confirm
if %confirm%==2 goto :eof
pause>null
:shutdown_confirm
echo shutting down device
shutdown /s /f /t 0
goto :eof
:bios
echo restarting to bios
echo.
echo %subdivider1%
echo 	restart device?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :bios_confirm
if %confirm%==2 goto :eof
pause>null
:bios_confirm
echo restarting to device bios
shutdown /r /fw
goto :eof
:recovery
pause
echo.
echo %subdivider1%
echo 	restart to recovery partition?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :recovery_confirm
if %confirm%==2 goto :eof
pause>null
:recovery_confirm
echo restarting to recovery partition
shutdown /r /o /t 0
goto :eof
:powercfg_ds
powercfg /h off
goto :eof
:powercfg_e
echo generating powercfg energy report
powercfg /energy
echo.
echo %subdivider3%
echo	open report?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider3%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :energyreport_confirm
if %confirm%==2 goto :eof
pause>null
:energyreport_confirm
start "" C:\Windows\System32\energy-report.html
goto :eof
:powercfg_br
echo generating powercfg battery report
powercfg /batteryreport
echo.
echo %subdivider3%
echo	open report?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider3%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :batteryreport_confirm
if %confirm%==2 goto :eof
pause>null
:batteryreport_confirm
start "" C:\Windows\System32\battery-report.html
goto :eof

:: =============================
:: save point section
:: =============================
:quick_save
set /p restore_point_name=name for your restore point: || set restore_point_name=%date%-%time%
echo creating restore point: %restore_point_name%
powershell -Command "& {$var='%restore_point_name%'; checkpoint-computer -description "$var" -restorepointtype "MODIFY_SETTINGS"}"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :restore_setup
)
:quick_save_exit
echo creating restore point: %date%-%time%
powershell -Command "& {$var='%date%-%time%'; checkpoint-computer -description "$var" -restorepointtype "MODIFY_SETTINGS"}"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :restore_setup
)
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
:custom_time
echo setting custom time interval for restore point creation
set /p custom_interval=custom interval: || set custom_interval=1440
powershell -command "& {$custom_interval='%custom_interval%'; set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' -name 'SystemRestorePointCreationFrequency' -value $custom_interval}"
goto :eof
:restore_setup
echo enable / disable restore point creation on drive c:\
echo.
echo %subdivider1%
echo 	enable restore point creation?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=1
if %confirm%==1 goto :restore_enable
if %confirm%==2 goto :restore_disable
pause>null
:restore_enable
echo %subdivider2%
echo enable restore point creation on drive c:\
echo enabling restore point creation
powershell -command "enable-computerrestore -drive 'c:\'"
echo %subdivider2%
goto :eof
:restore_disable
echo %subdivider2%
echo disable restore point creation on drive c:\
echo enabling restore point creation
powershell -command "disable-computerrestore -drive 'c:\'"
echo %subdivider2%
goto :eof
:shadow_size
echo enter shadow storage percentage size:
echo enter custom or return for 5%%
echo %subdivider1%
echo 	shadow storage size
echo 	custom ................ [1]
echo 	nick's preferred ...... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :shadow_size_custom
if %confirm%==2 goto :shadow_size_5
:shadow_size_custom
echo %subdivider2%
echo enter custom shadow storage percentage:
set /p maxsize=type option:
echo setting storage size to %maxsize% percent total storage space...
vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=%maxsize%%%
echo %subdivider2%
if %errorlevel% equ 0 (
  goto :eof
  ) else (
echo %subdivider2%
  echo setting storage size to 10gb...
  vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=10gb
echo %subdivider2%
  goto :eof
)
:shadow_size_5
echo %subdivider2%
echo setting storage size to 5%% total storage space...
set maxsize=5%%
vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=%maxsize%
echo %subdivider2%
if %errorlevel% equ 0 (
  goto :eof
  ) else (
echo %subdivider2%
  echo setting storage size to 10gb...
  vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=10gb
echo %subdivider2%
  goto :eof
)

:: =============================
:: system info section
:: =============================
:sysinfo
echo gathering system information
call :systeminfo & call :serialnumber & call :bcdedit
goto :eof
:systeminfo
echo running system info command in terminal
systeminfo & systeminfo > c:\systeminfo.txt
goto :eof
:serialnumber
echo running serial number command in terminal
wmic bios get serialnumber & wmic /output:c:\serial_number.txt bios get serialnumber
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :wmic_install
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

:: =============================
:: system_mgmt section
:: =============================
:start_menu_reset
echo resetting start menu icons
regsvr32 /i shell32.dll
goto :eof
:sc_config
sc config trustedinstaller start=auto & sc config wlansvc start=auto & net start trustedinstaller & net start wlansvc
goto :eof
:timeout
timeout /t 10 /nobreak
goto :eof

:: s-mode section
:: ========================
:s_mode_suite
echo initiating s-mode enable or disable...
call :s_mode_query
pause>null
echo.
echo %subdivider1%
echo 	enable / disable s-mode on device...
echo 	enable ................... [1]
echo 	disable .................. [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :s_mode_reg_1
if %confirm%==2 goto :s_mode_reg_0
pause>null
:s_mode_reg_0
echo setting SkuPolicyRequired to 0
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
	echo failed to set windows s-mode registry value
	echo %subdivider2%
)
echo disabled windows s-mode registry value
echo %subdivider2%
pause
goto :eof
:s_mode_reg_1
echo setting SkuPolicyRequired to 1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
	echo failed to set windows s-mode registry value
	echo %subdivider2%
)
echo enabled windows s-mode registry value
echo %subdivider2%
pause
goto :eof
:s_mode_query
call :s_mode__reg_query
echo current registry value for initialkeyboardindicators in HKCU = %smodevalue%
goto :eof
:s_mode__reg_query
echo checking numlock value...
reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve windows s-mode registry value
  goto :eof
)
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired') do set smodevalue=%%A
goto :eof

:: ========================
:: numlock section
:numlock_suite
echo initiating numlock on startup enable or disable...
call :numlock_query
pause>null
echo.
echo %subdivider1%
echo 	numlock on startup...
echo 	enable ................... [1]
echo 	disable .................. [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :numlock_on
if %confirm%==2 goto :numlock_off
pause>null
:numlock_on
echo enabling numlock on startup...
call :numlock_add_cu
call :numlock_add_default
call :numlock_query
echo enabled numlock on startup
goto :eof
:numlock_off
echo disabling numlock on startup...
call :numlock_add_cu
call :numlock_add_default
call :numlock_query
echo enabled numlock on startup
goto :eof

:: ============================
:: numlock add section
:numlock_add_cu
echo enabling numlock on startup for current user...
reg add "HKEY_CURRENT_USER\control panel\keyboard" /v initialkeyboardindicators /t REG_DWORD /d 2 /f
if %errorlevel% neq 0 (
  echo failed to set bsod registry value
  goto :eof
)
echo enabled numlock on startup for current user
goto :eof
:numlock_add_default
echo enabling numlock on startup for default...
reg add "HKEY_USERS\.DEFAULT\control panel\keyboard" /v initialkeyboardindicators /t REG_DWORD /d 2 /f
if %errorlevel% neq 0 (
  echo failed to set bsod registry value
  goto :eof
)
echo enabled numlock on startup for default
goto :eof

:: ============================
:: numlock remove section
:numlock_remove_cu
echo enabling numlock for current user...
reg add "HKEY_CURRENT_USER\control panel\keyboard" /v initialkeyboardindicators /t REG_DWORD /d 1 /f
goto :eof
:numlock_remove_default
echo enabling numlock for default...
reg add "HKEY_USERS\.DEFAULT\control panel\keyboard" /v initialkeyboardindicators /t REG_DWORD /d 1 /f
goto :eof

:: ==========================================
:: numlock query section
:numlock_query
call :numlock_reg_query_cu
echo current registry value for initialkeyboardindicators in HKCU = %numlockvalue_cu%
call :numlock_reg_query_default
echo current registry value for initialkeyboardindicators in HKDefault = %numlockvalue_d%
goto :eof
:numlock_reg_query_cu
echo checking numlock value...
reg query "HKEY_CURRENT_USER\control panel\keyboard" /v initialkeyboardindicators > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve numlock registry value
  goto :eof
)
for /f "tokens=3" %%A in ('reg query "HKEY_CURRENT_USER\control panel\keyboard" /v initialkeyboardindicators') do set numlockvalue_cu=%%A
goto :eof
:numlock_reg_query_default
echo checking numlock value...
reg query "HKEY_USERS\.DEFAULT\control panel\keyboard" /v initialkeyboardindicators > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve numlock registry value
  goto :eof
)
for /f "tokens=3" %%A in ('reg query "HKEY_CURRENT_USER\control panel\keyboard" /v initialkeyboardindicators') do set numlockvalue_d=%%A
goto :eof

:: ============================
:: blue screen of death section
:bsod_suite
echo initiating blue screen of death enable or disable...
call :bsod_reg_query
pause>null
echo.
echo %subdivider1%
echo 	detailed blue screen of death...
echo 	enable ................... [1]
echo 	disable .................. [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :bsod_on
if %confirm%==2 goto :bsod_off
echo press any key to continue...
pause>null
:bsod_on
echo %subdivider2%
echo enabling detailed blue screen of death...
call :bsod_de_add
call :bsod_dp_add
echo enabled detailed blue screen of death
echo %subdivider2%
goto :eof
:bsod_off
echo %subdivider2%
echo disabling detailed blue screen of death
call :bsod_de_remove
echo %subdivider2%
call :bsod_dp_remove
echo disabled detailed blue screen of death
echo %subdivider2%
goto :eof

:: ===================================
:: bsod add section 
:bsod_de_add
echo %subdivider2%
echo enabling bsod emoticon parameters...
echo setting DisableEmoticon to 1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisableEmoticon /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  echo failed to set bsod registry values
echo %subdivider2%
  goto :eof
)
echo enabled bsod display parameters
echo %subdivider2%
goto :eof
:bsod_dp_add
echo %subdivider2%
echo enabling bsod display parameters...
echo setting DisplayParameters to 1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisplayParameters /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  echo failed to set bsod registry values
echo %subdivider2%
  goto :eof
)
echo enabled bsod display parameters
echo %subdivider2%
goto :eof

:: ============================
:: bsod remove section
:bsod_de_remove
echo %subdivider1%
echo disabling bsod emoticon parameters...
echo setting DisableEmoticon and DisplayParameters to 0
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisableEmoticon /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
  echo failed to set bsod registry values
echo %subdivider1%
  goto :eof
)
echo disabled bsod display parameters
echo %subdivider1%
goto :eof
:bsod_dp_remove
echo %subdivider1%
echo disabling bsod emoticon parameters...
echo setting DisableEmoticon and DisplayParameters to 0
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisplayParameters /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
  echo failed to set bsod registry values
echo %subdivider1%
  goto :eof
)
echo disabled bsod display parameters
echo %subdivider1%
goto :eof

:: =================================
:: bsod query section
:bsod_reg_query
echo %subdivider1%
call :bs_display_reg_query
echo current registry value for DisplayParameters = %displayvalue%
call :bs_emoticon_reg_query
echo current registry value for DisableEmoticon = %emoticonvalue%
echo %subdivider1%
goto :eof
:bs_display_reg_query
echo %subdivider1%
echo checking bsod display parameters value...
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisplayParameters > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve bsod registry value
echo %subdivider1%
  goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisplayParameters') do set displayvalue=%%A
echo %subdivider1%
goto :eof
:bs_emoticon_reg_query
echo %subdivider1%
echo checking bsod display parameters value...
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisableEmoticon > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve bsod registry value
echo %subdivider1%
  goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisableEmoticon') do set emoticonvalue=%%A
echo %subdivider1%
goto :eof

:: =============================
:: winget section
:: =============================
:winget_list
echo.
echo.
winget list
goto :eof
:winget_pchealth
echo.
echo.
echo installing windows pc health check
start cmd.exe /c (winget install Microsoft.windowspchealthcheck)
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :winget_install
)
:winget_update
echo updating all possible winget entries
start cmd.exe /c (winget upgrade --all --silent --accept-package-agreements --accept-source-agreements --include-unknown)
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :winget_install
)
:winget_install
powershell -command "install-script -name winget-install -force"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :winget_install_v2
)
:winget_install_v2
powershell -command "Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile winget.msixbundle; Add-AppxPackage winget.msixbundle; Remove-Item winget.msixbundle"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  set custom_failure_msg=unable to install winget package manager
  call :error_fail %custom_failure_msg%
  goto :eof
)
:winget_search
set /p search_item=
winget search "%search_item%"
goto :eof
:winget_install_initial
echo enter winget entry to be installed:
set /p winget_input= || set winget_input=cancel
if %winget_input%==cancel goto :eof
winget search %winget_input%
::set entry_name= winget search %winget_input% | findstr /r "^....Name"
echo find what you were looking for?
echo 	%subdivider2%
echo 	continue .............. [1]
echo 	quit .................. [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :winget_install_proceed
if %confirm%==2 goto :eof
:winget_install_proceed
echo enter winget entry to be installed:
set /p winget_input= || set winget_input=cancel
if %winget_input%==cancel goto :eof
echo installing %entry_name%
winget install %winget_input%
goto :eof
:winget_install_input
echo enter winget entry(s) to be installed:
set /p winget_input= || set winget_input=cancel
if %winget_input%==cancel goto :eof
winget install %winget_input%
goto :eof
:winget_uninstall_input
echo enter winget entry to be uninstalled:
set /p winget_input= || set winget_input=cancel
if %winget_input%==cancel goto :eof
winget uninstall %winget_input%
goto :eof
:winget_options
echo listing popular installers
echo adobe: 			adobe.acrobat.reader.64-bit
echo google chome: 		google.chrome
echo google drive: 		google.googledrive
echo firefox:	 	mozilla.firefox
echo microsoft office: 	microsoft.office
echo spotify: 		spotify.spotify
echo vlc: 			videolan.vlc
echo zoom: 			zoom.zoom
goto :eof
:winget_pchealthcheck
winget install microsoft.windowspchealthcheck
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  set custom_failure_msg=unable to install windows pc health check
  call :error_fail %custom_failure_msg%
  goto :eof
)

::winsec section
:: ====================================================
:: winsec registry query section
:: =========================
:winsec_reg_suite
echo initiating windows security registry enable or disable...
call :winsec_reg_query_suite
pause>null
echo.
echo %subdivider1%
echo 	enable / disable s-mode on device...
echo 	enable ................... [1]
echo 	cancel ................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :winsec_reg_enable_suite
if %confirm%==2 goto :eof
pause>null
:winsec_reg_enable_suite
call :winsec_reg_enable
goto :eof

:: winsec query section
:: ============================
:winsec_reg_query_suite
call :winsec_reg_query_dasv
call :winsec_reg_query_davv
call :winsec_reg_query_dasvpv
call :winsec_reg_query_davpv
goto :eof
:winsec_reg_query_dasv
echo %subdivider1%
echo checking windows security DisableAntiSpyware registry values...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware > null 2>&1
if %errorlevel% neq 0 (
	echo failed to retrieve windows security registry value
	pause
	echo %subdivider1%
  	goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware') do set disableantispywarevalue=%%A
echo disableantispywarevalue=%disableantispywarevalue%
echo %subdivider1%
goto :eof
:winsec_reg_query_davv
echo %subdivider1%
echo checking windows security DisableAntiVirus registry values...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiVirus > null 2>&1
if %errorlevel% neq 0 (
	echo failed to retrieve windows security registry value
	pause
	echo %subdivider1%
  	goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiVirus') do set disableantivirusvalue=%%A
echo disableantivirusvalue=%disableantivirusvalue%
echo %subdivider1%
goto :eof
:winsec_reg_query_dasvpv
echo %subdivider1%
echo checking windows security DisableAntiSpyware policy registry values...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware > null 2>&1
if %errorlevel% neq 0 (
	echo failed to retrieve windows security registry value
	pause
	echo %subdivider1%
  	goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware') do set disableantispywarepolicyvalue=%%A
echo disableantispywarepolicyvalue=%disableantispywarepolicyvalue%
echo %subdivider1%
goto :eof
:winsec_reg_query_davpv
echo %subdivider1%
echo checking windows security DisableAntiSpyware policy registry values...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus > null 2>&1
if %errorlevel% neq 0 (
	echo failed to retrieve windows security registry value
	pause
	echo %subdivider1%
  	goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus') do set disableantiviruspolicyvalue=%%A
echo disableantiviruspolicyvalue=%disableantiviruspolicyvalue%
echo %subdivider1%
goto :eof

:: winsec registry enable section
:: ==================================
:winsec_reg_enable_suite
echo %subdivider1%
echo checking windows security registry value...
call :winsec_reg_query_suite
echo %subdivider2%
echo enabling windows security anti-spyware and anti-virus...
call :winsec_reg_enable
echo enabled windows security anti-spyware and anti-virus
echo %subdivider2%
echo checking windows security registry value...
call :winsec_reg_query_suite
goto :eof
:winsec_reg_enable
call :winsec_reg_spyware_enable
call :winsec_reg_av_enable
call :winsec_reg_spyware_policy_enable
call :winsec_reg_av_policy_enable
goto :eof
:winsec_reg_spyware_enable
echo %subdivider2%
::if "%disableantispywarevalue%"=="0x1"(
	::echo setting DisplayParameters to 1
	::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f
	::if %errorlevel% neq 0 (
	  ::echo failed to set bsod registry values
	::echo %subdivider2%
::pause
	  ::goto :eof
	::)
::pause
	::goto :eof
::)
echo setting DisableAntiSpyware to 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
	echo failed to set windows security registry values
	echo %subdivider2%
)
echo enabled windows security anti-spyware
echo %subdivider2%
pause
goto :eof
:winsec_reg_av_enable
echo %subdivider2%
echo setting DisableAntiVirus to 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
	echo failed to set windows security registry values
	echo %subdivider2%
)
echo enabled windows security anti-virus
echo %subdivider2%
pause
goto :eof
:winsec_reg_spyware_policy_enable
echo %subdivider2%
echo setting DisableAntiSpyware in policies to 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
	echo failed to set windows security registry values
	echo %subdivider2%
)
echo enabled windows security anti-virus
echo %subdivider2%
pause
goto :eof
:winsec_reg_av_policy_enable
echo %subdivider2%
echo setting DisableAntiVirus in policies to 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
	echo failed to set windows security registry values
	echo %subdivider2%
)
echo enabled windows security anti-virus
echo %subdivider2%
pause
goto :eof


:: regular winsec section
:: =========================
:winsec_quick
echo windows security quick scan
powershell -command "start-mpscan -scantype quick"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :winsec_enable
)
:winsec_full
echo windows security full scan
powershell -command "start-mpscan -scantype full"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :winsec_enable
)
:winsec_offline
echo windows security offline scan:
powershell -command "start-mpwdoscan"
goto :eof
:winsec_update
echo running windows security updates
powershell -command "update-mpsignature"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :winsec_enable
)

:winsec_reset
echo initiating windows security reset
echo.
powershell -command "get-appxpackage microsoft.sechealthui -allusers | reset-appxpackage"
echo reset app package
echo calling windows security registry value entry reset
call :winsec_reg_enable
echo recommendation is to restart computer
echo restart computer?
call :restart
goto :eof

:winsec_suite
call :winsec_enable
call :winsec_update
call :winsec_app_monitor
call :winsec_sample
goto :eof
:winsec_enable
echo setting up windows security
powershell -command "set-mppreference -disablerealtimemonitoring $false"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  set custom_error_msg=unable to initiate windows security
  call :error_fail %custom_failure_msg%
  goto :eof
)
:winsec_app_monitor
echo setting up windows app monitor
powershell -command "set-mppreference -puaprotection enabled"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :winsec_enable
)
:winsec_sample
echo setting up windows security automatic sample submission
powershell -command "set-mppreference -submitsamplesconsent sendallsamples"
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  call :error_retry
  goto :winsec_enable
)

:map
echo save point
echo		quick save
echo		10 minutes
echo		1 hour
echo		24 hours
echo		custom
echo		setup
echo av
echo	mrt
echo	npe
echo	rootkit
echo	stinger
echo	process killer
echo	solitaire
echo	windows security
echo device tools
echo	computer manager
echo	cmd.exe
echo	device manager
echo	event viewer
echo	start menu
echo	regedit
echo	users folder
echo utilities
echo	disk management
echo	file management
echo	hardware management
echo	network management
echo	services management
echo	system management
echo nick favs
echo	av blast
echo	diags
echo	disk wiz
echo	new setup suite
echo	nukem
echo	temp dump
echo	updates (windows + security)
echo un/install
echo	revo uninstaller
echo	winget

:: =============================
:: success message
:: =============================
:fail5
title %appname% %appvers% - %appstat% [Error]
color %erruicolor%
echo # %divider%
echo # %appname% %appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo # Invalid option! Please try again...
echo # %divider%
echo #
echo # Press any key to continue... (except power button lol)
pause>null
goto options

:: =============================
:: success message
:: =============================
:success
::color %ggc%
echo %green%
echo %divider%
echo.
echo 	success
echo.
echo %divider%
::color %uic%
echo %white%
goto :eof
pause>null

:: =============================
:: error message retry
:: =============================
:error_retry
::color %errc%
echo %red%
echo %divider%
echo.
echo 	error
echo.
echo 	retrying, please wait
echo.
echo %divider%
::color %uic%
echo %white%
goto :eof
pause>null

:: =============================
:: error message failure
:: =============================
:error_fail
::color %errc%
echo %red%
echo %divider%
echo.
echo 	error
echo 	%custom_failure_msg%
echo.
echo %divider%
::color %uic%
echo %white%
goto :eof
pause>null

rem =============================
rem program error
rem =============================
:error_program
del null
cls
title %appname% %appvers% - %appstat% [Error]
::color %erruicolor%
echo %red%
echo # %divider%
echo # %appname% %appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo # invalid option, please try again...
echo # %divider%
echo #
echo # press any key to continue... (except power button lol)
echo %white%
pause>null
goto home

call :error_retry
echo please try again after enabling wmic
goto :wmic_install
echo.
color %uic%
goto :eof
