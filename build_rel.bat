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

ECHO * Copy PunyInform Library...

COPY /Y "PunyInform\lib\*.h"            "release\lib"
COPY /Y "PunyInform\releasenotes.txt"   "release\lib\releasenotes.txt"
COPY /Y "PunyInform\LICENSE"            "release\licences\puny-licence.txt"
COPY /Y "PunyInform\*.inf"              "release\howto"
REM # (the test-bench will never run in the RAM limits of a Psion)
DEL /F /Q "release\howto\testbench.inf"  >NUL 2>NUL
COPY /Y "PunyInform\howto\*.inf"        "release\howto"
COPY /Y "PunyInform\documentation\PunyInformQuickRef_*.md" ^
					"release\QuickRef.txt"

ECHO:
ECHO * Make release bundle...

SET "BIN_ZIP=bin\7zip\7za.exe" 
PUSHD "release"

REM # copy over the compiled executable into the release folder
COPY /Y "\EPOC32\Release\MARM\Rel\INFORM6.EXE" /B "inform6.exe" /B  >NUL

REM # remove the old release ZIP file
DEL /F /Q "inform6*.zip"  >NUL 2>NUL

..\%BIN_ZIP% a "inform636-epoc32-puny34.zip" ^
    -bso0 -bsp1 -bse0 -tzip -r -mx9 -mfb258 -mpass15 ^
    -x!Desktop.ini -x!Thumbs.db -x!.* -- *
IF ERRORLEVEL 1 PAUSE

POPD