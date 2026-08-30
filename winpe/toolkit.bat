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
set driveletter=%~d0
set drivepath=%driveletter%\
set appname=toolkit
set appversletter=v
set appversnum=2.0.1
set appvers=%appvers%%appversnum%
set dev=neek
set title=%appname% - %appvers%
set uic=f
set ggc=b
set infoc=b
set errc=c

set divider======================================================
set subdivider1=====================================
set subdivider2==============================
set subdivider3=======================

:: =============================
:: initial start page
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
goto main_menu

:: =============================
:: app menu
:: =============================
:main_menu
del null
title %title%
cls
::color %uicolor%
echo.
echo %divider%
echo 	stage 0 [prep] ................. [00]
echo 	stage 1 [clean] ................ [01]
echo 	stage 2 [de-bloat] ............. [02]
echo 	stage 3 [disinfect] ............ [03]
echo 	stage 4 [repair] ............... [04]
echo 	stage 5 [optimize] ............. [05]
echo 	stage 6 [manual tools] ......... [06]
echo %divider%
echo 	%subdivider1%
echo 	exit ........................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option: || set choice=9
if "%choice%"=="00" goto prep_menu
if "%choice%"=="01" goto clean_menu
if "%choice%"=="02" goto debloat_menu
if "%choice%"=="03" goto disinfect_menu
if "%choice%"=="04" goto repair_menu
if "%choice%"=="05" goto optimize_menu
if "%choice%"=="06" goto manual_tools_menu
if "%choice%"=="88" goto call_function
if "%choice%"=="9" goto new_setup_nf_start
if "%choice%"=="99" goto let_it_diag_start
if "%choice%"=="999" goto let_it_av_start
if "%choice%"=="9999" goto let_it_run
if "%choice%"=="0" goto exit
goto error_program
pause>null

:new_setup_nf_start
call :new_setup_nf
call :bell
pause>null
goto main_menu

:call_function
echo %subdivider1%
echo enter a function to call:
set /p user_function_input=
echo calling function %user_function_input%
call :%user_function_input%
echo %subdivider1%
echo 	call another function? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :call_function
if %confirm%==2 goto main_menu

:let_it_run
echo %subdivider1%
call :new_setup_nf
echo new setup suite complete, proceed for next function...
pause>null
echo %subdivider1%
call :let_it_diag
echo diag suite complete, proceed for next function...
pause>null
echo %subdivider1%
call :let_it_av
echo av suite complete, let_it_run function complete!
echo %subdivider1%
call :bell
pause>null
goto main_menu

:let_it_diag_start
call :let_it_diag
goto :main_menu
:let_it_diag
echo %subdivider1%
call :quick_save_exit
echo %subdivider1%
call :bde_off_c
echo %subdivider1%
call :perfmon_report
pause>null
echo %subdivider1%
call :serial_ps
echo %subdivider1%
call :chkdsk_loop_off
echo %subdivider1%
call :chkdsk_offline
echo %subdivider1%
call :dxdiag
pause>null
echo %subdivider1%
call :defrag
pause>null
echo %subdivider1%
call :optimize
pause>null
echo %subdivider1%
call :sfc_scannow
pause>null
echo %subdivider1%
call :mdsched
pause>null
echo %subdivider1%
call :restore
call :mount
echo %subdivider1%
pause>null
goto :eof

:let_it_av_start
call :let_it_av
goto :main_menu
:let_it_av
echo %subdivider1%
call :solitaire
pause>null
echo %subdivider1%
call :empty_bin
call :temp_clean_plus
echo %subdivider1%
call :start_run
pause>null
echo %subdivider1%
echo running appwiz.cpl command
appwiz.cpl
pause>null
echo %subdivider1%
echo running netplwiz command
netplwiz
pause>null
echo %subdivider1%
call :mrt
echo %subdivider1%
call :npe
pause>null
echo %subdivider1%
call :winsec_offine
echo %subdivider1%
pause>null
goto :eof

:: ===========================
:: 00 prep menu
:: ===========================
:prep_menu
del null
cls
echo.
echo 	prep menu:
echo.
echo %divider%
echo 	restore point .................. [01]
echo 	updates ........................ [02]
echo 	process killer ................. [03]
echo 	solitaire ...................... [04]
echo %divider%
echo 	%subdivider1%
echo 	home ........................... [9]
echo 	exit ........................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto save_point
if "%choice%"=="02" goto updates_submenu
if "%choice%"=="03" goto pk_start
if "%choice%"=="04" goto solitaire_start
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:pk_start
call :pk
goto prep_menu
:pk
echo %subdivider2%
start %driveletter%win\av\processkiller\ProcessKiller.exe
echo %subdivider2%
::pause>null
goto :eof
:solitaire_start
call :solitaire
goto prep_menu
:solitaire
echo %subdivider2%
start %driveletter%win\av\rkill\solitaire64.exe
echo %subdivider2%
::pause>null
goto :eof

:: ===================
:: updates sub menu
:: ===================
:updates_submenu
del null
cls
echo.
echo 	update options:
echo.
echo %divider%
echo 	windows updates ................ [01]
echo 	security updates ............... [02]
echo 	winget utility ................. [03]
echo 	reset utility .................. [04]
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto win_updates_start
if "%choice%"=="02" goto winsec_updates_start
if "%choice%"=="03" goto winget
if "%choice%"=="04" goto reset_submenu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:win_updates_start
echo %subdivider2%
call :updates_win_nf
echo %subdivider2%
::pause>null
goto updates_submenu
:winsec_updates_start
echo %subdivider2%
call :winsec_update
echo %subdivider2%
::pause>null
goto updates_submenu

:: ===========================
:: 01 clean menu
:: ===========================
:clean_menu
del null
cls
echo.
echo clean menu:
echo.
echo %divider%
echo 	temp clean ..................... [01]
echo 	temp clean+ .................... [02]
echo 	empty recycle bin .............. [03]
echo 	revo uninstaller ............... [04]
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto temp_clean_start
if "%choice%"=="02" goto temp_clean_plus_start
if "%choice%"=="03" goto empty_bin_start
if "%choice%"=="04" goto revo_start
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:temp_clean_start
call :temp_clean
goto clean_menu
:temp_clean
echo %subdivider2%
del /q/f/s %TEMP%\* & del /s/q c:\windows\temp\* & del /q/f/s c:\windows\softwaredistribution\download\*
echo %subdivider2%
pause>null
goto :eof
:temp_clean_plus_start
call :temp_clean_plus
goto clean_menu
:temp_clean_plus
echo %subdivider2%
echo running temp file cleaning suite
cleanmgr /verylowdisk & del /q/f/s %TEMP%\* & del /s/q c:\windows\temp\* & del /q/f/s c:\windows\softwaredistribution\download\*
echo %subdivider2%
::pause>null
goto :eof
:empty_bin_start
call :empty_bin
goto clean_menu
:empty_bin
echo %subdivider2%
echo emptying recycle bins for all drives
powershell -command "clear-recyclebin -force"
echo %subdivider2%
::pause>null
goto :eof
:revo_start
call :revo
goto clean_menu
:revo
echo %subdivider2%
start %driveletter%win\uninstallers\revo_uninstaller\RevoUPort.exe
echo %subdivider2%
::pause>null
goto :eof

:: ===========================
:: 02 debloat menu
:: ===========================
:debloat_menu
del null
cls
echo.
echo debloat menu:
echo.
echo %divider%
echo 	everything ..................... [01]
echo 	ooshutup ....................... [02]
echo 	titus win util ................. [03]
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto everything_start
if "%choice%"=="02" goto ooshutup_start
if "%choice%"=="03" goto titustech_start
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:everything_start
call :everything
goto debloat_menu
:everything
echo %subdivider2%
start %driveletter%win\utilities\system_management\everything\everything.exe
echo %subdivider2%
::pause>null
goto :eof
:ooshutup_start
call :ooshutup
goto debloat_menu
:ooshutup
echo %subdivider2%
start "" %driveletter%win\utilities\system_management\OOSU10.exe
echo %subdivider2%
::pause>null
goto :eof
:titustech_start
call :titustech
goto debloat_menu
:titustech
echo %subdivider2%
powershell -command "irm https://github.com/ChrisTitusTech/winutil/releases/latest/download/winutil.ps1 | iex"
echo %subdivider2%
::pause>null
goto :eof

