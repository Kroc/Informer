@ECHO OFF
CD %~dp0

CALL "group\clean.bat"

ECHO:
ECHO * Build WINS Release...
ECHO ===============================================================================
CALL "group\build_wins.bat" rel
IF ERRORLEVEL 1 PAUSE & EXIT /B 1
ECHO:

START "" \EPOC32\Release\WINS\Rel\INFORM6.EXE

ECHO ===============================================================================
ECHO * Build MARM Release...
ECHO ===============================================================================
ECHO * Compile inform6.exe...
ECHO -------------------------------------------------------------------------------
CALL "group\build_marm.bat" rel
IF ERRORLEVEL 1 PAUSE & EXIT /B 1

ECHO * Make release bundle...

SET "BIN_ZIP=bin\7zip\7za.exe" 
PUSHD "release"

REM # copy over the compiled executable into the release folder
COPY /Y \EPOC32\Release\MARM\Rel\INFORM6.EXE /B inform6.exe /B  >NUL

REM # remove the old release ZIP file
DEL /F /Q "inform6-epoc32*"  >NUL 2>NUL

..\%BIN_ZIP% a "inform6-epoc32-v635.zip" ^
    -bso0 -bsp1 -bse0 -tzip -r -mx9 -mfb258 -mpass15 ^
    -x!Desktop.ini -x!Thumbs.db -x!.* -- *
IF ERRORLEVEL 1 PAUSE

POPD