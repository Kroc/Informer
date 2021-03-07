@ECHO OFF
CD %~dp0

CALL "group\clean.bat"

ECHO:
ECHO * Build WINS Debug...
ECHO ===============================================================================
CALL "group\build_wins.bat" deb
IF ERRORLEVEL 1 PAUSE & EXIT /B 1
ECHO:

START "" \EPOC32\Release\WINS\Deb\INFORM6.EXE