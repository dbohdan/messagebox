#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <windows.h>

#define URL "https://msdn.microsoft.com/en-us/library/windows/desktop/ms645505\
(v=vs.85).aspx"
#define VERSION "0.1.0"

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE prevInstance, LPSTR lpCmdLine,
                   int nShowCmd)
{
    LPWSTR *szArgList;
    int argCount;

    szArgList = CommandLineToArgvW(GetCommandLineW(), &argCount);
    if (szArgList == NULL) {
        fprintf(stderr, "Unable to parse the command line.\n");
        return 255;
    }
    if (argCount < 3 || argCount > 4) {
        fprintf(stderr, "MessageBox v" VERSION "\n", szArgList[0]);
        fprintf(stderr, "Usage: %ls message title [type]\n\n", szArgList[0]);

        fprintf(stderr, "See\n" URL "\nfor the possible values of \"type\". "
                        "ERRORLEVEL is the return value.\n");
        return 255;
    }
    int type = _wtoi(szArgList[3]);
    int button = MessageBoxW(NULL, szArgList[1], szArgList[2], type);
    LocalFree(szArgList);
    return button;
}