:: ===========================
:: 03 disinfect menu
:: ===========================
:disinfect_menu
del null
cls
echo.
echo disinfect menu:
echo.
echo %divider%
echo 	mrt ............................ [01]
echo 	npe ............................ [02]
echo 	rootkit [mcafee ] .............. [03]
echo 	stinger [mcafee ] .............. [04]
echo 	tdsskiller ..................... [05]
echo 	malwarebytes ................... [06]
echo 	windows security menu .......... [07]
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto mrt_start
if "%choice%"=="02" goto npe_start
if "%choice%"=="03" goto rr_mcafee_start
if "%choice%"=="04" goto stinger_start
if "%choice%"=="05" goto tdsskiller_start
if "%choice%"=="06" goto mwb_start
if "%choice%"=="07" goto winsec_submenu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:mrt_start
call :mrt
goto disinfect_menu
:mrt
echo %subdivider2%
start cmd.exe /c (mrt)
echo %subdivider2%
::pause>null
goto :eof
:npe_start
call :npe
goto disinfect_menu
:npe
echo %subdivider2%
start %driveletter%win\av\NPE.exe
echo %subdivider2%
::pause>null
goto :eof
:rr_mcafee_start
call :rr_mcafee
goto disinfect_menu
:rr_mcafee
echo %subdivider2%
start %driveletter%win\av\mcafee\rootkitremover.exe
echo %subdivider2%
::pause>null
goto :eof
:stinger_start
call :stinger
goto disinfect_menu
:stinger
echo %subdivider2%
start %driveletter%win\av\mcafee\stinger64-epo\stinger.exe
echo %subdivider2%
::pause>null
goto :eof
:tdsskiller_start
call :tdsskiller
goto disinfect_menu
:tdsskiller
echo %subdivider2%
start %driveletter%win\av\tdsskiller.exe
echo %subdivider2%
::pause>null
goto :eof
:mwb_start
call :mwb
goto disinfect_menu
:mwb
echo %subdivider2%
start %driveletter%win\av\mwb\MBSetup.exe
echo %subdivider2%
::pause>null
goto :eof

:: ===========================
:: 04 repair menu
:: ===========================
:repair_menu
del null
cls
echo.
echo repair menu:
echo.
echo %divider%
echo 	registry mechanic .............. [01]
echo 	jv16 power tools ............... [02]
echo 	restore default services ....... [03]
echo 	services repair ................ [04]
echo 	hijack this .................... [05]
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto rm_start
if "%choice%"=="02" goto jv16_start
if "%choice%"=="03" goto rds_start
if "%choice%"=="04" goto services_repair_start
if "%choice%"=="05" goto hjt_start
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:rm_start
echo %subdivider2%
start "" %driveletter%win\utilities\services_management\rm_installer.exe
echo %subdivider2%
::pause>null
goto disinfect_menu
:jv16_start
echo %subdivider2%
start "" %driveletter%win\utilities\system_management\jv16pt_setup.exe
echo %subdivider2%
::pause>null
goto :eof
:rds_start
echo %subdivider2%
start "" %driveletter%win\utilities\services_management\restore-default-services.exe
echo %subdivider2%
::pause>null
goto disinfect_menu
:services_repair_start
echo %subdivider2%
start "" %driveletter%win\utilities\services_management\ServicesRepair_x64.exe
echo %subdivider2%
::pause>null
goto :eof
:hjt_start
call :hjt
goto clean_menu
:hjt
echo %subdivider2%
start %driveletter%win\av\hijack\HiJackThis.exe
echo %subdivider2%
::pause>null
goto :eof

:: =============================
:: 05 optimize menu
:: =============================
:optimize_menu
del null
cls
echo.
echo optimization menu:
echo.
echo %divider%
echo 	defrag ......................... [01]
echo 	decrypt ........................ [02]
echo 	bsod ........................... [03]
echo 	numlock ........................ [04]
echo 	s-mode ......................... [05]
echo 	admin profile .................. [06]
echo 	file ext ....................... [07]
echo 	unsupported cpu's w11 .......... [08]
echo 	admin prompt suite ............. [09]
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto defrag_opt_start
if "%choice%"=="02" goto decrypt_opt_start
if "%choice%"=="03" goto bsod_opt_start
if "%choice%"=="04" goto numlock_opt_start
if "%choice%"=="05" goto s_mode_opt_start
if "%choice%"=="06" goto admin_profile_suite_start
if "%choice%"=="08" goto unsupported_cpu_reg_suite_start
if "%choice%"=="09" goto admin_prompt_start_optmenu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:defrag_opt_start
call :defrag
pause>null
call :optimize
pause>null
goto optimize_menu
:decrypt_opt_start
echo %subdivider1%
call :bde_off
echo %subdivider1%
pause>null
goto optimize_menu
:bsod_opt_start
echo %subdivider1%
call :bsod_suite
echo %subdivider1%
pause>null
goto optimize_menu
:numlock_opt_start
echo %subdivider1%
call :numlock_suite
echo %subdivider1%
pause>null
goto optimize_menu
:file_ext_start
echo %subdivider1%
call :file_ext_suite
echo %subdivider1%
pause>null
goto optimize_menu
:admin_profile_suite_start
echo %subdivider1%
call :admin_profile_suite
echo %subdivider1%
pause>null
goto optimize_menu
:unsupported_cpu_reg_suite_start
echo %subdivider1%
call :unsupported_cpu_reg_suite
echo %subdivider1%
pause>null
goto optimize_menu
:admin_prompt_start_optmenu
call :admin_prompt_suite
goto optimize_menu

:sc_config
sc config trustedinstaller start=auto & sc config wlansvc start=auto & net start trustedinstaller & net start wlansvc
goto :eof

:: ===================================
:: time zone section
:: ===================================

:time_suite
call :time_zone_auto_set
call :location_services_enable
call :resync_time_date
goto :eof

:time_zone_auto_set
echo setting time zone to auto
powershell -command "set-itemproperty -path hklm:\system\currentcontrolset\services\tzautoupdate -name start -value 3"
goto :eof

:location_services_enable
echo enabling location services
powershell -command "set-itemproperty -path hklm:\software\microsoft\windows\currentversion\capabilityaccessmanager\consentstore\location -name value -value "allow""
goto :eof

:resync_time_date
echo resynchronizing time and date
powershell -command "net start w32time; w32tm /resync"
goto :eof

:: timeout
:: ========================
:timeout
timeout /t 10 /nobreak
goto :eof

:: s-mode section
:: ========================
:s_mode_opt_start
call :s_mode_suite
goto optimize_menu

