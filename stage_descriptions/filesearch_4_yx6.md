In this stage, you'll add support for searching through files in a given directory and its subdirectories recursively with the `-r` flag.

## Recursive search

When `grep` is passed the `-r` flag, it searches through the given directory and its subdirectories recursively. It processes each file line by line and prints all matching lines to stdout with a `<filename>:` prefix. Example usage:

```bash
# This prints any lines that match search_pattern from multiple files
$ grep -r -E "search_pattern" directory/
directory/file1.txt:This is a line that matches search_pattern
directory/file2.txt:Another line that matches search_pattern
```

Matching lines are printed to stdout with filename prefixes.

If any matching lines were found, grep exits with status code 0 (i.e. "success"). If no matching lines were found, grep exits with status code 1.

## Tests

The tester will create some test files and then multiple commands to find matches in those files. For example:

```bash
# Create test files
$ mkdir -p dir/subdir
$ echo "pear" > dir/fruits.txt
$ echo "strawberry" >> dir/fruits.txt
$ echo "celery" > dir/subdir/vegetables.txt
$ echo "carrot" >> dir/subdir/vegetables.txt
$ echo "cucumber" > dir/vegetables.txt
$ echo "corn" >> dir/vegetables.txt

# This must print the matched lines to stdout and exit with code 0
$ ./your_program.sh -r -E ".*er" dir/
dir/fruits.txt:strawberry
dir/subdir/vegetables.txt:celery
dir/vegetables.txt:cucumber

# This must print the matched lines to stdout and exit with code 0
$ ./your_program.sh -r -E ".*ar" dir/
dir/fruits.txt:pear
dir/subdir/vegetables.txt:carrot

# This must print nothing to stdout and exit with code 1
$ ./your_program.sh -r -E "missing_fruit" dir/
```

The tester will verify that all matching lines are printed to stdout. It'll also verify that the exit code is 0 if there are matching lines, and 1 if there aren't.

## Notes

- GNU grep doesn't guarantee the sorting order of output; it processes files in filesystem order. Your `grep` can output matching lines in any order.
- The filepath prefix is relative to the directory passed as an argument to the `-r` flag
