@echo off
if "%1" == "" goto usage
md %1\eb >nul
echo Kopiere Dateien auf die Festplatte...
copy *.vol %1\eb >nul
copy eb.exe %1\eb >nul
copy install.exe %1\eb >nul
copy ebody.anl %1\eb >nul
copy info.txt %1\eb >nul
%1
cd \eb
install
echo 
echo Bitte geben Sie EB ein um das Spiel aufzurufen. 
echo F10-Taste bet„tigen um das Spiel zu beenden.
echo 
goto exit
:usage
echo Bitte geben Sie HDINST C: um electroBody in das Verzeichnis C:\EB
echo installieren zu lassen.
:exit
