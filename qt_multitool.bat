@echo off
title QT + AUTO PY TO EXE MULTITOOL
color 0A

:menu
cls
echo ==========================================
echo      QT + AUTO PY TO EXE MULTITOOL
echo ==========================================
echo.
echo ---------- INSTALLIEREN ----------
echo [1] PyQt5 komplett installieren
echo [2] PyQt6 komplett installieren
echo [3] PySide6 komplett installieren
echo [4] auto-py-to-exe installieren
echo [5] ALLES installieren
echo.
echo ---------- OEFFNEN ----------
echo [6] auto-py-to-exe starten
echo.
echo ---------- LOESCHEN ----------
echo [7] PyQt5 komplett loeschen
echo [8] PyQt6 komplett loeschen
echo [9] PySide6 komplett loeschen
echo [10] ALLES Qt Zeug loeschen
echo.
echo ---------- CLEAN INSTALL ----------
echo [11] Full Clean + PySide6 installieren
echo [12] Full Clean + ALLES installieren
echo.
echo ---------- INFO ----------
echo [13] Installierte Qt / Auto Pakete anzeigen
echo.
echo [0] Beenden
echo.
set /p choice=Option waehlen: 

if "%choice%"=="1" goto install5
if "%choice%"=="2" goto install6
if "%choice%"=="3" goto installpyside
if "%choice%"=="4" goto installauto
if "%choice%"=="5" goto installall
if "%choice%"=="6" goto openauto
if "%choice%"=="7" goto remove5
if "%choice%"=="8" goto remove6
if "%choice%"=="9" goto removepyside
if "%choice%"=="10" goto removeall
if "%choice%"=="11" goto fullcleanpyside
if "%choice%"=="12" goto fullcleanall
if "%choice%"=="13" goto list
if "%choice%"=="0" exit

goto menu

:install5
cls
echo Installiere PyQt5 komplett...
python -m pip install --upgrade pip
python -m pip install PyQt5 PyQtWebEngine
pause
goto menu

:install6
cls
echo Installiere PyQt6 komplett...
python -m pip install --upgrade pip
python -m pip install PyQt6 PyQt6-WebEngine
pause
goto menu

:installpyside
cls
echo Installiere PySide6 komplett...
python -m pip install --upgrade pip
python -m pip install PySide6
pause
goto menu

:installauto
cls
echo Installiere auto-py-to-exe...
python -m pip install --upgrade pip
python -m pip install auto-py-to-exe
pause
goto menu

:installall
cls
echo Installiere ALLES...
python -m pip install --upgrade pip
python -m pip install PyQt5 PyQtWebEngine
python -m pip install PyQt6 PyQt6-WebEngine
python -m pip install PySide6
python -m pip install auto-py-to-exe
pause
goto menu

:openauto
cls
echo Starte auto-py-to-exe...
python -m auto_py_to_exe
pause
goto menu

:remove5
cls
echo Loesche PyQt5 komplett...
python -m pip uninstall PyQt5 PyQt5-Qt5 PyQt5-sip PyQtWebEngine PyQtWebEngine-Qt5 -y
pause
goto menu

:remove6
cls
echo Loesche PyQt6 komplett...
python -m pip uninstall PyQt6 PyQt6-Qt6 PyQt6-sip PyQt6-WebEngine PyQt6-WebEngine-Qt6 -y
pause
goto menu

:removepyside
cls
echo Loesche PySide6 komplett...
python -m pip uninstall PySide6 PySide6_Addons PySide6_Essentials shiboken6 -y
pause
goto menu

:removeall
cls
echo Loesche ALLES Qt Zeug...
python -m pip uninstall PyQt5 PyQt5-Qt5 PyQt5-sip PyQtWebEngine PyQtWebEngine-Qt5 -y
python -m pip uninstall PyQt6 PyQt6-Qt6 PyQt6-sip PyQt6-WebEngine PyQt6-WebEngine-Qt6 -y
python -m pip uninstall PySide6 PySide6_Addons PySide6_Essentials shiboken6 -y
pause
goto menu

:fullcleanpyside
cls
echo FULL CLEAN + PySide6 gestartet...
python -m pip uninstall PyQt5 PyQt5-Qt5 PyQt5-sip PyQtWebEngine PyQtWebEngine-Qt5 -y
python -m pip uninstall PyQt6 PyQt6-Qt6 PyQt6-sip PyQt6-WebEngine PyQt6-WebEngine-Qt6 -y
python -m pip uninstall PySide6 PySide6_Addons PySide6_Essentials shiboken6 -y

echo.
echo Installiere frisches PySide6...
python -m pip install --upgrade pip
python -m pip install PySide6
pause
goto menu

:fullcleanall
cls
echo FULL CLEAN + ALLES installieren gestartet...
python -m pip uninstall PyQt5 PyQt5-Qt5 PyQt5-sip PyQtWebEngine PyQtWebEngine-Qt5 -y
python -m pip uninstall PyQt6 PyQt6-Qt6 PyQt6-sip PyQt6-WebEngine PyQt6-WebEngine-Qt6 -y
python -m pip uninstall PySide6 PySide6_Addons PySide6_Essentials shiboken6 -y

echo.
echo Installiere ALLES neu...
python -m pip install --upgrade pip
python -m pip install PyQt5 PyQtWebEngine
python -m pip install PyQt6 PyQt6-WebEngine
python -m pip install PySide6
python -m pip install auto-py-to-exe
pause
goto menu

:list
cls
echo =====================================
echo Installierte Qt / Auto Pakete:
echo =====================================
python -m pip list | findstr /i "PyQt PySide Qt auto shiboken"
echo.
pause
goto menu