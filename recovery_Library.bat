@echo off
REM =========================================
REM Python 3.12.10 Backup & Restore Tool ULTIMATE mit Robocopy
REM Backup, Restore, Library Test, Version Check, Auto-Pip mit Bestätigung
REM =========================================

set DESKTOP_DIR=%USERPROFILE%\Desktop
set PYTHON_DIR=C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python312

echo.
echo =====================================
echo   Python Backup & Restore Tool ROBocopy
echo =====================================
echo.
echo 1. Backup erstellen
echo 2. Restore + Versionscheck + Pip Bestätigung
echo.
set /p choice="Waehle Option 1 oder 2: "

if "%choice%"=="1" goto :backup
if "%choice%"=="2" goto :restore
echo Ungueltige Auswahl!
pause
exit /b

:backup
set BACKUP_DIR=%DESKTOP_DIR%\PythonBackup_%DATE:~-4%-%DATE:~3,2%-%DATE:~0,2%
echo Backup-Ordner: %BACKUP_DIR%
mkdir "%BACKUP_DIR%\site-packages"
mkdir "%BACKUP_DIR%\Scripts"

REM Robocopy für site-packages
echo Kopiere site-packages mit Robocopy...
robocopy "%PYTHON_DIR%\Lib\site-packages" "%BACKUP_DIR%\site-packages" /E /COPYALL /R:3 /W:5

REM Robocopy für Scripts
echo Kopiere Scripts mit Robocopy...
robocopy "%PYTHON_DIR%\Scripts" "%BACKUP_DIR%\Scripts" /E /COPYALL /R:3 /W:5

REM Registry sichern
echo Backup Registry...
reg export "HKCU\Software\Python\PythonCore\3.12\PythonPath" "%BACKUP_DIR%\backup_python.reg" /y

echo Backup abgeschlossen!
pause
exit /b

:restore
for /f "delims=" %%i in ('dir "%DESKTOP_DIR%\PythonBackup_*" /ad /b /o-d') do (
    set LATEST_BACKUP=%%i
    goto :found
)
:found

if "%LATEST_BACKUP%"=="" (
    echo Kein Backup-Ordner gefunden auf Desktop!
    pause
    exit /b
)

set BACKUP_DIR=%DESKTOP_DIR%\%LATEST_BACKUP%
echo Neuester Backup-Ordner: %BACKUP_DIR%

REM Robocopy Restore für site-packages
echo Wiederherstellen site-packages...
robocopy "%BACKUP_DIR%\site-packages" "%PYTHON_DIR%\Lib\site-packages" /E /COPYALL /R:3 /W:5

REM Robocopy Restore für Scripts
echo Wiederherstellen Scripts...
robocopy "%BACKUP_DIR%\Scripts" "%PYTHON_DIR%\Scripts" /E /COPYALL /R:3 /W:5

REM Registry wiederherstellen
echo Importiere Registry...
reg import "%BACKUP_DIR%\backup_python.reg"

REM Test aller importierbaren Libraries & Versionscheck & Pip mit Bestätigung
echo Teste Libraries & frage vor Installation/Update...
set TEMP_PY=%TEMP%\test_imports_robocopy.py
set LOG_FILE=%BACKUP_DIR%\LibraryTestLog.txt
set LOG_FAIL=%BACKUP_DIR%\LibraryFailed.txt
set LOG_PIP=%BACKUP_DIR%\LibraryInstallCommands.txt

(
echo import os
echo import sys
echo import subprocess
echo import pkg_resources
echo site_packages = r"%BACKUP_DIR%\site-packages"
echo sys.path.insert(0, site_packages)
echo libs = [d for d in os.listdir(site_packages) ^
             if os.path.isdir(os.path.join(site_packages,d)) ^
             and not d.endswith(".dist-info") ^
             and not d.endswith(".egg") ^
             and not d.startswith("_")]
echo fails = []
echo results = {}
echo for lib in libs:
echo^    try:
echo^        mod = __import__(lib)
echo^        version = getattr(mod, "__version__", "unbekannt")
echo^        results[lib] = f"OK (Version: {version})"
echo^    except Exception as e:
echo^        results[lib] = f"FEHLER ({e})"
echo^        fails.append(lib)
echo with open(r"%LOG_FILE%", "w", encoding="utf-8") as f_log:
echo^    for k,v in results.items():
echo^        print(f"{k}: {v}")
echo^        f_log.write(f"{k}: {v}\n")
echo with open(r"%LOG_FAIL%", "w", encoding="utf-8") as f_fail, open(r"%LOG_PIP%", "w", encoding="utf-8") as f_pip:
echo^    for f in fails:
echo^        print(f)
echo^        f_fail.write(f + "\n")
echo^        cmd = f"pip install --upgrade {f}"
echo^        print(cmd)
echo^        f_pip.write(cmd + "\n")
echo^        resp = input(f"Möchtest du {f} installieren/aktualisieren? (j/n): ")
echo^        if resp.lower() == "j":
echo^            subprocess.run([sys.executable, "-m", "pip", "install", "--upgrade", f])
) > "%TEMP_PY%"

"%PYTHON_DIR%\python.exe" "%TEMP_PY%"

echo Restore & Versionscheck abgeschlossen!
echo Log-Datei: %LOG_FILE%
echo Fehlende Libraries: %LOG_FAIL%
echo Pip-Befehle: %LOG_PIP%
pause
exit /b