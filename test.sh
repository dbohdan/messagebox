#! /bin/sh
# Test 01
./messagebox.exe 2>&1 | grep 'MessageBox v'

# Test 02
(sleep 0.2; sendkey.exe enter) &
./messagebox.exe World Hello 0; choice=$? || true
if [ "$choice" -ne 1 ]; then
    exit 1
fi