:s_mode_suite
echo initiating s-mode enable or disable...
call :s_mode_query
pause>null
echo.
echo %subdivider1%
echo 	enable / disable s-mode on device?  (default will disable)
echo 	enable ................... [1]
echo 	disable .................. [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :s_mode_reg_1
if %confirm%==2 goto :s_mode_reg_0
:s_mode_reg_0
echo setting SkuPolicyRequired to 0 (disabling s-mode on device)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows s-mode registry value t0 "0"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo disabled windows s-mode registry value
echo %subdivider2%
goto :eof
:s_mode_reg_1
echo setting SkuPolicyRequired to 1 (enabling s-mode on device)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows s-mode registry value to "1"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled windows s-mode registry value
echo %subdivider2%
goto :eof
:s_mode_query
call :s_mode__reg_query
echo current registry value for initialkeyboardindicators in HKCU = %smodevalue%
goto :eof
:s_mode__reg_query
echo checking numlock value...
reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired > null 2>&1
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to retrieve windows s-mode registry value
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired') do set smodevalue=%%A
goto :eof

:: =======================
:: system settings section
:: =======================
:get_latest_updates
echo enabling system setting to get latest updates when available...
echo setting IsContinuousInnovationOptedIn, IsConvergedUpdateStackEnabled, and AllowMUUpdateService to 1 (enabling system setting on device)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v IsContinuousInnovationOptedIn /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v IsConvergedUpdateStackEnabled /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v AllowMUUpdateService /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows system setting registry value to "1"
  set custom_failure_msg=failed to set windows system setting registry value to "1"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled windows system setting to get latest updates when available
echo %subdivider2%
goto :eof

:nofify_restart
echo enabling system setting to notify user when update requires restart...
echo setting RestartNotificationsAllowed2 to 1 (enabling system setting on device)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v RestartNotificationsAllowed2 /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows system setting registry value to "1"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled windows system setting to notify user when update requires restart
echo %subdivider2%
goto :eof

:other_msft_products
echo enabling system setting to download other updates for microsoft products...
echo setting AllowMUUpdateService to 1 (enabling system setting on device)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v AllowMUUpdateService /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows system setting registry value to "1"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled windows system setting to download other updates for microsoft products
echo %subdivider2%
goto :eof

:: ========================
:: numlock section
:numlock_suite
echo initiating numlock on startup enable or disable...
call :numlock_query
pause>null
echo.
echo %subdivider1%
echo 	numlock on startup?  (default will enable)
echo 	enable ................... [1]
echo 	disable .................. [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=1
if %confirm%==1 goto :numlock_on
if %confirm%==2 goto :numlock_off
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
  set custom_failure_msg=failed to set numlock registry value
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled numlock on startup for current user
goto :eof
:numlock_add_default
echo enabling numlock on startup for default...
reg add "HKEY_USERS\.DEFAULT\control panel\keyboard" /v initialkeyboardindicators /t REG_DWORD /d 2 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set numlock registry value
  call :error_failure %custom_failure_msg%
  pause>null
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
  set custom_failure_msg=failed to retrieve numlock registry value
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
for /f "tokens=3" %%A in ('reg query "HKEY_CURRENT_USER\control panel\keyboard" /v initialkeyboardindicators') do set numlockvalue_cu=%%A
goto :eof
:numlock_reg_query_default
echo checking numlock value...
reg query "HKEY_USERS\.DEFAULT\control panel\keyboard" /v initialkeyboardindicators > null 2>&1
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to retrieve numlock registry value
  call :error_failure %custom_failure_msg%
  pause>null
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
echo 	enable / disable? (default will enable)
echo 	enable ................... [1]
echo 	disable .................. [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=1
if %confirm%==1 goto :bsod_on
if %confirm%==2 goto :bsod_off
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
  set custom_failure_msg=failed to set bsod registry value
  call :error_failure %custom_failure_msg%
  pause>null
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
  set custom_failure_msg=failed to set bsod registry value
  call :error_failure %custom_failure_msg%
  pause>null
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
  set custom_failure_msg=failed to set bsod registry value
  call :error_failure %custom_failure_msg%
  pause>null
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
  set custom_failure_msg=failed to set bsod registry value
  call :error_failure %custom_failure_msg%
  pause>null
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
  set custom_failure_msg=failed to retrieve bsod registry value
  call :error_failure %custom_failure_msg%
  pause>null
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
  set custom_failure_msg=failed to retrieve bsod registry value
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v DisableEmoticon') do set emoticonvalue=%%A
echo %subdivider1%
goto :eof

:: =========================
:: admin profile section
:admin_profile_suite
echo starting admin profile enable / disable suite...
pause>null
echo.
echo %subdivider1%
echo 	enable / disable? (default will disable)
echo 	enable ................... [1]
echo 	disable .................. [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :admin_profile_enable
if %confirm%==2 goto :admin_profile_disable
:admin_profile_enable_start
call :admin_profile_enable
goto :eof
:admin_profile_enable
net user administrator /active:yes
echo admin profile has been enabled...
pause>null
goto :eof
:admin_profile_disable_start
call :admin_profile_enable
goto :eof
:admin_profile_disable
net user administrator /active:no
echo admin profile has been disabled...
pause>null
goto :eof

:: ===========================
:: unsupported cpu section
:unsupported_cpu_reg_suite
echo initiating enabling unsupported cpus for windows 11 installation in registry...
call :unsupported_cpu_reg_query
call :unsupported_cpu_reg_add
goto :eof
:unsupported_cpu_reg_query
echo %subdivider1%
echo checking unsupported cpu's registry value...
reg query "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /v AllowUpgradesWithUnsupportedTPMOrCPU > null 2>&1
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to retrieve unsupported cpu registry value
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /v AllowUpgradesWithUnsupportedTPMOrCPU') do set emoticonvalue=%%A
echo %subdivider1%
goto :eof
:unsupported_cpu_reg_add
echo %subdivider2%
echo enabling unsupported cpus for windows 11 installation in registry...
echo setting DisplayParameters to 1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set unsupported cpu registry value
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled unsupported cpus for windows 11 installation in registry
echo %subdivider2%
goto :eof

:: =============================
:: 06 manual tools menu
:: =============================
:manual_tools_menu
del null
cls
echo.
echo manual tools menu:
echo.
echo %divider%
echo 	disk mgmt ...................... [01]
echo 	file mgmt ...................... [02]
echo 	hw mgmt ........................ [03]
echo 	network mgmt ................... [04]
echo 	system info .................... [05]
echo 	device tools ................... [06]
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto disk_mgmt
if "%choice%"=="02" goto file_mgmt
if "%choice%"=="03" goto hw_mgmt
if "%choice%"=="04" goto network
if "%choice%"=="05" goto system_info
if "%choice%"=="05" goto device_tools
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:: =============================
:: bde menu
:: =============================
:bde_submenu
del null
cls
echo.
echo manage-bde options:
echo.
echo %divider%
echo 	status (all drives) ............ [01]
echo 	status (one drives) ............ [02]
echo 	bde key ........................ [03]
echo 	bde off ........................ [04]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option: || set choice=5
if "%choice%"=="01" goto bde_status_all
if "%choice%"=="02" goto bde_status_input
if "%choice%"=="03" goto bde_key
if "%choice%"=="04" goto bde_off
if "%choice%"=="8" goto disk_mgmt
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:bde_status_all
echo %subdivider1%
echo checking bitlocker drive status for all mounted drives
manage-bde -status
echo %subdivider1%
pause>null
goto bde
:bde_status_input
echo %subdivider1%
echo enter drive letter:
set /p drive_input=enter letter A-Z... || set drive_input=1
if %drive_input%==1 goto :eof
echo checking bitlocker drive status for drive:
manage-bde -status %drive_input%:
echo %subdivider1%
pause>null
goto bde
:bde_key
echo %subdivider1%
echo enter drive letter: (enter for c:)
set /p drive_input=enter letter A-Z... || set drive_input=c
echo fetching bitlocker key for drive %drive_input%:
manage-bde -protectors %drive_input%: -get
echo %subdivider1%
pause>null
echo 	export key to txt file? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :export_bde_key
if %confirm%==2 goto bde_submenu
pause>null
:export_bde_key
echo.
echo generating and exporting %drive_input% key report to c: drive...
manage-bde -protectors %drive_input%: -get > C:\%drive_input%_bde_key.txt
echo.
echo 	%drive_input% key report has been saved to "c:\%drive_input%_bde_key.txt"
pause>null
echo 	open the file? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :open_key
if %confirm%==2 goto :bde_submenu
:open_key
echo opening %drive_input%_bde_key.txt
start "" C:\%drive_input%_bde_key.txt
pause>null
goto bde_submenu
:bde_off_start
call :bde_off
goto bde_submenu
:bde_off
echo %subdivider1%
echo enter drive letter... (enter for drive c:)
set /p drive_input=enter letter A-Z || set drive_input=c
echo turning off bitlocker for drive: %drive_input%:
manage-bde -off %drive_input%:
echo %subdivider1%
pause>null
goto :eof
:bde_off_c
echo %subdivider1%
echo turning off bitlocker for drive c:
manage-bde -off c:
echo %subdivider2%
echo checking bitlocker drive status for c drive
manage-bde -status c:
echo %subdivider2%
echo %subdivider1%
pause>null
goto :eof

:: =============================
:: chkdsk menu
:: =============================
:chkdsk_submenu
del null
cls
echo.
echo chkdsk options:
echo.
echo %divider%
echo 	online ......................... [01]
echo 	offline ........................ [02]
echo 	read only ...................... [03]
echo 	chkdsk loop check .............. [04]
echo 	chkdsk loop off ................ [05]
echo 	chkdsk lost and found .......... [06]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto chkdsk_online
if "%choice%"=="02" goto chkdsk_offline_start
if "%choice%"=="03" goto chkdsk_read_only
if "%choice%"=="04" goto chkdsk_loop_check
if "%choice%"=="05" goto chkdsk_loop_off_start
if "%choice%"=="06" goto chkdsk_fragments_start
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:chkdsk_online
echo %subdivider1%
echo running chkdsk online scan and fix...
echo enter disk letter... enter to run on c: drive
set /p chkdsk_letter= || set chkdsk_letter=c
chkdsk %chkdsk_letter%: /scan/forceofflinefix
echo %subdivider1%
pause>null
goto chkdsk_submenu
:chkdsk_offline_start
call :chkdsk_offline
goto chkdsk_submenu
:chkdsk_offline
echo %subdivider1%
echo enter disk letter... enter to run on c: drive
set /p chkdsk_letter= || set chkdsk_letter=c
echo running chkdsk offline scan and fix
chkdsk %chkdsk_letter%: /f/r/b/x/offlinescanandfix/spotfix
echo %subdivider1%
::pause>null
goto :eof
:chkdsk_read_only
echo %subdivider1%
echo running read only mode
chkdsk c:
echo %subdivider1%
pause>null
goto chkdsk_submenu
:chkdsk_loop_check
echo %subdivider1%
chkntfs c:
echo %subdivider1%
pause>null
goto chkdsk_submenu
:chkdsk_loop_off_start
call :chkdsk_loop_off
goto chkdsk_submenu
:chkdsk_loop_off
echo %subdivider1%
chkntfs /x c:
echo %subdivider1%
::pause>null
goto :eof
:chkdsk_fragments_start
echo %subdivider1%
call :chkdsk_fragments
echo %subdivider1%
::pause>null
goto chkdsk_submenu
:chkdsk_fragments
echo running chkdsk fragment search and rescue
echo %subdivider2%
echo cd to lost and found? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :chkdsk_lf
if %confirm%==2 goto :eof
::pause>null
:chkdsk_lf
echo cd'ing to lost and found...
cd FOUND.000
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :chkdsk_reveal
  ) else (
  set custom_failure_msg=unable to cd to lost and found folder on drive
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
:chkdsk_reveal
echo %subdivider2%
echo reveal file fragments? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :chkdsk_revealed
if %confirm%==2 goto :eof
pause>null
:chkdsk_revealed
echo %subdivider2%
attrib -r -s -h /s /d *.*
echo %subdivider2%
pause>null
echo recover file fragments? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :chkdsk_recover
if %confirm%==2 goto :eof
::pause>null
:chkdsk_recover
echo %subdivider2%
echo enter file name to recover: (enter to cancel)
set /p chk_file_input= || set chk_file_input=cancel
if %chk_file_input%==cancel goto :eof
echo enter file type to rename .chk files to: (i.e. jpg / doc / pdf) (enter to cancel)
set /p chk_type_input= || set chk_type_input=cancel
if %chk_type_input%==cancel goto :eof
echo renaming %chk_file_input%.chk to %chk_file_input%.%chk_type_input%...
ren %chk_file_input%.chk %chk_file_input%.%chk_type_input%
pause>null
goto :chkdsk_reveal

:: =============================
:: defrag menu
:: =============================
:defrag_submenu
del null
cls
echo.
echo dism options:
echo.
echo %divider%
echo 	defragment ..................... [01]
echo 	optmimize ...................... [02]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto defrag_start
if "%choice%"=="02" goto optmiize_start
if "%choice%"=="8" goto disk_mgmt
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:defrag_start
call :defrag
goto defrag_submenu
:defrag
echo %subdivider1%
start cmd.exe /c (defrag c: /u /x /v)
echo %subdivider1%
goto :eof
:optimize_start
call :optimize
goto defrag_submenu
:optimize
echo %subdivider1%
start cmd.exe /c (defrag c: /o /l /g)
echo %subdivider1%
goto :eof

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
echo 	computer mgr ................... [01]
echo 	cmd ............................ [02]
echo 	control panel .................. [03]
echo 	device mgr ..................... [04]
echo 	event vwr ...................... [05]
echo 	start menu ..................... [06]
echo 	regedit ........................ [07]
echo 	users folder ................... [08]
echo %divider%
echo %subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto comp_mgr
if "%choice%"=="02" goto cmd_start
if "%choice%"=="03" goto control_panel_start
if "%choice%"=="04" goto device_mgr
if "%choice%"=="05" goto event_vwr
if "%choice%"=="06" goto start_start
if "%choice%"=="07" goto regedit_start
if "%choice%"=="08" goto users_start
if "%choice%"=="8" goto manual_tools_menu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:comp_mgr_start
echo opening computer manager...
start cmd.exe /c (compmgmt)
goto device_tools
:cmd_start
echo cmd command: (enter to cancel)
set /p cmd_input= || set confirm=1
if %confirm%==1 goto device_tools
start cmd.exe /k "%cmd_input%"
pause>null
echo run another command? (enter to cancel)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :cmd_start
if %confirm%==2 goto :device_tools
:control_panel_start
echo opening control panel...
start cmd.exe /c (control)
::pause>null
goto device_tools
:device_mgr_start
echo opening device manager...
start cmd.exe /c (devmgmt)
::pause>null
goto device_tools
:event_vwr_start
echo opening event viewer...
start cmd.exe /c (eventvwr)
::pause>null
goto device_tools
:start_start
call :start_run
goto device_tools
:start_run
echo opening start menu in file explorer...
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"
::pause>null
goto :eof
:regedit_start
echo opening regedit...
start cmd.exe /c (regedit)
::pause>null
goto device_tools
:users_start
echo opening user folder in file explorer...
start "" "c:\Users\"
::pause>null
goto device_tools

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
echo 	chkdsk menu .................... [01]
echo 	bitlocker menu ................. [02]
echo 	defrag menu .................... [03]
echo 	dism menu ...................... [04]
echo 	sfc /scannow ................... [05]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto chkdsk_submenu
if "%choice%"=="02" goto bde_submenu
if "%choice%"=="03" goto defrag_submenu
if "%choice%"=="04" goto dism_submenu
if "%choice%"=="05" goto sfc_scannow_start
if "%choice%"=="8" goto manual_tools_menu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:sfc_scannow_start
call :sfc_scannow
goto disk_mgmt
:sfc_scannow
echo %subdivider1%
echo running sfc /scannow command in terminal
start cmd.exe /c (sfc /scannow)
echo %subdivider1%
::pause>null
goto :eof

:: =============================
:: dism menu
:: =============================
:dism_submenu
del null
cls
echo.
echo dism options:
echo.
echo %divider%
echo 	check health ................... [01]
echo 	scan health .................... [02]
echo 	restore health ................. [03]
echo 	mount points ................... [04]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto check
if "%choice%"=="02" goto scan
if "%choice%"=="03" goto restore_start
if "%choice%"=="04" goto mount_start
if "%choice%"=="8" goto disk_mgmt
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:check
echo %subdivider1%
echo running dism check health
start cmd.exe /c (dism /online /cleanup-image /checkhealth)
echo %subdivider1%
::pause>null
goto dism
:scan
echo %subdivider1%
echo running dism scan health
start cmd.exe /c (dism /online /cleanup-image /scanhealth)
echo %subdivider1%
::pause>null
goto dism
:restore_start
call :restore
goto dism
:restore
echo %subdivider1%
echo running dism restore health
start cmd.exe /c (dism /online /cleanup-image /restorehealth)
echo %subdivider1%
::pause>null
goto :eof
:mount_start
call :mount
goto dism
:mount
echo %subdivider1%
echo running dism cleanup mountpoints
dism /cleanup-mountpoints
echo %subdivider1%
::pause>null
goto :eof

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
echo 	file assc fix .................. [01]
echo 	reset file attr ................ [02]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto faf_start
if "%choice%"=="02" goto rfa_start
if "%choice%"=="8" goto manual_tools_menu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:rfa_start
call :rfa
goto file_mgmt
:rfa
echo %subdivider2%
start %driveletter%\win\utilities\file_management\reset-file-attributes.exe
echo %subdivider2%
::pause>null
goto file_mgmt
:faf_start
call :faf
goto file_mgmt
:faf
echo %subdivider2%
::call :titustech
start %driveletter%\win\utilities\file_management\file-association-fix.cmd
echo %subdivider2%
::pause>null
goto file_mgmt

:: =============================
:: hardware management menu
:: =============================
:hw_mgmt
del null
cls
echo.
echo file management:
echo.
echo %divider%
echo 	power .......................... [01]
echo 	perfmon ........................ [02]
echo 	mdsched ........................ [03]
echo 	power config ................... [04]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto power_menu
if "%choice%"=="02" goto perfmon_report_start
if "%choice%"=="03" goto mdsched_start
if "%choice%"=="04" goto powercfg
if "%choice%"=="8" goto manual_tools_menu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:perfmon_report_start
call :perfmon_report
goto hw_mgmt
:perfmon_report
echo %subdivider1%
echo running perfmon
start cmd.exe /c (perfmon /report)
echo %subdivider1%
goto :eof
:mdsched_start
call :mdsched
goto :hw_mgmt
:mdsched
echo %subdivider1%
echo running mdsched command in terminal
start cmd.exe /c (mdsched)
echo %subdivider1%
goto :eof

:: =============================
:: network menu
:: =============================
:network
del null
cls
echo.
echo network options:
echo.
echo %divider%
echo 	ping ........................... [01]
echo 	reset .......................... [02]
echo 	interfaces ..................... [03]
echo 	wifi report .................... [04]
echo 	known networks ................. [05]
echo 	known network info ............. [06]
echo 	wifi pwd ....................... [07]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto ping_packet_start
if "%choice%"=="02" goto net_reset_suite_start
if "%choice%"=="03" goto interfaces_start
if "%choice%"=="04" goto wifi_activity_report
if "%choice%"=="05" goto known_networks
if "%choice%"=="06" goto known_network_info_start
if "%choice%"=="07" goto wifi_pwd
if "%choice%"=="8" goto manual_tools_menu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:ping_packet_start
call :ping_packet
goto network
:ping_packet
echo %subdivider2%
echo testing internet connection
ping -n 10 -l 500 8.8.8.8
echo %subdivider2%
::pause>null
goto :eof
:net_reset_suite_start
call :net_reset_suite
goto network
:net_reset_suite
echo %subdivider1%
call :network_reset & call :firewall_reset & call :ping_packet
echo %subdivider1%
pause>null
goto :eof
:network_reset
echo %subdivider2%
echo resetting network adapters, connections, and firewall:
ipconfig /release & ipconfig /flushdns & ipconfig /renew & netsh winsock reset & netsh interface ipv4 reset & netsh interface ipv6 reset & netsh winsock reset catalog & netsh int ipv4 reset reset.log & netsh int ipv6 reset reset.log & netsh int ip reset & ren c:\windows\softwaredistribution softwaredistribution.old & ren c:\windows\system32\catroot2 catroot2.old
echo resetting windows firewall...
netsh advfirewall reset
echo restoring local firewall defaults...
powershell -command "(new-object -comobject hnetcfg.fwpolicy2).restorelocalfirewalldefaults()"
echo windows firewall settings restored to default
echo %subdivider2%
echo network reset complete
echo %subdivider2%
goto :eof
:firewall_reset
echo %subdivider2%
echo resetting windows firewall
netsh advfirewall reset & echo restoring local firewall defaults: & powershell -command "(new-object -comobject hnetcfg.fwpolicy2).restorelocalfirewalldefaults()"
echo windows firewall restored to default settings
echo %subdivider2%
goto :eof
:interfaces_start
call :interfaces
goto network
:interfaces
echo %subdivider2%
echo showing network adapters...
netsh interface show interface
echo %subdivider2%
pause>null
goto :eof
:wifi_activity_report
echo %subdivider1%
echo generating wifi connection report...
netsh wlan show wlanreport
echo %subdivider1%
echo copy the report to the computer desktop? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :export_report
if %confirm%==2 goto :export_report_declined
pause>null
:export_report
echo copying report to public desktop...
copy C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html C:\Users\Public\Desktop\
echo %subdivider1%
echo open the report? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :open_report
if %confirm%==2 goto network
::pause>null
:export_report_declined
echo report can be found at: C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html
pause>null
goto network
:open_report
echo opening latest wifi report
start "" "C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html"
echo %subdivider1%
pause>null
goto network
:known_networks
echo %subdivider1%
echo generating list of known wifi networks
netsh wlan show profiles | findstr /R /C:"[ ]:[ ]"
echo %subdivider1%
pause>null
goto network
:known_network_info_start
call :known_network_info
goto network
:known_network_info
echo %subdivider1%
echo enter wifi name... (enter to cancel)
set /p wifi_name= || set wifi_name=cancel
if %wifi_name%==cancel goto network
echo generating known wifi network info...
netsh wlan show profiles name=%wifi_name% key=clear
echo %subdivider1%
pause>null
goto :eof
:wifi_pwd
echo %subdivider1%
echo enter wifi name... (enter to cancel)
set /p wifi_name= || set wifi_name=cancel
if %wifi_name%==cancel goto network
echo %subdivider2%
netsh wlan show profiles name=%wifi_name% key=clear | findstr /r "^....SSID Name, Key Content"
echo %subdivider2%
pause>null
echo %subdivider1%
echo 	export report? to desktop? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :export_report
if %confirm%==2 goto network
::pause>null
echo %subdivider2%
:export_report
echo %subdivider2%
echo generating and exporting %wifi_name% wifi password report...
netsh wlan show profile %wifi_name% key=clear | findstr /r "^....SSID Name, Key Content" > C:\Users\Public\Desktop\%wifi_name%.txt
echo %subdivider2%
echo 	wifi credentials has been saved to "%wifi_name%.txt" on the device desktop
echo %subdivider1%
echo 	open the file? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :open_file
if %confirm%==2 goto network
::pause>null
:open_file
echo opening %wifi_name%.txt
start "" C:\Users\Public\Desktop\%wifi_name%.txt
pause>null
goto network

:wifi_enable
netsh interface set interface name="WiFi" admin=enable
if %errorlevel% equ 0 (
  call :success
  goto :network
  ) else (
  set custom_failure_msg=unable to enable wifi
  call :error_failure %custom_failure_msg%
  pause>null
  goto :network
)
:wifi_disable
netsh interface set interface name="WiFi" admin=disabled
if %errorlevel% equ 0 (
  call :success
  goto :network
  ) else (
  set custom_error_msg=unable to disable wifi
  call :error_fail %custom_failure_msg%
  pause>null
  goto :network
)

:: =============================
:: power menu
:: =============================
:power_menu
del null
cls
echo.
echo power options:
echo.
echo %divider%
echo 	restart ........................ [01]
echo 	shutdown ....................... [02]
echo 	bios ........................... [03]
echo 	recovery ....................... [04]
echo 	powercfg ....................... [05]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto restart
if "%choice%"=="02" goto shutdown
if "%choice%"=="03" goto bios
if "%choice%"=="04" goto recovery
if "%choice%"=="05" goto powercfg
if "%choice%"=="8" goto hw_mgmt
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:restart
echo %subdivider1%
echo 	intitiating device restart...
echo %subdivider1%
echo 	restart device? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :restart_confirm
if %confirm%==2 goto power_menu
::pause>null
:restart_confirm
echo restarting device...
shutdown /g /f /t 10
goto :quick_exit
:shutdown
echo shutting down device...
echo %subdivider1%
echo 	shut down device? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :shutdown_confirm
if %confirm%==2 goto power_menu
::pause>null
:shutdown_confirm
echo shutting down device...
shutdown /s /f /t 10
goto :quick_exit
:bios
echo restart to bios?
echo %subdivider1%
echo 	restart device? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :bios_confirm
if %confirm%==2 goto power_menu
::pause>null
:bios_confirm
echo 	restarting to device bios...
shutdown /r /fw
goto :quick_exit
:recovery
echo restart to recovery partition? (enter to cancel)
echo %subdivider1%
echo 	restart to recovery partition?
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :recovery_confirm
if %confirm%==2 goto power_menu
::pause>null
:recovery_confirm
echo restarting to recovery partition...
shutdown /r /o /t 10
goto :quick_exit

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
echo 	battery report ................. [01]
echo 	energy report .................. [02]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto powercfg_br
if "%choice%"=="02" goto powercfg_e
if "%choice%"=="8" goto hw_mgmt
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:powercfg_ds
echo %subdivider1%
echo turning off hibernate
powercfg /h off
echo %subdivider1%
goto :eof
:powercfg_e
echo %subdivider1%
echo generating powercfg energy report
powercfg /energy
echo %subdivider2%
echo copy the report to the computer desktop? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :export_pwrcfg_report
if %confirm%==2 goto :export_pwrcfg_report_declined
::pause>null
:export_pwrcfg_report
echo copying report to public desktop
copy C:\Windows\System32\energy-report.html C:\Users\Public\Desktop\
echo %subdivider1%
echo open the report? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :energyreport_confirm
if %confirm%==2 goto powercfg
::pause>null
:energyreport_confirm
start "" C:\Windows\System32\energy-report.html
goto powercfg
:export_report_declined
echo report can be found at: C:\Windows\System32\energy-report.html
pause>null
goto powercfg
:powercfg_br
echo %subdivider1%
echo generating powercfg battery report
powercfg /batteryreport
echo %subdivider2%
echo copy the report to the computer desktop? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :export_bat_report
if %confirm%==2 goto :export_bat_report_declined
::pause>null
:export_bat_report
echo copying report to public desktop
copy C:\Windows\System32\battery-report.html C:\Users\Public\Desktop\
echo %subdivider1%
echo open the report? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :batteryreport_confirm
if %confirm%==2 goto powercfg
::pause>null
:export_bat_report_declined
echo report can be found at: C:\Windows\System32\energy-report.html
pause>null
echo %subdivider1%
echo open the report? (enter to cancel)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :batteryreport_confirm
if %confirm%==2 goto powercfg
::pause>null
:batteryreport_confirm
start "" C:\Windows\System32\battery-report.html
goto powercfg

:: =============================
:: reset menu
:: =============================
:reset_submenu
del null
cls
echo.
echo reset menu:
echo.
echo %divider%
echo 	network reset .................. [01]
echo 	windows security reset ......... [02]
echo 	start menu reset ............... [03]
echo 	microsoft store reset .......... [04]
echo 	windows updates reset .......... [05]
echo 	file explorer reset ............ [06]
echo 	admin prompt reset ............. [07]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto network_reset_submenu_start
if "%choice%"=="02" goto winsec_reset_start
if "%choice%"=="03" goto start_menu_reset_start
if "%choice%"=="04" goto store_reset_start
if "%choice%"=="05" goto usoclient_reset_start
if "%choice%"=="06" goto fe_reset_start
if "%choice%"=="07" goto admin_prompt_start_resetmenu
if "%choice%"=="9" goto updates_submenu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:network_reset_submenu_start
call :network_reset
goto reset_submenu
:winsec_reset_submenu_start
echo %subdivider1%
call :winsec_reset
echo %subdivider1%
::pause>null
goto reset_submenu
:start_menu_reset_start
call :start_menu_reset
goto reset_submenu
:start_menu_reset
echo %subdivider1%
echo resetting start menu icons
regsvr32 /i shell32.dll
echo %subdivider1%
::pause>null
goto :eof
:store_reset_start
call :store_reset
goto reset_submenu
:store_reset
echo resetting microsoft store application with command wsreset.exe
wsreset.exe
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  goto :eof
  ) else (
  set custom_error_msg=unable to reset microsoft store application
  call :error_fail %custom_failure_msg%
  echo %subdivider1%
  goto :store_reset_v2
)
:store_reset_v2
echo attempting secondary microsoft store application reset method
powershell -command "get-appxpackage -allusers *windowsstore* | remove-appxpackage; get-appxpackage -allusers *microsoft.windowsstore* | foreach {add-appxpackage -disabledevelopmentmode -register "$($_.installlocation)\appxmanifest.xml"}"
::powershell -command "get-appxpackage -allusers | foreach {add-appxpackage -disabledevelopmentmode -register "$($_.installlocation)\appxmanifest.xml"}"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  goto :eof
  ) else (
  set custom_error_msg=unable to reset microsoft store application
  call :error_fail %custom_failure_msg%
  echo %subdivider1%
  pause>null
  goto :reset_submenu
)
:usoclient_reset_start
call :usoclient_reset
goto reset_submenu
:usoclient_reset
echo %subdivider1%
echo resetting windows update service:
net stop bits & net stop wuauserv & net stop appidsvc & net stop cryptsvc & ren c:\\windows\\softwaredistribution softwaredistribution.old & ren c:\\windows\\system32\\catroot2 catroot2.old & net start bits & net start wuauserv & net start appidsvc & net start cryptsvc
echo %subdivider1%
::pause>null
:fe_reset_start
call :fe_reset
goto :reset_submenu
:fe_reset
echo restarting file explorer
taskkill /f /im explorer.exe & explorer.exe
goto :eof

:admin_prompt_start_resetmenu
call :admin_prompt_suite
goto :reset_submenu
:admin_prompt_suite
echo initiating admin approval enable or disable...
call :admin_prompt_query
pause>null
echo.
echo %subdivider1%
echo 	enable / disable admin approval on device?  (hit enter will set default)
echo 	default w/o pwd .......... [1]
echo 	admin w/ pwd ............. [2]
echo 	disable .................. [3]
echo %subdivider1%
set /p confirm=type option: || set confirm=1
if %confirm%==1 goto :admin_prompt_default_enable
if %confirm%==2 goto :admin_prompt_pwd_enable
if %confirm%==3 goto :admin_prompt_disable
::pause>null

:admin_prompt_query
call :consentpromptbehavior__reg_query
call :promptonsecuredesktop_reg_query
::echo %ConsentPromptBehaviorAdmin%
::echo %PromptOnSecureDesktop%
goto :eof

:consentpromptbehavior__reg_query
echo %subdivider1%
echo checking windows ConsentPromptBehaviorAdmin registry values...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve windows security registry value
  pause
  echo %subdivider1%
  goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin') do set ConsentPromptBehaviorAdmin=%%A
echo ConsentPromptBehaviorAdmin=%ConsentPromptBehaviorAdmin%
echo %subdivider1%
goto :eof
:promptonsecuredesktop_reg_query
echo %subdivider1%
echo checking windows PromptOnSecureDesktop registry values...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve windows security registry value
  pause
  echo %subdivider1%
  goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop') do set PromptOnSecureDesktop=%%A
echo PromptOnSecureDesktop=%PromptOnSecureDesktop%
echo %subdivider1%
goto :eof

:admin_prompt_default_enable
::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
::ConsentPromptBehaviorAdmin
::1
::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
::PromptOnSecureDesktop
::1
call :consentpromptbehavior_enable
call :promptonsecuredesktop_enable
goto :eof
:admin_prompt_pwd_enable
::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
::ConsentPromptBehaviorAdmin
::1
::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
::PromptOnSecureDesktop
::1
call :consentpromptbehavior_pwd_enable
call :promptonsecuredesktop_enable
goto :eof
:consentpromptbehavior_enable
echo setting ConsentPromptBehaviorAdmin to 5 (windows default admin approval setting)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows admin prompt registry value to "5"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled windows admin prompt
echo %subdivider2%
goto :eof
:consentpromptbehavior_pwd_enable
echo setting ConsentPromptBehaviorAdmin to 5 (windows default admin approval setting)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows admin prompt registry value to "1"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled windows admin prompt w/ pwd
echo %subdivider2%
goto :eof
:promptonsecuredesktop_enable
echo setting PromptOnSecureDesktop to 1 (windows default admin approval setting)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows admin prompt registry value to "1"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo enabled windows admin prompt
echo %subdivider2%
goto :eof

:admin_prompt_disable
::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
::ConsentPromptBehaviorAdmin
::0
::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
::PromptOnSecureDesktop
::0
call :consentpromptbehavior_disable
call :promptonsecuredesktop_disable
goto :eof
:consentpromptbehavior_disable
echo setting ConsentPromptBehaviorAdmin to 0 (disabling admin approval on device)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows admin prompt registry value to "0"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo disabled windows admin prompt
echo %subdivider2%
goto :eof
:promptonsecuredesktop_disable
echo setting PromptOnSecureDesktop to 0 (disabling admin approval on device)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
  set custom_failure_msg=failed to set windows admin prompt registry value to "0"
  call :error_failure %custom_failure_msg%
  pause>null
  goto :eof
)
echo disabled windows admin prompt
echo %subdivider2%
goto :eof

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
echo 	quick save ..................... [01]
echo 	10 minutes ..................... [02]
echo 	1 hour ......................... [03]
echo 	24 hours ....................... [04]
echo 	custom time .................... [05]
echo 	custom storage size ............ [06]
echo 	enable / disable ............... [07]
echo %divider%
echo 	%subdivider1%
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto quick_save_start
if "%choice%"=="02" goto 10_start
if "%choice%"=="03" goto 60_start
if "%choice%"=="04" goto 1440_start
if "%choice%"=="05" goto custom_time
if "%choice%"=="06" goto custom_size
if "%choice%"=="07" goto restore_setup_start
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:quick_save_start
call :quick_save
goto save_point
:quick_save
echo %subdivider1%
set /p restore_point_name=name for your restore point: || set restore_point_name=%date%-%time%
echo creating restore point: %restore_point_name%
powershell -Command "& {$var='%restore_point_name%'; checkpoint-computer -description "$var" -restorepointtype "MODIFY_SETTINGS"}"
echo %subdivider1%
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  goto :eof
  ) else (
  set custom_error_msg=unable to create restore point
  call :error_fail %custom_failure_msg%
  echo %subdivider1%
  goto :restore_setup
)
:quick_save_exit
echo %subdivider1%
echo creating restore point: %date%-%time%
powershell -Command "& {$var='%date%-%time%'; checkpoint-computer -description "$var" -restorepointtype "MODIFY_SETTINGS"}"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  set custom_error_msg=unable to create restore point
  call :error_fail %custom_failure_msg%
  echo %subdivider1%
  ::pause>null
  goto :restore_setup
)
:10_start
call :10
goto save_point
:10
echo setting time interval to 10 minutes
powershell -command "set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' -name 'SystemRestorePointCreationFrequency' -value 10"
::pause>null
goto :eof
:60_start
call :60
goto save_point
:60
echo setting time interval to 60 minutes
powershell -command "set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' -name 'SystemRestorePointCreationFrequency' -value 60"
::pause>null
goto :eof
:1440_start
call :1440
goto save_point
:1440
echo setting time interval to 24 hours
powershell -command "set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' -name 'SystemRestorePointCreationFrequency' -value 1440"
::pause>null
goto :eof
:custom_time_start
call :custom_time
goto save_point
:custom_time
echo setting custom time interval for restore point creation (set in minutes i.e. 60 for 1 hour)
set /p custom_interval=custom interval: || set custom_interval=1440
powershell -command "& {$custom_interval='%custom_interval%'; set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' -name 'SystemRestorePointCreationFrequency' -value $custom_interval}"
pause>null
goto :eof
:custom_size
echo %subdivider1%
echo 	create custom shadow storage percentage size? (enter to cancel)
echo 	proceed ............... [1]
echo 	cancel ................ [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :shadow_size_custom
if %confirm%==2 goto :eof
:shadow_size_custom
echo %subdivider2%
echo enter custom shadow storage percentage: (enter to cancel)
set /p maxsize=type option: || set maxsize=cancel
if %confirm%==cancel goto save_point
echo setting storage size to %maxsize%%% total storage space...
vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=%maxsize%%%
echo %subdivider2%
if %errorlevel% equ 0 (
  echo %subdivider1%
  ::pause>null
  goto save_point
  ) else (
  set custom_error_msg=unable to set custom size, now setting storage size to 10gb...
  call :error_fail %custom_failure_msg%
  vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=10gb
  echo %subdivider2%
  ::pause>null
  goto save_point
)
pause>null
goto save_point
:shadow_size_5
echo %subdivider2%
echo setting storage size to 5%% total storage space...
set maxsize=5%%
vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=%maxsize%
echo %subdivider2%
if %errorlevel% equ 0 (
  ::pause>null
  goto :eof
  ) else (
  set custom_error_msg=unable to set 5%%, now setting storage size to 10gb...
  call :error_fail %custom_failure_msg%
  vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=10gb
  echo %subdivider2%
  ::pause>null
  goto :eof
)
:restore_setup_start
call :restore_setup
goto save_point
:restore_setup
echo enable / disable restore point creation on drive c:
echo.
echo %subdivider1%
echo 	enable restore point creation? (default is enable)
echo 	yes ................... [1]
echo 	no .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=1
if %confirm%==1 goto :restore_enable
if %confirm%==2 goto :restore_disable
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
echo 	bcdedit ........................ [01]
echo 	diagnostics .................... [02]
echo 	manage-bde ..................... [03]
echo 	serial number .................. [04]
echo 	system info .................... [05]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto bcdedit_start
if "%choice%"=="02" goto diagnostics
if "%choice%"=="03" goto bde
if "%choice%"=="04" goto serialnumber_start
if "%choice%"=="05" goto systeminfo_start
if "%choice%"=="8" goto utilities
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:systeminfo_start
echo %subdivider1%
call :systeminfo
echo %subdivider1%
pause
goto system_info
:sysinfo
echo gathering system information
call :systeminfo & call :serialnumber & call :bcdedit
goto :eof
:systeminfo
echo running system info command in terminal and exporting to c:\systeminfo.txt
systeminfo & systeminfo > c:\systeminfo.txt
goto :eof
:serialnumber_start
echo %subdivider1%
call :serial_ps
echo %subdivider1%
::pause>nul
goto system_info
:serial_ps
::powershell -command "(get-ciminstance win32_bios).serialnumber"
for /f "delims=" %%A in ('powershell -command "(get-ciminstance win32_bios).serialnumber"') do set serialnum_ps=%%A
echo %serialnum_ps%
echo %serialnum_ps%> c:\serialnumber.txt
pause
goto :eof
:serialnumber
echo running serial number command in terminal and exporting to c:\serial.txt
wmic bios get serialnumber & wmic /output:c:\serial.txt bios get serialnumber
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  set custom_error_msg=please try again after enabling serial number in wmic
  call :error_fail %custom_failure_msg%
  goto :wmic_install
)
:wmic_install
echo setting up wmi for use
echo initializing serial number in wmic with command "dism /online /add-capability /capabilityname:wmic~~~~"
dism /online /add-capability /capabilityname:wmic~~~~
if %errorlevel% equ 0 (
  call :success
  goto :eof
  ) else (
  set custom_error_msg=please try again after enabling serial number in wmic
  call :error_fail %custom_failure_msg%
  goto :wmic_cleanup
)
:wmic_cleanup
echo cleaning up dism
echo reverting pending actions (restart device recommended after running)
dism /online /cleanup-image /revertpendingactions
echo starting component cleanup
dism /online /cleanup-image /startcomponentcleanup
goto :wmic_install
:bcdedit_start
echo %subdivider1%
call :bcdedit
echo %subdivider1%
::pause
goto system_info
:bcdedit
echo running bcdedit command in terminal
bcdedit > c:\bcdedit.txt
goto :eof
:dxdiag
echo running dxdiag command in terminal
dxdiag
goto :eof

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
echo 	list ........................... [01]
echo 	search ......................... [02]
echo 	install ........................ [03]
echo 	uninstall ...................... [04]
echo 	popular options ................ [05]
echo 	update all ..................... [06]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto winget_list_start
if "%choice%"=="02" goto winget_search_start
if "%choice%"=="03" goto winget_install_input_start
if "%choice%"=="04" goto winget_uninstall_input_start
if "%choice%"=="05" goto winget_options
if "%choice%"=="06" goto winget_update_start
if "%choice%"=="8" goto updates_submenu
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:winget_list_start
call :winget_list
goto :eof
:winget_list
echo %subdivider2%
echo listing winget entries sorted by name A-Z:
echo %subdivider3%
winget list | sort
echo %subdivider2%
pause>null
goto :eof
:winget_search_start
call :winget_search
goto :eof
:winget_search_start
echo %subdivider1%
echo enter search item:
set /p search_item=
winget search "%search_item%" | sort
echo %subdivider1%
pause>null
goto winget

