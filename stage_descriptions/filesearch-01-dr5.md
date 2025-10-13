In this stage, you'll add support for searching the contents of a file with a single line.

### File Search

When `grep` is given a file as an argument, it searches through the lines in the file and prints out matching lines:

```bash
# This prints any lines that match search_pattern
$ grep -E "search_pattern" any_file.txt
This is a line that matches search_pattern
```

When searching a file, grep:
- Prints each matching line to stdout (the complete line, not just the matched part).
- Exits with code `0` if any matching lines were found.
- Exits with code `1` if no matching lines were found.

For this stage, we'll test searching through a file that contains a single line. We'll handle multi-line files in later stages.

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
