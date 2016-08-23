@echo off
set path=C:\MinGW\bin;C:\MinGW\msys\1.0\bin;%path%

rem Process the command line arguments.
set flag_batch=0
set flag_build=0
set flag_clean=0
set flag_test=0
set test_args=
set error=0
for %%a in (%*) do (
    if "%%a"=="/batch" set flag_batch=1
    if "%%a"=="/build" set flag_build=1
    if "%%a"=="/clean" set flag_clean=1
    if "%%a"=="/nogui" set test_args=--nogui
    if "%%a"=="/test" set flag_test=1
)

if "%flag_clean%"=="1" (
    make clean
    if ERRORLEVEL 1 goto error
)
if "%flag_build%"=="1" (
    make
    if ERRORLEVEL 1 goto error
)
if "%flag_test%"=="1" (
    sh test.sh %test_args%
    if ERRORLEVEL 1 goto error
)
goto exit

:error
if "%flag_batch%"=="0" pause > nul
exit /b 1

:exit
exit /b 0
