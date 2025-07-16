In this stage, you'll add support for searching the contents of a file with a single line.

## File Search

When `grep` is given a file as an argument, it searches through the lines in the file and prints out matching lines. Example usage:

```bash
# This prints any lines that match search_pattern
$ grep -E "search_pattern" any_file.txt
This is a line that matches search_pattern
```

Matching lines are printed to stdout.

If any matching lines were found, grep exits with status code 0 (i.e. "success"). If no matching lines were found, grep exits with status code 1.

In this stage, we'll test searching through a file that contains a single line. We'll get to handling multi-line files in later stages.

## Tests

The tester will create some test files and then execute multiple commands to find matches in those files. For example:

```bash
# Create test file
$ echo "apple" > fruits.txt

# This must print the matched line to stdout and exit with code 0
$ ./your_program.sh -E "appl.*" fruits.txt
apple

# This must print nothing to stdout and exit with code 1
$ ./your_program.sh -E "carrot" fruits.txt
```

The tester will verify that all matching lines are printed to stdout. It'll also verify that the exit code is 0 if there are matching lines, and 1 if there aren't.

## Notes

- The file is guaranteed to exist and contain a single line
- Output should contain the full line that matches the pattern
