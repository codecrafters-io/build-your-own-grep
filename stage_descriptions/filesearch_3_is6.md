In this stage, you'll add support for searching the contents of multiple files.

## Searching multiple files

When searching multiple files, `grep` processes each file individually and prints all matching lines to stdout with a `<filename>:` prefix. Example usage:

```bash
# This prints any lines that match search_pattern from multiple files
$ grep -E "search_pattern" file1.txt file2.txt
file1.txt:This is a line that matches search_pattern
file2.txt:Another line that matches search_pattern
```

Matching lines are printed to stdout with filename prefixes.

If any matching lines were found, grep exits with status code 0 (i.e. "success"). If no matching lines were found, grep exits with status code 1.

## Tests

The tester will create some test files and then execute multiple commands to find matches in those files. For example:

```bash
# Create test files
$ echo "banana" > fruits.txt
$ echo "blueberry" >> fruits.txt
$ echo "broccoli" >> vegetables.txt
$ echo "carrot" >> vegetables.txt

# This must print the matched lines to stdout and exit with code 0
$ ./your_program.sh -E "b.*$" fruits.txt vegetables.txt
fruits.txt:banana
fruits.txt:blueberry
vegetables.txt:broccoli

# This must print nothing to stdout and exit with code 1
$ ./your_program.sh -E "missing_fruit" fruits.txt vegetables.txt
```

The tester will verify that all matching lines are printed to stdout. It'll also verify that the exit code is 0 if there are matching lines, and 1 if there aren't.
