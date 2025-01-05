echo off
cls
rem --- make sure the user specified valid drive letter (we allow A to H)
rem     for both the source and dest drives.
if %1a == a goto noDriveSpecified
if %1 == a: goto checkDest
if %1 == A: goto checkDest
if %1 == b: goto checkDest
if %1 == B: goto checkDest
if %1 == c: goto checkDest
if %1 == C: goto checkDest
if %1 == d: goto checkDest
if %1 == D: goto checkDest
if %1 == e: goto checkDest
if %1 == E: goto checkDest
if %1 == f: goto checkDest
if %1 == F: goto checkDest
if %1 == g: goto checkDest
if %1 == G: goto checkDest
if %1 == h: goto checkDest
if %1 == H: goto checkDest
goto notOnThatDrive
:checkDest
if %2a == a goto noDriveSpecified
if %1 == a: goto begin
if %1 == A: goto begin
if %1 == b: goto begin
if %1 == B: goto begin
if %2 == c: goto begin
if %2 == C: goto begin
if %2 == d: goto begin
if %2 == D: goto begin
if %2 == e: goto begin
if %2 == E: goto begin
if %2 == f: goto begin
if %2 == F: goto begin
if %2 == g: goto begin
if %2 == G: goto begin
if %1 == h: goto begin
if %1 == H: goto begin
:begin
echo ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                                                                       บ
echo บ                   LHX: ATTACK CHOPPER Installation                    บ
echo บ                                                                       บ
echo บ This will create a directory called %2\LHX on your destination disk,  บ
echo บ and will install LHX in that directory.                               บ
echo บ                                                                       บ
echo บ If you don't want to install LHX now, press Ctrl-Break.               บ
echo บ                                                                       บ
echo ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
pause

rem --- create \lhx on the current drive.
echo 
echo Creating directory %2\LHX...
if not exist %2\lhx\*.* goto go_on
rem --- \LHX dir already exists.
:directoryExists
echo 
echo There is already a \LHX directory on drive %2.  If you don't want to
echo install LHX: ATTACK CHOPPER into that directory, press Ctrl-Break.
echo Otherwise, press any key to install LHX: ATTACK CHOPPER into %2\LHX.
pause
goto go_on2
:go_on
md %2\lhx
:go_on2

rem --- make sure source drive contains Disk One
:1
if exist %1\lhx1.lib goto 2
echo 
echo Insert LHX Disk One in drive %1.
pause
goto 1
:2

rem --- if all files are on one disk, do one-disk install.
if exist %1\lhx4.lib goto oneDiskInstall

rem --- copy program disk files, including next batch file, to dest disk.
echo 
echo Copying LHX Disk One...
copy %1\*.* %2\lhx
if not exist %2\lhx\part_two.bat goto installationError

rem --- run next batch file
%2\lhx\part_two %1 %2

rem --- one-disk install (for 3.5" disk).
:oneDiskInstall
echo 
echo Copying LHX files...
copy %1\*.* %2\lhx
if not exist %2\lhx\lhx4.lib goto installationError

rem --- installation was successful!
:installDone
cd %2\lhx
echo 
echo LHX is now installed on your destination disk.  To run it, type "LHX".
%2
goto done

rem --- user didn't specify a drive letter followed by a colon.
:noDriveSpecified
echo 
echo Installation Error:  To install LHX, you must specify the drive
echo containing the floppies that you are installing FROM, and the drive
echo you are installing TO.  For example: if you are installing from
echo floppy drive A: to hard drive C:, then you should type
echo     INSTALL A: C:
echo ...and press Enter.
goto errorDone

rem --- user specified invalid drive letter.
:notOnThatDrive
echo 
echo Installation Error: Each drive letter must be a letter from A to H,
echo and must be followed by a colon.  For example, "INSTALL A: C:" will
echo install LHX from floppies on drive A: to hard drive C:.
goto errorDone

rem --- general installation error.
:installationError
echo 
echo Installation Error: Perhaps there isn't enough space on your destination
echo disk.  LHX installation requires at least 720k free space.
goto errorDone

rem --- goto here after an error is detected, to print a message and exit.
:errorDone
echo 
echo LHX was not installed correctly.
:done