:winget_install_input_start
call :winget_install_input
goto winget
:winget_install_input
echo %subdivider1%
echo enter winget entry(s) to be installed (enter to cancel)
set /p winget_input= || set winget_input=cancel
if %winget_input%==cancel goto winget
echo installing %winget_input%...
winget install %winget_input%
echo %subdivider1%
pause>null
echo install more? (enter to cancel)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :winget_install_input
if %confirm%==2 goto :winget

:winget_uninstall_input_start
echo %subdivider1%
echo list currently installed entries?
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :winget_uninstall_list_input
if %confirm%==2 goto :winget_uninstall_input

:winget_uninstall_list_input
call :winget_list
echo %subdivider2%
echo enter winget entry to be uninstalled (enter to cancel)
set /p winget_input= || set winget_input=cancel
if %winget_input%==cancel goto winget
echo uninstalling %winget_input%...
winget uninstall %winget_input%
echo %subdivider1%
pause>null
echo uninstall more? (enter to cancel)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :winget_uninstall_list_input
if %confirm%==2 goto :winget

:winget_uninstall_input
echo enter winget entry to be uninstalled (enter to cancel)
set /p winget_input= || set winget_input=cancel
if %winget_input%==cancel goto winget
echo uninstalling %winget_input%...
winget uninstall %winget_input%
echo %subdivider1%
pause>null
echo uninstall more? (enter to cancel)
echo 	%subdivider2%
echo 	yes ................... [1]
echo 	no .................... [2]
echo 	%subdivider2%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :winget_uninstall_input
if %confirm%==2 goto :winget

