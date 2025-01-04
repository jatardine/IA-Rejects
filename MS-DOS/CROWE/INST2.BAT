@echo off
cls
:loop
echo Please insert "Disk 2" in Drive %1
pause
echo 
if exist %1\246.dat goto copy2
goto loop

:copy2
echo Copying files to %2\CROWN...
copy %1\*.* %2\CROWN > NUL

cls
echo To run "CROWN", enter
echo 
echo          %2
echo          CD \CROWN
echo          CROWN
:end
echo 

