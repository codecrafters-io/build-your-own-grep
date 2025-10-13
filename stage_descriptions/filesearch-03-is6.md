In this stage, you'll add support for searching the contents of multiple files.

### Searching Multiple Files

When searching multiple files, `grep` processes each file individually:

```bash
# This prints any lines that match search_pattern from multiple files
$ grep -E "search_pattern" file1.txt file2.txt
file1.txt:This is a line that matches search_pattern
file2.txt:Another line that matches search_pattern
```

This behavior is similar to searching a single file, but with a few differences:

- All matching lines are printed to stdout with a `<filename>:` prefix.
- The program exits with code `0` if any matching lines were found across all files.
- The program exits with code `1` if no matching lines were found in any file.

### Tests

The tester will create test files and search them using your program:

```bash
# Create test files
$ echo "banana" > fruits.txt
$ echo "blueberry" >> fruits.txt
$ echo "broccoli" > vegetables.txt
$ echo "carrot" >> vegetables.txt

# This must print the matched lines to stdout and exit with code 0
$ ./your_program.sh -E "b.*$" fruits.txt vegetables.txt
fruits.txt:banana
fruits.txt:blueberry
vegetables.txt:broccoli

# This must print nothing to stdout and exit with code 1
$ ./your_program.sh -E "missing_fruit" fruits.txt vegetables.txt
```

It will then verify that:

- All matching lines are printed to stdout with filename prefixes.
- The exit code is `0` if there are matching lines in any file.
- The exit code is `1` if there are no matching lines in any file.
