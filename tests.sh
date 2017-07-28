#! /bin/sh
messagebox="./messagebox.exe"

#-------------------------------------------------------------------------------

# Displayed buttons.
MB_ABORTRETRYIGNORE=2
MB_CANCELTRYCONTINUE=6
MB_OK=0
MB_OKCANCEL=1
MB_RETRYCANCEL=5
MB_YESNO=4
MB_YESNOCANCEL=3

# Icon.
MB_ICONEXCLAMATION=48
MB_ICONWARNING=48
MB_ICONINFORMATION=64
MB_ICONASTERISK=64
MB_ICONQUESTION=32
MB_ICONSTOP=16
MB_ICONERROR=16
MB_ICONHAND=16

# Default button.
MB_DEFBUTTON1=0
MB_DEFBUTTON2=256
MB_DEFBUTTON3=512
MB_DEFBUTTON4=768

# Other options.
MB_SETFOREGROUND=65536

# Result exit statuses.
IDOK=1
IDCANCEL=2
IDRETRY=4
IDABORT=3
IDIGNORE=5
IDYES=6
IDNO=7
IDTRYAGAIN=10
IDCONTINUE=11

#-------------------------------------------------------------------------------

test01() {
    if ! "$messagebox" 2>&1 | grep 'MessageBox v'; then
        echo "can't run $messagebox"
        exit 1
    fi
}

test02() {
    send_keys_after_delay enter &
    "$messagebox" World Hello "$MB_OK"
    expect_choice "$IDOK"
}

test03() {
    send_keys_after_delay enter &
    "$messagebox" foo bar "$MB_YESNO"
    expect_choice "$IDYES"
}

test04() {
    send_keys_after_delay tab enter &
    "$messagebox" foo bar "$MB_YESNO"
    expect_choice "$IDNO"
}

test05() {
    send_keys_after_delay tab enter &
    "$messagebox" foo bar "$((MB_YESNO + MB_DEFBUTTON2))"
    expect_choice "$IDYES"
}

test06() {
    send_keys_after_delay left left enter &
    "$messagebox" foo bar $((MB_ABORTRETRYIGNORE + MB_SETFOREGROUND))
    expect_choice "$IDRETRY"
}

test07() {
    send_keys_after_delay tab tab enter &
    "$messagebox" foo bar $((MB_ABORTRETRYIGNORE + MB_DEFBUTTON4))
    expect_choice "$IDIGNORE"
}

send_keys_after_delay() {
    sleep 0.2
    for key in "$@"; do
        "$sendkey" "$key"
    done
}

expect_choice() {
    choice="$?"
    if [ "$choice" -ne "$1" ]; then
        echo "Error: expected $1 but got $choice in $test."
        exit 1
    fi
}

run_tests() {
    for test in "$@"; do
        $test
    done
}

find_sendkey() {
    if [ -e ./sendkey.exe ]; then
        sendkey=./sendkey.exe
    else
        sendkey=sendkey.exe
    fi
    set -e
    "$sendkey"
    set +e
}

run_tests test01
if [ "$1" != "--nogui" ]; then
    find_sendkey
    run_tests test02 test03 test04 test05 test06 test07
fi
