In this stage, you'll add support for searching the contents of a file with multiple lines.

### Multiple matches within a file

When searching through a multi-line file, `grep` processes each line individually and prints all matching lines to stdout, each on its own line:

```bash
# This prints any lines that match search_pattern
$ grep -E "search_pattern" multi_line_file.txt
This is a line that matches search_pattern
This is another line that matches search_pattern
```

Just like with single-line files, grep:

- Prints all matching lines to stdout.
- Exits with code `0` if any matching lines were found.
- Exits with code `1` if no matching lines were found.

### Tests

The tester will create test files and search them using your program:

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

It will then verify that:

- All matching lines are printed to stdout.
- The exit code is `0` if there are matching lines.
- The exit code is `1` if there are no matching lines.

### Notes

- You'll need to read the file line by line and check each line independently against the pattern.
- The file is guaranteed to exist and contain multiple lines for this stage.
