echo off
cls
REM test for correct parameter
if %1 == 3 goto 3disk
if %1 == 5 goto 5disk
echo You must type "INSTALL 5" or "INSTALL 3" for correct installation.
goto End

REM set up for 3 1/2 installation and jump to that on hard disk
:3disk
copy a:3install.bat c:\
c:
cd\
3install

REM set up for 5 1/4 installation and jump to that on hard disk
:5disk
copy a:5install.bat c:\
c:
cd\
5install

:End
echo Installation halted, please try again