:winget_options
echo %subdivider1%
echo listing popular installers
echo adobe: 			adobe.acrobat.reader.64-bit
echo dropbox: 			dropbox.dropbox
echo google chome: 		google.chrome
echo google drive: 		google.googledrive
echo firefox:	 	mozilla.firefox
echo microsoft office: 	microsoft.office
echo microsoft onedrive: 	microsoft.onedrive
echo spotify: 		spotify.spotify
echo vlc: 			videolan.vlc
echo zoom: 			zoom.zoom
echo %subdivider1%
pause>null
goto winget
:winget_update_start
call :winget_update
goto winget
:winget_update
echo %subdivider1%
echo updating all possible winget entries
start cmd.exe /c (winget upgrade --all --silent --accept-package-agreements --accept-source-agreements --include-unknown)
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  call :error_retry
  echo %subdivider1%
  ::pause>null
  goto :winget_install
)
:winget_install
echo %subdivider1%
powershell -command "install-script -name winget-install -force"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  call :error_retry
  echo %subdivider1%
  ::pause>null
  goto :winget_install_v2
)
:winget_install_v2
echo %subdivider1%
powershell -command "Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile winget.msixbundle; Add-AppxPackage winget.msixbundle; Remove-Item winget.msixbundle"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  set custom_failure_msg=unable to install winget package manager
  call :error_fail %custom_failure_msg%
  echo %subdivider1%
  ::pause>null
  goto winget
)
:winget_pchealth
echo %subdivider2%
start cmd.exe /c (winget install Microsoft.windowspchealthcheck)
if %errorlevel% equ 0 (
  call :success
  echo %subdivider2%
  ::pause>null
  goto :eof
  ) else (
  set custom_failure_msg=unable to install windows pc health check
  call :error_fail %custom_failure_msg%
  ::pause>null
  goto :winget_install
)

