import sys
import os

from dataclasses import dataclass

# import pyparsing - available if you need it!
# import lark - available if you need it!

if sys.argv[1] != "-E":
    print("Expected first argument to be '-E'")
    os.exit(1)

pattern = sys.argv[2]
input = sys.stdin.read()

if len(pattern) == 1:
    if input.count(pattern) > 0:
        os.exit(0)
    else:
        os.exit(1)
else:
    print(f"Unhandled pattern: {pattern}")
