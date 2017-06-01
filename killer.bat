@echo off
color 0a
cls
title Procces Closer
:ANA
set /a sayim=0
echo. >procces.txt
echo =============%time%-%date%===================== >> log.txt
echo =============START===================== >> log.txt
call :MAIN >> log.txt
echo =============END===================== >> log.txt
echo =============%time%-%date%===================== >> log.txt
for /f "tokens=1" %%a in (procces.txt) do call :SAYIM %%a
echo %sayim% Kadar islem Kapatildi.
echo. >procces.txt
pause > nul | echo Devam Etmek Icin Bir Tusa Basin Cikmak Istiyorsaniz Pencereyi Kapatin.
clear
goto ANA
:SAYIM
set /a sayim=sayim + 1
echo %sayim%-%1
goto :EOF
:MAIN
FOR /f "tokens=1,2,3" %%a in ('tasklist') do call :KILLER %%a %%b %%c
for /f "tokens=1" %%a in (procces.txt) do call :SAYIM %%a
echo %sayim% kadar islem Kapandi
set /a sayim=0
:KILLER
set iptal=0
for /f "tokens=*" %%a in (harici.txt) do if "%%a"=="%1" set iptal=1
if "%iptal%"=="1" goto :EOF
echo %1 / %2 / %3 Sonlaniyor
taskkill /PID %2 /F
if "%ERRORLEVEL%"=="0" call :yazdir %1
goto :EOF
:yazdir
if "%1"==" " GOTO :EOF
if "%1"=="" goto :EOF
echo %1 >> procces.txt