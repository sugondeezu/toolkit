cd /d %userprofile%\appdata\local\microsoft\windows\explorer & taskkill /f /im explorer.exe & 
del iconcache* & 
explorer.exe & 
powershell; get-appxpackage -allusers microsoft.windows.shellexperiencehost | foreach {add-appxpackage -disabledevelopmentmode -register "$($_.installlocation)\appxmanifest.xml"} 