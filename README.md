# Batch MessageBox

[![AppVeyor CI build status](https://ci.appveyor.com/api/projects/status/github/dbohdan/messagebox?branch=master&svg=true)](https://ci.appveyor.com/project/dbohdan/messagebox)

This is a tiny hack to display message boxes from Windows batch files and
command line programs. There are many like it but I didn't find any that was
open source, non-copyleft and had no external dependencies like the .NET
Framework.

Another goal of this project is to create a framework that makes building and
running the tests for a simple Windows program with MinGW surprisingly easy and
pleasant.

## Binary downloads

You can download a prebuilt .exe file on the
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

* [MinGW](http://www.mingw.org/) (mingw32-base version 2013072200);
* Optionally, msys-base 2013072200 and [sendkey](http://www.f2ko.de/en/cmd.php)
to run the tests. Put `sendkey.exe` in the repository directory or any directory
that is in your `PATH`.

Once you are done with that run `build.cmd` to build `messagebox.exe` and then
`test.cmd` to test it.

## License

MIT.
