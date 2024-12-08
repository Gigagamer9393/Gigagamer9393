@echo off
title GigarazorLP Server [Server Bulding 1.00 to Connect]
Color 2
 CLS
 ECHO.
 ECHO =============================
 ECHO Gigarazor Server build v1.00
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
  ECHO Gigarazor Server build v1.00
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
echo Gigarazor Server loading
timeout 10
cls
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
cls
echo.
echo.
echo please wait starting Server
echo ----------------------------------
echo Progress: [####################] 100%%
echo Starting Server [ Gigarazor UI ]
timeout 5 >nul
cls
color 1e
echo  ********                                          **              **  **      **
echo **//////                                          /**             //  /**     /**
echo /**         *****  ****** **    **  *****  ******  /**      **   ** ** /**     /**
echo /********* **///**//**//*/**   /** **///**//**//*  /****** /**  /**/** /**  ******
echo////////**/******* /** / //** /** /******* /** /   /**///**/**  /**/** /** **///**
echo       /**/**////  /**    //****  /**////  /**     /**  /**/**  /**/** /**/**  /**
echo ******** //******/***     //**   //******/***     /****** //******/** ***//******
echo////////   ////// ///       //     ////// ///      /////    ////// // ///  //////v1.00   
echo server time [1] 
echo server date [2]
time/t
date/t
timeout 20 >nul
echo wait...
timeout 10 >nul
echo ## ##   ###  ##  ####     ##  ##   
echo ##   ##    ## ##   ##      ##  ##   
echo ##   ##   # ## #   ##      ##  ##   
echo ##   ##   ## ##    ##       ## ##   
echo ##   ##   ##  ##   ##        ##     
echo ##   ##   ##  ##   ##  ##    ##     
echo ## ##   ###  ##  ### ###    ##
echo ------------------------------------------------------------------
echo ## ##   ###  ##  ### ##    ## ##   ##   ##  ### ###  
echo ##   ##   ##  ##   ##  ##  ##   ##   ## ##    ##  ##  
echo ##        ##  ##   ##  ##  ##   ##  # ### #   ##      
echo ##        ## ###   ## ##   ##   ##  ## # ##   ## ##   
echo ##        ##  ##   ## ##   ##   ##  ##   ##   ##      
echo ##   ##   ##  ##   ##  ##  ##   ##  ##   ##   ##  ##  
echo ## ##   ###  ##  #### ##   ## ##   ##   ##  ### ### 
echo ------------------------------------------------------------------
echo ### ##   ### ##    ## ##   ##   ##   ## ##   ### ###  ### ##   
echo ##  ##   ##  ##  ##   ##  ##   ##  ##   ##   ##  ##   ##  ##  
echo ##  ##   ##  ##  ##   ##  ##   ##  ####      ##       ##  ##  
echo ## ##    ## ##   ##   ##  ## # ##   #####    ## ##    ## ##   
echo ##  ##   ## ##   ##   ##  # ### #      ###   ##       ## ##   
echo ##  ##   ##  ##  ##   ##   ## ##   ##   ##   ##  ##   ##  ##  
echo ### ##   #### ##   ## ##   ##   ##   ## ##   ### ###  #### ##
echo ------------------------------------------------------------------
timeout 15 >nul
:Auswahlmenu
cls
echo.
echo Auswahlmenue / Selectionmenu to Server
echo ===========
echo.
echo beispiel usw
echo beispiel usw
echo beispiel usw
echo beispiel usw
echo beispiel usw
echo beispiel usw
echo beispiel usw
echo beispiel usw
echo beispiel usw
set asw=0
set /p asw="Bitte eine Auswahl treffen: "

if %asw%==0 goto Auswahl0if %asw%==0 goto Auswahl0
start chrome www.google.de
goto end


if %asw%==1 goto Auswahl1if %asw%==1 goto Auswahl1
start chrome www.google.de 
goto end


if %asw%==2 goto Auswahl2if %asw%==2 goto Auswahl2
start chrome www.google.de
goto end


if %asw%==3 goto Auswahl3if %asw%==3 goto Auswahl3
start chrome www.google.de
goto end


if %asw%==4 goto Auswahl4if %asw%==4 goto Auswahl4
start chrome www.google.de
goto end


if %asw%==5 goto Auswahl5if %asw%==5 goto Auswahl5
start chrome www.google.de
goto end


if %asw%==6 goto Auswahl6if %asw%==6 goto Auswahl6
start chrome www.google.de
goto end


if %asw%==7 goto Auswahl7if %asw%==7 goto Auswahl7
start chrome www.google.de
goto end


if %asw%==8 goto Auswahl8if %asw%==8 goto Auswahl8
start chrome www.google.de
goto end


if %asw%==9 goto Auswahl9if %asw%==9 goto Auswahl9
start chrome www.google.de
goto end


if %asw%==10 goto Auswahl10if %asw%==10 goto Auswahl10
start chrom www.google.de
goto end

:end
echo Serverauswahl wird Automatisch geschlossen [15sek]
echo The server selection will automatically close [15]
timeout 15 
exit