:: =============================
:: winsec menu
:: =============================
:winsec_submenu
del null
cls
echo.
echo windows security:
echo.
echo %divider%
echo 	quick scan ..................... [01]
echo 	full scan ...................... [02]
echo 	offline scan ................... [03]
echo 	wscui.cpl ...................... [04]
echo 	update ......................... [05]
echo 	reset .......................... [06]
echo 	scanning mode .................. [07]
echo %divider%
echo 	%subdivider1%
echo 	back .................... [8]
echo 	home .................... [9]
echo 	exit .................... [0]
echo 	%subdivider1%
echo.
set /p choice=Type option:
if "%choice%"=="01" goto winsec_quick_start
if "%choice%"=="02" goto winsec_full_start
if "%choice%"=="03" goto winsec_offine_start
if "%choice%"=="04" goto wscui_start
if "%choice%"=="05" goto winsec_update_start
if "%choice%"=="06" goto winsec_reset_start
if "%choice%"=="07" goto winsec_reg_mode_start
if "%choice%"=="8" goto disinfect
if "%choice%"=="9" goto main_menu
if "%choice%"=="0" goto exit
goto error_program
pause>null

:winsec_quick_start
call :winsec_quick
goto winsec_submenu
:winsec_quick
echo %subdivider1%
echo windows security quick scan
powershell -command "start-mpscan -scantype quick"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  call :bell
  ::pause>null
  goto :eof
  ) else (
  set custom_error_msg=unable to initiate windows security quick scan
  call :error_fail %custom_failure_msg%
  goto winsec_enable
)
:winsec_full_start
call :winsec_full
goto winsec_submenu
:winsec_full
echo %subdivider1%
echo windows security full scan
powershell -command "start-mpscan -scantype full"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  call :bell
  ::pause>null
  goto :eof
  ) else (
  set custom_error_msg=unable to initiate windows security full scan
  call :error_fail %custom_failure_msg%
  goto winsec_enable
)
:winsec_offline_start
call :winsec_offine
goto winsec_submenu
:winsec_offine
echo %subdivider1%
echo windows security offline scan:
powershell -command "start-mpwdoscan"
echo %subdivider1%
echo restart computer now?  device will restart regardless
call :restart
echo %subdivider1%
pause>null
goto winsec_submenu
:wscui_start
call :wscui
goto winsec_submenu
:wscui
echo opening windwos security settings in control panel...
wscui.cpl
goto :eof
:winsec_update_start
call :winsec_update
goto winsec_submenu
:winsec_update
echo %subdivider1%
echo running windows security updates
powershell -command "update-mpsignature"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  call :error_retry
  goto :winsec_enable
)
:winsec_enable
echo %subdivider1%
echo setting up windows security
powershell -command "set-mppreference -disablerealtimemonitoring $false"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  set custom_error_msg=unable to initiate windows security
  call :error_fail %custom_failure_msg%
  goto :eof
)

