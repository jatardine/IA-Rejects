echo off
REM this program installs for 3.5" disks only
REM test for existing F15 subdirectory
if EXIST c:\F15\start.exe goto ClearDir
if EXIST c:\F15\egame.exe goto ClearDir
if EXIST c:\F15\end.exe goto ClearDir
goto NewDir

:ClearDir
REM  this will clear the subdirectory C:\F15
cls
REM echo Please answer "Y" to following question, it clears out old F15 files
erase c:\F15\*.*<Y
goto CopyFiles

:NewDir
REM  this installs new F15 subdirectory; errorlevel 0 means success
MD C:\F15
if errorlevel 0 goto CopyFiles
cls
echo Error creating C:\F15 subdirectory, do not use INSTALL program.
echo You must install F15 manually. Sorry. 
goto End

:CopyFiles
REM  this copies files from floppies in to C:\F15

cls
echo Insert game disk into your A: disk drive, then...
PAUSE
copy A:*.* C:\F15
copy A:F15LOADR C:\F15.BAT

cls
goto End

:End
echo INSTALL FINISHED
echo Please ignore any "Batch file missing" message
erase c:\3install.bat
