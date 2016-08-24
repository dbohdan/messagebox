@echo off
set mingw_path=
set msys_path=

rem Process the command line arguments.
set flag_batch=0
set flag_build=0
set flag_clean=0
set flag_test=0
set test_args=
for %%a in (%*) do (
    if "%%a"=="/batch" set flag_batch=1
    if "%%a"=="/build" set flag_build=1
    if "%%a"=="/clean" set flag_clean=1
    if "%%a"=="/nogui" set test_args=--nogui
    if "%%a"=="/test" set flag_test=1
)

rem Determine the path to MinGW and MSYS (as needed).
setlocal ENABLEDELAYEDEXPANSION
if "%flag_build%"=="1" (
    if "%mingw_path%"=="" (
        if exist C:\MinGW\bin (
            set mingw_path=C:\MinGW\bin
        ) else if exist C:\tools\mingw32\bin (
            set mingw_path=C:\tools\mingw32\bin
        ) else (
            echo Error: can't find a MinGW installation.
            echo You can set the path manually in %0.
            goto error
        )
    )
    set path=!mingw_path!;!path!
)

if "%flag_test%"=="1" (
    if "%msys_path%"=="" (
        if exist C:\MinGW\msys\1.0\bin (
            set msys_path=C:\MinGW\msys\1.0\bin
        ) else (
            echo Error: can't find an MSYS installation.
            echo You can set the path manually in %0.
            goto error
        )
    )
    set path=!msys_path!;!path!
)

rem Perform the requested actions.
if "%flag_clean%"=="1" (
    del messagebox.exe *.o
    if ERRORLEVEL 1 goto error
)
if "%flag_build%"=="1" (
    make
    if ERRORLEVEL 1 goto error
)
if "%flag_test%"=="1" (
    sh tests.sh %test_args%
    if ERRORLEVEL 1 goto error
)
goto exit

:error
if "%flag_batch%"=="0" pause > nul
exit /b 1

:exit
exit /b 0
