@echo off
set path=C:\MinGW\bin;C:\MinGW\msys\1.0\bin
make test
if ERRORLEVEL 1 pause > nul
