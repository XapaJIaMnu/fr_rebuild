#!/usr/bin/env python3
import sys
import typo

for line in sys.stdin:
    line = line.strip()
    typoline = typo.StrErrer(line).skipped_space().char_swap().missing_char().similar_char().random_space().result
    print(typoline)
