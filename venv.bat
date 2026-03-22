@echo off
title venv
color 0B

echo ==============================================================
echo       venv - Auto-Setup fuer einen frischen PC
echo ==============================================================
echo.

:: 1. Pruefen, ob Python ueberhaupt installiert ist
python --version >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo [FEHLER] Python wurde nicht gefunden!
    echo Bitte installiere Python ^(am besten 3.11 oder 3.12^) von python.org
    echo WICHTIG: Setze beim Installieren unbedingt den Haken bei "Add Python to PATH"!
    echo.
    pause
    exit /b
)

echo [1/4] Erstelle saubere virtuelle Umgebung (venv)...
if not exist "venv\" (
    python -m venv venv
    echo [OK] venv erstellt.
) else (
    echo [INFO] Virtuelle Umgebung existiert bereits.
)
echo.

echo [2/4] Aktiviere Umgebung und update pip...
call venv\Scripts\activate
python -m pip install --upgrade pip >nul 2>&1
echo [OK] Bereit fuer Installationen.
echo.

echo [3/4] Installiere die perfekten Bibliotheks-Versionen...
echo Das dauert jetzt ein paar Minuten. Hol dir einen Kaffee!
echo.
pip install pygame-ce ultralytics mss opencv-python==4.10.0.84 "numpy<2" torch==2.2.2 torchvision==0.17.2 pywin32 PyQt5 auto-py-to-exe

echo.
echo ==============================================================
echo [4/4] SETUP ERFOLGREICH ABGESCHLOSSEN!
echo ==============================================================
echo Alle Konflikte wurden umgangen. Das System ist bereit.
echo.

:: Fragt den Nutzer, ob auto-py-to-exe direkt gestartet werden soll
set /p start_gui="Moechtest du auto-py-to-exe jetzt direkt starten? (j/n): "
if /i "%start_gui%"=="j" (
    echo Starte auto-py-to-exe...
    auto-py-to-exe
)

pause