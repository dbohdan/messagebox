@echo off

rem Displayed buttons.
set MB_ABORTRETRYIGNORE=2
set MB_CANCELTRYCONTINUE=6
set MB_OK=0
set MB_OKCANCEL=1
set MB_RETRYCANCEL=5
set MB_YESNO=4
set MB_YESNOCANCEL=3

rem Icon.
set MB_ICONEXCLAMATION=48
set MB_ICONWARNING=48
set MB_ICONINFORMATION=64
set MB_ICONASTERISK=64
set MB_ICONQUESTION=32
set MB_ICONSTOP=16
set MB_ICONERROR=16
set MB_ICONHAND=16

rem Default button.
set MB_DEFBUTTON1=0
set MB_DEFBUTTON2=256
set MB_DEFBUTTON3=512
set MB_DEFBUTTON4=768

rem Other options.
set MB_SETFOREGROUND=65536

rem Result ERRORLEVELs.
set IDOK=1
set IDCANCEL=2
set IDRETRY=4
set IDABORT=3
set IDIGNORE=5
set IDYES=6
set IDNO=7
set IDTRYAGAIN=10
set IDCONTINUE=11

rem ----------------------------------------------------------------------------

setlocal ENABLEDELAYEDEXPANSION

set /a type=!MB_YESNO! + !MB_ICONQUESTION! + !MB_DEFBUTTON2!
messagebox "Enough message boxes?" "A serious question" !type!
rem The following is less error-prone than 'if errorlevel "!IDNO!"'.
if "!ERRORLEVEL!"=="!IDYES!" (
    echo No more message boxes for you, then.
    pause > nul
) else (
    set /a type=!MB_OK! + !MB_ICONINFORMATION!
    messagebox "Okay, here's another one^!" "MessageBox the Second" !type!
)
