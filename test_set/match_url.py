#!/usr/bin/env python3
import sys
import re
URL_REGEX=r'''https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-\w\d()@:%’_\+.~#?&//=,]*)'''

CORRECT=0
WRONG=0

with open(sys.argv[1], 'r', encoding='utf-8') as ref:
    with open(sys.argv[2], 'r', encoding='utf-8') as hyp:
        for line in ref:
            line2 = hyp.readline()
            urls1 = re.findall(URL_REGEX, line)
            urls2 = re.findall(URL_REGEX, line2)
            for url in urls1:
                if url in urls2:
                    CORRECT=CORRECT+1
                else:
                    WRONG = WRONG+1
print("Correct:", CORRECT)
print("WRONG:", WRONG)
print("Percentage CORRECT:", CORRECT/CORRECT+WRONG)
