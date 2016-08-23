#! /bin/sh
if [ -e ./sendkey.exe ]; then
    sendkey=./sendkey.exe
else
    sendkey=sendkey.exe
    set -e
    "$sendkey"
    set +e
fi

# Test 01
./messagebox.exe 2>&1 | grep 'MessageBox v'

# Test 02
(sleep 0.2; "$sendkey" enter) &
./messagebox.exe World Hello 0; choice=$? || true
if [ "$choice" -ne 1 ]; then
    exit 1
fi
