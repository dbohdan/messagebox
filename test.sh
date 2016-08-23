#! /bin/sh

test01() {
    ./messagebox.exe 2>&1 | grep 'MessageBox v'
}

test02() {
    (sleep 0.2; "$sendkey" enter) &
    ./messagebox.exe World Hello 0; choice=$? || true
    if [ "$choice" -ne 1 ]; then
        exit 1
    fi
}

find_sendkey() {
    # Find sendkey.exe
    if [ -e ./sendkey.exe ]; then
        sendkey=./sendkey.exe
    else
        sendkey=sendkey.exe
        set -e
        "$sendkey"
        set +e
    fi
}

test01

if [ "$1" != "--nogui" ]; then
    find_sendkey
    test02
fi
