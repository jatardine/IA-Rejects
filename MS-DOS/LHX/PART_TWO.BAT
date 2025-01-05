rem --- make sure drive %1 contains Disk Two.
:3
if exist %1\lhx4.lib goto 4
cls
echo Insert LHX Disk Two in drive %1.
pause
goto 3
:4

rem --- copy Disk Two files to the destination disk.
echo 
echo Copying LHX Disk Two...
copy %1\*.* %2\lhx
if not exist %2\lhx\lhx4.lib goto installationError

rem --- installation was successful!
:installDone
cd %2\lhx
echo 
echo LHX is now installed on your destination disk.  To run it, type "LHX".
%2
goto done

rem --- general installation error.
:installationError
echo 
echo Installation Error: Perhaps there isn't enough space on your destination
echo disk.  LHX installation requires at least 720k free space.
goto errorDone

rem --- goto here after an error is detected, to print a message and exit.
:errorDone
echo LHX was not installed correctly.

:done

