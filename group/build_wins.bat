@ECHO OFF & SETLOCAL ENABLEEXTENSIONS DISABLEDELAYEDEXPANSION
PUSHD %~dp0

SET "VARIANT=%~1"
IF [%VARIANT%] == [] SET "VARIANT=deb"

ECHO Warnings disabled for batch build:
ECHO -- use VC++ to build with warnings
ECHO:
SET "USERDEFS= /noover /w "
CMD /C makmake inform6 wins
nmake /NOLOGO /S /F INFORM6.WINS %VARIANT%

REM # return the errorlevel of NMAKE,
REM # instead of the POPD
REM #
POPD & EXIT /B %ERRORLEVEL%