:winsec_periodic
echo %subdivider1%
echo enabling windows security periodic scanning
powershell -command "set-mppreference -disableperiodicscanning $false"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  set custom_error_msg=unable to initiate windows security
  call :error_fail %custom_failure_msg%
  goto :eof
)

:winsec_reset_start
call :winsec_reset
goto winsec_submenu
:winsec_reset
echo %subdivider1%
echo initiating windows security reset
echo.
powershell -command "get-appxpackage microsoft.sechealthui -allusers | reset-appxpackage"
echo reset app package
echo %subdivider2%
echo calling windows security registry value entry reset
call :winsec_reg_enable
echo %subdivider2%
echo recommendation is to restart computer
echo restart computer?
call :restart
echo %subdivider1%
pause>null
goto :eof
:winsec_suite
call :winsec_enable
call :winsec_periodic
call :winsec_update
call :winsec_app_monitor
call :winsec_sample
goto :eof
:winsec_app_monitor
echo %subdivider1%
echo setting up windows app monitor
powershell -command "set-mppreference -puaprotection enabled"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  call :error_retry
  echo %subdivider1%
  goto winsec_enable
)
:winsec_sample
echo %subdivider1%
echo setting up windows security automatic sample submission
powershell -command "set-mppreference -submitsamplesconsent sendallsamples"
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  ::pause>null
  goto :eof
  ) else (
  call :error_retry
  echo %subdivider1%
  goto winsec_enable
)

