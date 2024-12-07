%echo off
Color 4
title Windows 10 und Windows 11: Ultimative Energy Option enable
echo Windows 10 und Windows 11: Ultimative Leistung wird aktiviert [ MANUELL ] Einstellbar
 ECHO =============================
 ECHO Ultimate Energy Mode enable [Manuall]
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
  ECHO GigarazorLP Skript control
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
timeout 5 >nul
time/t
date/t
timeout 10 >nul
echo ----------------------------------
echo Progress: [##------------------] 10%%
echo ----------------------------------
timeout 2 >nul
cls
echo.
echo.
echo
echo ----------------------------------
echo Progress: [####----------------] 20%%
echo ----------------------------------
timeout 1 >nul
cls
echo.
echo.
echo 
echo ----------------------------------
echo Progress: [######--------------] 30%%
echo ----------------------------------
timeout 2 >nul
cls
echo.
echo.
echo
echo ----------------------------------
echo Progress: [########------------] 40%%
echo ----------------------------------
timeout 1 >nul
cls
echo.
echo.
echo
echo ----------------------------------
echo Progress: [##########----------] 50%%
echo ----------------------------------
timeout 2 >nul
cls
echo.
echo.
echo
echo ----------------------------------
echo Progress: [############--------] 60%%
echo ----------------------------------
timeout 1 >nul
cls
echo.
echo.
echo
echo ----------------------------------
echo Progress: [##############------] 70%%
echo ----------------------------------
timeout 2 >nul
cls
echo.
echo.
echo 
echo ----------------------------------
echo Progress: [################----] 80%%
echo ----------------------------------
timeout 1 >nul
cls
echo.
echo.
echo
echo ----------------------------------
echo Progress: [##################--] 90%%
echo ----------------------------------
timeout 2 >nul
cls
echo.
echo.
echo
echo ----------------------------------
echo Progress: [####################] 100%%
echo ----------------------------------
GOTO END

:END
cls
echo.
echo.
timeout 10 >nul
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
timeout 10 
exit
