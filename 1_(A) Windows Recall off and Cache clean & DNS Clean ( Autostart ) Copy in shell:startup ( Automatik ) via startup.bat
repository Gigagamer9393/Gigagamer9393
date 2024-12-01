 @echo off 
 color 4
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

title Recall off
echo   ********  **                                                           **       ******* 
echo  **//////**//   *****                                                   /**      /**////**
echo **      //  ** **///**  ******   ******  ******   ******  ******  ******/**      /**   /**
echo/**         /**/**  /** //////** //**//* //////** ////**  **////**//**//*/**      /******* 
echo/**    *****/**//******  *******  /** /   *******    **  /**   /** /** / /**      /**////  
echo//**  ////**/** /////** **////**  /**    **////**   **   /**   /** /**   /**      /**      
echo //******** /**  ***** //********/***   //******** ******//****** /***   /********/**      
echo  ////////  //  /////   //////// ///     //////// //////  //////  ///    //////// //   
timeout 5 > nul
time/t
date/t
timeout 5 > nul
echo Wir werden die Zusatzfunktion von Microsoft Windows ( Recall ) Testen und auf Funktionalität komplett deaktivieren lassen sie bitte den Vorgang durchlaufen es dauert nicht lange wobei ihre internet /netzwerk verbindung zusätzlich offline genommen wird und wieder online geht!!! Wen keine Daten verfügbare angezeigt wird handel es sich um keinen fehler es müsste im protokol stehen bei skriptbefehl und wird trotzdem ihre verbindung beenden kurz! We will test the additional function of Microsoft Windows (Recall) and deactivate functionality completely. Please let the process go through, it won't take long!!!
netsh interface set interface "Ethernet" disable
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
timeout 25 > nul
DISM /Online /Get-FeatureInfo /FeatureName:Recall
timeout 10 > nul
color 9
DISM /Online /Disable-Feature /FeatureName:Recall 
timeout 10 > nul
DISM /Online /Get-FeatureInfo /FeatureName:Recall
timeout 20 > nul
echo DNS Cache wird noch Bereinigt einen Moment
timeout 20 > nul
color 4
ipconfig /flushdns
timeout 20 > nul
echo Wir bereinigen noch den temp Ordner einen Moment
timeout 20 > nul
del /s /f /q %Temp%\*.*
for /f %%f in ('dir /ad /b %Temp%\') do rd /s /q %Temp%\%%f
timeout 20 > nul
echo bypass recall go online
timeout 20 > nul
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
timeout 20 > nul
echo Vorgang abgeschlossen wird in 20 sek geschlossen
timeout 20 > nul
exit


 