:: winsec registry section
:: =========================
:winsec_reg_suite
echo %subdivider1%
echo initiating windows security registry enable or disable...
call :winsec_reg_query_suite
pause>null
echo.
echo %subdivider1%
echo 	enable windows security on device, enter to cancel
echo 	enable ................... [1]
echo 	cancel ................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :winsec_reg_enable
if %confirm%==2 goto winsec_submenu
pause>null

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
echo %subdivider3%
call :winsec_reg_spyware_enable
echo %subdivider3%
call :winsec_reg_av_enable
echo %subdivider3%
call :winsec_reg_spyware_policy_enable
echo %subdivider3%
call :winsec_reg_av_policy_enable
echo %subdivider3%
goto :eof
:winsec_reg_spyware_enable
echo %subdivider2%
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
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f
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
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
  echo failed to set windows security registry values
  echo %subdivider2%
)
echo enabled windows security anti-virus
echo %subdivider2%
pause
goto :eof

:winsec_reg_mode_start
echo %subdivider1%
echo set windows security to active or passive
call :winsec_reg_mode_query
pause>null
echo.
echo %subdivider1%
echo 	set windows security scanning mode on device
echo 	passive ................... [1]
echo 	normal .................... [2]
echo %subdivider1%
set /p confirm=type option: || set confirm=2
if %confirm%==1 goto :winsec_reg_passive_start
if %confirm%==2 goto :winsec_reg_active_start
pause>null

:winsec_reg_mode_query
echo %subdivider1%
echo checking windows security active or passive registry values...
powershell -command "get-mpcomputerstatus | select-object amrunningmode"
::reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v PassiveMode > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve windows security registry value
  pause
  echo %subdivider1%
  goto :eof
)
echo %subdivider1%
goto :eof
:winsec_reg_mode_query2
echo %subdivider1%
echo checking windows security active or passive registry values...
powershell -command "get-mpcomputerstatus | select-object amrunningmode"
::reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v PassiveMode > null 2>&1
if %errorlevel% neq 0 (
  echo failed to retrieve windows security registry value
  pause
  echo %subdivider1%
  goto :eof
)
for /f "tokens=3 delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v PassiveMode') do set passivemoderegvalue=%%A
echo passivemoderegvalue=%disableantiviruspolicyvalue%
echo %subdivider1%
goto :eof
:winsec_reg_passive_start
call :winsec_reg_passive
goto winsec_submenu
:winsec_reg_passive
echo %subdivider2%
echo setting windows security to passive monitoring
powershell -command "set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows Defender' -Name 'PassiveMode' -Type DWord -Value 1"
if %errorlevel% neq 0 (
  echo failed to set windows security registry values
  echo %subdivider2%
)
echo enabled windows security to passive monitoring
echo %subdivider2%
pause
goto :eof
:winsec_reg_passive2
echo %subdivider2%
echo setting windows security to passive monitoring
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v PassiveMode /t REG_DWORD /d 1 /f
if %errorlevel% neq 0 (
  echo failed to set windows security registry values
  echo %subdivider2%
)
echo enabled windows security to passive monitoring
echo %subdivider2%
pause
goto :eof
:winsec_reg_active_start
call :winsec_reg_active
goto winsec_submenu
:winsec_reg_active
echo %subdivider2%
echo setting windows security to active monitoring
powershell -command "set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows Defender' -Name 'PassiveMode' -Type DWord -Value 0"
if %errorlevel% neq 0 (
  echo failed to set windows security registry values
  echo %subdivider2%
)
echo enabled windows security to active monitoring
echo %subdivider2%
pause
goto :eof
:winsec_reg_active2
echo %subdivider2%
echo setting windows security to active monitoring
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v PassiveMode /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
  echo failed to set windows security registry values
  echo %subdivider2%
)
echo enabled windows security to active monitoring
echo %subdivider2%
pause
goto :eof

:: =============================
:: device tools section
:: =============================

:device_lookup
for /f "delims=" %%A in ('powershell -Command "get-ciminstance -classname win32_computersystem | select-object manufacturer"') do set manufacturer=%%A
echo %manufacturer%
pause
setlocal enabledelayedexpansion
set "result=!manufacturer:manufacturer=!"
set "result=!manufacturer: =!"
endlocal & set "result=%result%"
::echo command returned: %result%
echo %result%
pause
if "%result%"=="DellInc." (
  set dell_inc = %result%
  echo %dell_inc%
  pause
  goto :dell_inc
)

if "%result%"=="Micro-StarInternationalCo.,Ltd." (
  set msi_setup = %result%
  echo %msi_setup%
  pause
  goto :msi_setup
)

:resolve_first
echo resolve first
if "%result%"=="DellInc." goto :dell_inc
if "%result%"=="Micro-StarInternationalCo.,Ltd." goto :msi_setup

:msi_setup
echo test
goto :eof

::echo.!manufacturer! | findstr /I /C:"%dell%" >nul 2>&1
::if not errorlevel 1 (
::	echo its a dell
::goto :dell_inc
::) else (
::	echo its not a dell
::goto :eof
::)

:dell_inc
echo running dell setup
goto :eof

:HP
echo running hp setup
goto :eof

:LENOVO
echo running lenovo setup
goto :eof
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
call :chkdsk_loop_off & call :powercfg_ds & exit

:quick_exit
exit

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
:: nick_favs section
:: =============================
:new_setup_nf
echo starting new setup suite: & echo %subdivider2% & call :restore_enable & call :shadow_size_5 & call :10 & call :quick_save_exit & call :1440 & call :gs_support & start "" %driveletter%\win\device_tools\user_accounts.lnk & call :net_reset_suite & call :timeout & call :revo & call :timeout & call :updates_win_nf & call :nofify_restart & call :get_latest_updates & call :other_msft_products & call :time_suite & call :winsec_suite & call :timeout & call :winget_pchealth & call :winget_update & start ms-settings:storagesense & call :timeout & call :powercfg_ds & call :bde_off_c & echo blue screen section: & call :bsod_on & echo numlock section & call :numlock_on & call :s_mode_reg_0 & echo %subdivider2% & goto :eof

:updates_full_nf
echo starting updates suite
call :updates_win_nf & call :winsec_update
goto :eof
:updates_win_nf
echo running windows updates
usoclient startinteractivescan
if %errorlevel% equ 0 (
  call :success
  echo %subdivider1%
  goto :eof
  ) else (
  call :error_retry
  echo %subdivider1%
  goto :updates_win_nf
)

:gs_support
copy "%driveletter%\win\installers\support\Geek Squad Support.exe" C:\Users\Public\Desktop
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
:: super error message
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
pause>null
goto :eof

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
pause>null
goto :eof

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
pause>null
goto :eof

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
goto main_menu
