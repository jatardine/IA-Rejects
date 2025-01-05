@echo off
dosinfo.exe
echo off
mkdir c:\indy3
echo - Kopieren der Dateien von Indiana Jones -- Graphic Adventure.
:disk1
if exist a:disk1.id goto cpdisk1
echo - Bitte Disk 1 einlegen und eine Taste drcken.
pause > nul
goto disk1
:cpdisk1
echo - Ich kopiere Disk 1 in c:
copy a:*.* c:\indy3 > nul
:disk2
if exist a:disk2.id goto cpdisk2
echo - Bitte Disk 2 einlegen und eine Taste drcken.
pause > nul
goto disk2
:cpdisk2
echo - Ich kopiere Disk 2 in c:
copy a:*.* c:\indy3 > nul
:disk3
if exist a:disk3.id goto cpdisk3
echo - Bitte Disk 3 einlegen und eine Taste drcken.
pause > nul
goto disk3
:cpdisk3
echo - Ich kopiere Disk 3 in c:
copy a:*.* c:\indy3 > nul
cls
echo --
echo - Installation von Indiana Jones in c:\INDY3 beendet.
echo --
c:
cd \dos
:end

