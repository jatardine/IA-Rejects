@echo off
cls

if "%1" == "" goto noDrive
if "%2" == "" goto noDrive

if %1 == a: goto sourceOk
if %1 == A: goto sourceOk
if %1 == b: goto sourceOk
if %1 == B: goto sourceOk

echo %1 is an invalid drive name.
goto end

:sourceOk
if %2 == c: goto ok
if %2 == C: goto ok
if %2 == d: goto ok
if %2 == D: goto ok
if %2 == e: goto ok
if %2 == E: goto ok
if %2 == f: goto ok
if %2 == F: goto ok
if %2 == g: goto ok
if %2 == G: goto ok
if %2 == h: goto ok
if %2 == H: goto ok
if %2 == i: goto ok
if %2 == I: goto ok
if %2 == j: goto ok
if %2 == J: goto ok
if %2 == k: goto ok
if %2 == K: goto ok
if %2 == l: goto ok
if %2 == L: goto ok
if %2 == m: goto ok
if %2 == M: goto ok
if %2 == n: goto ok
if %2 == N: goto ok
if %2 == o: goto ok
if %2 == O: goto ok
if %2 == p: goto ok
if %2 == P: goto ok

echo %2 is an invalid drive name.
goto end

:noDrive
echo Please specify which drive to install "Crown" on.
echo for example:
echo 
echo         install a: c:
echo 
echo installs "Crown" from drive a: on drive c:.
goto end

:ok
echo This program will install all files into a directory
echo called "CROWN" on drive %2.  If you do not wish
echo to do this, then press Ctrl-C now.
pause
echo 

if exist %2\CROWN\*.* goto copyAll
mkdir %2\CROWN
:copyAll
echo Copying files to %2\CROWN...
copy %1\*.* %2\CROWN > NUL

%2
cd %2\CROWN
inst2 %1 %2

goto end

:end
echo 

