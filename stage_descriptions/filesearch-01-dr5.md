The File Search extension lets your matcher search saved files instead of
standard input. In this stage, you'll read a file containing one line and print
that line if it matches.

### File search

When you give `grep` a file name as an argument, it searches through the lines
in the file:

```bash
# This prints any lines that match search_pattern
$ grep -E "search_pattern" any_file.txt
This is a line that matches search_pattern
```

When searching the file, `grep`:

- Prints each complete matching line to stdout.
- Exits with code `0` if any matching lines were found.
- Exits with code `1` if no matching lines were found.

For this stage, we'll only handle files that contain a single line. We'll handle
multi-line files in later stages.

Reuse the character classes, anchors and alternatives you already support. The
examples below also use `*`, which repeats the preceding element zero or more
times. Thus `.*` can match any number of non-newline characters. The Quantifiers
extension explores that operator further, but the new file-input and line-output
behavior is taught here.

### Tests

The tester will create test files and search them using your program:

```bash
# Create test file
$ echo "apple" > fruits.txt

# This must print the matched line to stdout and exit with code 0
$ ./your_program.sh -E "appl.*" fruits.txt
apple

# This must print nothing to stdout and exit with code 1
$ ./your_program.sh -E "carrot" fruits.txt
```

It will then verify that:

- All matching lines are printed to stdout.
- The exit code is `0` if there are matching lines.
- The exit code is `1` if there are no matching lines.

### Notes

- The file is guaranteed to exist and contain a single line.
- Your output should contain the full line that matches the pattern.
