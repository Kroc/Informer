@ECHO OFF
CD %~dp0

ECHO Make work directories:
CMD /C makmake -makework inform6 wins
ECHO OK
ECHO Make Visual C++ Project:
CMD /C makmake inform6 vc5
ECHO OK

PAUSE