@echo off
:: ===============================================
:: Auto Py to EXE Tool - Stabil & UTF-8 Sicher
:: ===============================================

:: Zeichensatz auf Windows-Standard (vermeidet Probleme mit ASCII)
chcp 1252 >nul
title Auto Py to EXE Tool
color 0A
cls

:: ===== SICHERES ASCII-BANNER =====
echo =====================================================
echo       AUTO PY TO EXE - INSTALLER UND STARTER
echo =====================================================
echo.

:MENU
echo Willkommen zum Auto Py to EXE Tool!
echo.
echo [1] Installieren
echo [2] Updaten
echo [3] Starten
echo [4] Beenden
echo.

set /p "choice=Bitte eine Option eingeben (1-4): "

if "%choice%"=="1" goto INSTALL
if "%choice%"=="2" goto UPDATE
if "%choice%"=="3" goto START
if "%choice%"=="4" goto EXIT

echo.
echo Ungueltige Auswahl! Bitte eine Zahl von 1 bis 4 eingeben.
echo.
pause
cls
goto MENU

:INSTALL
cls
echo -----------------------------------------------------
echo         Installation von auto-py-to-exe
echo -----------------------------------------------------
call :FAKELOADING
echo.
where py >nul 2>&1
if %ERRORLEVEL%==0 (
    py -3 -m pip install --upgrade pip
    py -3 -m pip install auto-py-to-exe
) else (
    python -m pip install --upgrade pip 2>nul || (
        echo.
        echo [FEHLER] Python nicht gefunden!
        echo Bitte installiere Python von https://www.python.org
        pause
        goto MENU
    )
    python -m pip install auto-py-to-exe
)
echo.
echo Installation abgeschlossen!
pause
cls
goto MENU

:UPDATE
cls
echo -----------------------------------------------------
echo         Update von auto-py-to-exe
echo -----------------------------------------------------
call :FAKELOADING
echo.
where py >nul 2>&1
if %ERRORLEVEL%==0 (
    py -3 -m pip install --upgrade auto-py-to-exe
) else (
    python -m pip install --upgrade auto-py-to-exe
)
echo.
echo Update abgeschlossen!
pause
cls
goto MENU

:START
cls
echo -----------------------------------------------------
echo         Starte auto-py-to-exe
echo -----------------------------------------------------
call :FAKELOADING
echo.
where py >nul 2>&1
if %ERRORLEVEL%==0 (
    py -3 -m auto_py_to_exe
) else (
    python -m auto_py_to_exe
)
echo.
pause
cls
goto MENU

:FAKELOADING
setlocal enabledelayedexpansion
set "bar="
echo.
for /L %%i in (1,1,10) do (
    set "bar=!bar!#"
    <nul set /p "=Lade: !bar!"
    timeout /nobreak /t 1 >nul
    cls
    echo Lade: !bar!
)
echo.
endlocal
echo Fertig!
echo.
goto :eof

:EXIT
cls
echo -----------------------------------------------------
echo Auf Wiedersehen! Danke, dass du das Tool benutzt hast.
echo -----------------------------------------------------
timeout /t 1 >nul
exit /b 0
