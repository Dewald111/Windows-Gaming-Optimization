@ECHO OFF
CLS
:: Set background color to blue and text to white
COLOR 1F

ECHO ================================
ECHO  Windows Gaming Optimization
ECHO ================================
ECHO 1. Disable Unnecessary Services
ECHO 2. Adjust Visual Effects
ECHO 3. Set High Performance Mode
ECHO 4. Clean Temporary Files
ECHO 5. Optimize Network Settings
ECHO 6. Disable Windows Defender
ECHO 7. Remove Bloatware
ECHO 8. Set System to Gaming Mode
ECHO 9. Exit
ECHO ================================
SET /P choice=Select an option (1-9): 

IF "%choice%"=="1" GOTO DisableServices
IF "%choice%"=="2" GOTO AdjustVisualEffects
IF "%choice%"=="3" GOTO SetHighPerformance
IF "%choice%"=="4" GOTO CleanTempFiles
IF "%choice%"=="5" GOTO OptimizeNetwork
IF "%choice%"=="6" GOTO DisableDefender
IF "%choice%"=="7" GOTO RemoveBloatware
IF "%choice%"=="8" GOTO SetGamingMode
IF "%choice%"=="9" GOTO End

:DisableServices
CLS
:: Set text to yellow
COLOR 6F
ECHO Disabling unnecessary services to free up system resources...
:: Disable Windows Search
sc config WSearch start=disabled
:: Disable Windows Update
sc config wuauserv start=disabled
:: Disable Windows Defender Antivirus Service
sc config WinDefend start=disabled
:: Disable Windows Defender Firewall
sc config MpsSvc start=disabled
:: Disable Superfetch
sc config SysMain start=disabled
:: Disable Windows Error Reporting Service
sc config WerSvc start=disabled
:: Disable Windows Time
sc config W32Time start=disabled
:: Disable Windows Image Acquisition
sc config stisvc start=disabled
:: Disable Windows Management Instrumentation
sc config winmgmt start=disabled
:: Disable Windows Remote Management
sc config WinRM start=disabled
ECHO Services disabled successfully.
PAUSE
GOTO Menu

:AdjustVisualEffects
CLS
:: Set text to light green
COLOR A0
ECHO Adjusting visual effects for better performance...
:: Set visual effects to best performance
:: This command opens the Performance Options window; manual selection is required
start sysdm.cpl
ECHO Please select 'Adjust for best performance' in the Performance Options window.
PAUSE
GOTO Menu

:SetHighPerformance
CLS
:: Set text to light yellow
COLOR E0
ECHO Setting system to high performance mode...
:: Set power plan to high performance
powercfg -setactive SCHEME_MIN
ECHO System set to high performance mode.
PAUSE
GOTO Menu

:CleanTempFiles
CLS
:: Set text to light blue
COLOR B0
ECHO Cleaning temporary files to free up disk space...
:: Clean Windows temporary files
del /q /f /s %TEMP%\*
:: Clean Internet Explorer cache
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
:: Clean Windows Update cache
net stop wuauserv
del /q /f /s %windir%\SoftwareDistribution\Download\*
net start wuauserv
ECHO Temporary files cleaned successfully.
PAUSE
GOTO Menu

:OptimizeNetwork
CLS
:: Set text to light red
COLOR C0
ECHO Optimizing network settings for better gaming performance...
:: Disable Nagle's algorithm
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v TCPNoDelay /t REG_DWORD /d 1 /f
:: Disable Windows Auto-Tuning
netsh interface tcp set global autotuninglevel=disabled
:: Disable Windows Scaling heuristics
netsh interface tcp set global rss=disabled
ECHO Network settings optimized successfully.
PAUSE
GOTO Menu

:DisableDefender
CLS
:: Set text to light purple
COLOR D0
ECHO Disabling Windows Defender for gaming...
:: Disable Windows Defender Antivirus Service
sc config WinDefend start=disabled
:: Disable Windows Defender Firewall
sc config MpsSvc start=disabled
ECHO Windows Defender disabled successfully.
PAUSE
GOTO Menu

:RemoveBloatware
CLS
:: Set text to green
COLOR 2F
ECHO Removing bloatware to improve system performance...
:: Remove Xbox Game Bar
powershell -Command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
:: Remove Xbox Console Companion
powershell -Command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage"
:: Remove Cortana
powershell -Command "Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage"
:: Remove OneDrive
powershell -Command "Get-AppxPackage *OneDrive* | Remove-AppxPackage"
ECHO Bloatware removed successfully.
PAUSE
GOTO Menu

:SetGamingMode
CLS
:: Set text to red
COLOR 4F
ECHO Setting system to gaming mode...
:: Set system to high performance mode
powercfg -setactive SCHEME_MIN
:: Disable Windows Update
sc config wuauserv start=disabled
:: Disable Windows Defender Antivirus Service
sc config WinDefend start=disabled
:: Disable Windows Defender Firewall
sc config MpsSvc start=disabled
:: Disable Superfetch
sc config SysMain start=disabled
ECHO System set to gaming mode.
PAUSE
GOTO Menu

:Menu
CLS
:: Set text to white on blue background
COLOR 1F
ECHO ================================
ECHO  Windows Gaming Optimization
ECHO ================================
ECHO 1. Disable Unnecessary Services
ECHO 2. Adjust Visual Effects
ECHO 3. Set High Performance Mode
ECHO 4. Clean Temporary Files
ECHO 5. Optimize Network Settings
ECHO 6. Disable Windows Defender
ECHO 7. Remove Bloatware
ECHO 8. Set System to Gaming Mode
ECHO 9. Exit
ECHO ================================
SET /P choice=Select an option (1-9): 

IF "%choice%"=="1" GOTO DisableServices
IF "%choice%"=="2" GOTO AdjustVisualEffects
IF "%choice%"=="3" GOTO SetHighPerformance
IF "%choice%"=="4" GOTO CleanTempFiles
IF "%choice%"=="5" GOTO OptimizeNetwork
IF "%choice%"=="6" GOTO DisableDefender
IF "%choice%"=="7" GOTO RemoveBloatware
IF "%choice%"=="8" GOTO SetGamingMode
IF "%choice%"=="9" GOTO End

:End
CLS
ECHO Exiting the program.
PAUSE
