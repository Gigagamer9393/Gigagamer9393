@echo off 
 color 4
 title Winscann,sigscann,antivirus scann,ramtest scan tool
 CLS
 ECHO.
 ECHO =============================
 ECHO please wait
 ECHO =============================
:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~dpnx0"
 rem this works also from cmd shell, other than %~0
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"
  
  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1) 
echo   ********  **                                                           **       ******* 
echo  **//////**//   *****                                                   /**      /**////**
echo **      //  ** **///**  ******   ******  ******   ******  ******  ******/**      /**   /**
echo/**         /**/**  /** //////** //**//* //////** ////**  **////**//**//*/**      /******* 
echo/**    *****/**//******  *******  /** /   *******    **  /**   /** /** / /**      /**////  
echo//**  ////**/** /////** **////**  /**    **////**   **   /**   /** /**   /**      /**      
echo //******** /**  ***** //********/***   //******** ******//****** /***   /********/**      
echo  ////////  //  /////   //////// ///     //////// //////  //////  ///    //////// // 
@ping -n 5 localhost> nul
time/t
date/t
@ping -n 5 localhost> nul
echo wir trennen ihre internet verbindung ( zur sicherheit ) bitte warten !
@ping -n 25 localhost> nul
netsh interface Show interface
@ping -n 20 localhost> nul
netsh interface set interface "wlan" disable
netsh interface set interface "wlan 1" disable
netsh interface set interface "wlan 2" disable
netsh interface set interface "wlan 3" disable
netsh interface set interface "wlan 4" disable
netsh interface set interface "wlan 5" disable
netsh interface set interface "wlan 6" disable
netsh interface set interface "wlan 7" disable
netsh interface set interface "wlan 8" disable
netsh interface set interface "wlan 9" disable
netsh interface set interface "wlan 10" disable
timeout 5
@ping -n 25 localhost> nul

title Microsoft Windows System Check Scann
echo Wir versuchen beschädigte Microsoft Windows Daten auf fehler zu Scannen bitte warten sie !!! / We are trying to scan corrupted Microsoft Windows data for errors. Please wait
color 9
@ping -n 5 localhost> nul
sfc/scannow
@ping -n 25 localhost> nul
echo Führen sie die Überprüfung aus ( Digitale Signierte ) Treiber ( SigScann ) bitte warten sie !!!
@ping -n 25 localhost> nul
sigverif
@ping -n 25 localhost> nul
echo Es wird auf Beschädigte Windows Updatedatein Überprüft !!!
@ping -n 25 localhost> nul
color 4
DISM.exe /Online /Cleanup-image /Restorehealth
echo Voller Virenscann wird durchgeführt warten sie Bitte
@ping -n 25 localhost> nul
cd C:\ProgramData\Microsoft\Windows Defender\Platform\4*
mpcmdrun -scan -scantype 2
@ping -n 25 localhost> nul
echo internet Verbindung wird wieder hergestellt einen moment bitte
@ping -n 30 localhost> nul
netsh interface set interface "Ethernet" enable
netsh interface set interface "WLAN" enable
netsh interface set interface "WLAN 1" enable
netsh interface set interface "WLAN 2" enable
netsh interface set interface "WLAN 3" enable
netsh interface set interface "WLAN 4" enable
netsh interface set interface "WLAN 5" enable
netsh interface set interface "WLAN 6" enable
netsh interface set interface "WLAN 7" enable
netsh interface set interface "WLAN 8" enable
netsh interface set interface "WLAN 9" enable
netsh interface set interface "WLAN 10" enable
echo Progress: [##------------------] 10%%
echo ----------------------------------
timeout 2 >nul
echo ----------------------------------
echo Progress: [####----------------] 20%%
echo ----------------------------------
timeout 2 >nul
echo ----------------------------------
echo Progress: [######--------------] 30%%
echo ----------------------------------
timeout 2 >nul
echo ----------------------------------
echo Progress: [########------------] 40%%
echo ----------------------------------
timeout 2 >nul
echo ----------------------------------
echo Progress: [########------------] 50%%
echo ----------------------------------
timeout 2 >nul
echo ----------------------------------
echo Progress: [############--------] 60%%
echo ----------------------------------
timeout 2 >nul 
echo ----------------------------------
echo Progress: [##############------] 70%%
echo ----------------------------------
timeout 2 >nul
cls
echo.
echo.
echo ----------------------------------
echo Progress: [################----] 80%%
echo ----------------------------------
timeout 2 >nul
cls
echo.
echo.
echo 
echo ----------------------------------
echo Progress: [##################--] 90%%
echo ----------------------------------
timeout 2 >nul
echo ----------------------------------
echo Progress: [####################] 100%%
echo ----------------------------------
echo Temp o DNS Ordner Clean und warten sie einen moment der Komplette vorgang wird Automatisch geschlossen !!! / Temp o DNS Folder Clean and wait a moment for the complete process to close automatically
@ping -n 15 localhost> nul
%temp%
@ping -n 15 localhost> nul
ipconfig /flushdns 
@ping -n 25 localhost> nul
color 9
echo scannen sie ihren Arbeitsspeicher / Scan your RAM ( RAM ) bitte warten sie einen moment und wählen sie anschließent beim Nächsten start aus und führen sie den scann aus 
@ping -n 25 localhost> nul
mdsched
@ping -n 15 localhost> nul
Exit


