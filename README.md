# Batch MessageBox

[![AppVeyor CI build status](https://ci.appveyor.com/api/projects/status/github/dbohdan/messagebox?branch=master&svg=true)](https://ci.appveyor.com/project/dbohdan/messagebox)

This is a tiny hack to display message boxes from Windows batch files and
command line programs. There are many like it but I didn't find any that was
open source, non-copyleft and had no external dependencies like the .NET
Framework.

<s>Another goal of this project is to create a framework that makes building
a simple Windows program with MinGW and running the tests for it surprisingly
easy and pleasant.</s> Never mind that; use MSYS2. (The old build scripts are
preserved in the branch
[mingw](https://github.com/dbohdan/messagebox/tree/mingw).)

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

* [MSYS2](https://msys2.github.io/);
* Optionally, [sendkey](http://www.f2ko.de/en/cmd.php) to run the tests.

Install MSYS2 then start the 32-bit MinGW shell (with `C:\msys32\mingw32.exe` or
`C:\msys64\mingw32.exe` in an up-to-date MSYS2 installation) and run
the following commands:

```sh
pacman --sync --noconfirm git make mingw-w64-i686-gcc wget
git clone http://github.com/dbohdan/messagebox
cd messagebox
make
make sendkey.exe # Download sendkey.exe and verify its checksum.
make test
```

## License

MIT.
