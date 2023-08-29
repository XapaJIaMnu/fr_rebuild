#!/usr/bin/env python3
import sys

for line in sys.stdin:
    newline = ""
    for char in line:
        if ord(char) > 255:
            newline = newline + char
    print(newline)
