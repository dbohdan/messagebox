@echo off
set path=C:\MinGW\bin;C:\MinGW\msys\1.0\bin
make
if ERRORLEVEL 1 pause > nul
