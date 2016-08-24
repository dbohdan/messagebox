# Batch MessageBox

[![AppVeyor CI build status](https://ci.appveyor.com/api/projects/status/github/dbohdan/messagebox?branch=master&svg=true)](https://ci.appveyor.com/project/dbohdan/messagebox)

This is a tiny hack to display message boxes from Windows batch files and
command line programs. There are many like it but I didn't find any that was
open source, non-copyleft and had no external dependencies like the .NET
Framework.

Another goal of this project is to create a framework that makes building
a simple Windows program with MinGW and running the tests for it surprisingly
easy and pleasant.

## Binary downloads

You can download a prebuilt .exe file from the
[Releases](https://github.com/dbohdan/messagebox/releases) page on GitHub.

## Use example

```batch
@echo off
chcp 65001 > nul
set MB_YESNO=4
set MB_ICONQUESTION=32
set MB_ICONINFORMATION=64
set IDYES=6
set /a type=%MB_YESNO% + %MB_ICONQUESTION%
messagebox "Shall we play a game?" "Helpful Computer" %type%
if "%ERRORLEVEL%"=="%IDYES%" messagebox "What a cliché answer!" "Helpful Computer" %MB_ICONINFORMATION%
```

See [demo.cmd](./demo.cmd) for more.

## Build requirements

* [MinGW](http://www.mingw.org/). You need to have the packages mingw32-base and
msys-base version 2013072200 installed in `C:\MinGW`.
* Optionally, [sendkey](http://www.f2ko.de/en/cmd.php) to run the tests.
Put `sendkey.exe` in the project directory (a clone of this repository) or any
directory that is in your `PATH`. To download `sendkey.exe` to the project
directory automatically, run `Download-SendKey.ps1` with PowerShell 2.0 or
later. This is better than downloading the file manually because the script will
verify its checksum.

Once you are done with the requirements run `build.cmd` to build
`messagebox.exe` and then `test.cmd` to test it.

## License

MIT.
