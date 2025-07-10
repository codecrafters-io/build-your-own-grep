In this stage, you'll add support for searching the contents of a file with multiple lines.

## Multiple matches within a file

When searching through a multi-line file, `grep` processes each line individually and prints all matching lines to stdout, each on its own line. Example usage:

```bash
# This prints any lines that match search_pattern
$ grep -E "search_pattern" multi_line_file.txt
This is a line that matches search_pattern
This is another line that matches search_pattern
```

All matching lines are printed to stdout.

If any matching lines were found, grep exits with status code 0 (i.e. "success"). If no matching lines were found, grep exits with status code 1.

## Tests

The tester will create some test files and then execute multiple commands to find matches in those files. For example:

```bash
# Create test file
$ echo "banana" > fruits.txt
$ echo "grape" >> fruits.txt
$ echo "blackberry" >> fruits.txt
$ echo "blueberry" >> fruits.txt

# This must print the matched lines to stdout and exit with code 0
$ ./your_program.sh -E ".*berry" fruits.txt
blackberry
blueberry

# This must print nothing to stdout and exit with code 1
$ ./your_program.sh -E "carrot" fruits.txt
```

The tester will verify that all matching lines are printed to stdout. It'll also verify that the exit code is 0 if there are matching lines, and 1 if there aren't.

## Notes

- The file is guaranteed to exist and contain multiple lines
- Output should contain the full lines that match the pattern
