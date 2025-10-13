In this stage, you'll add support for searching through files in a nested directory with the `-r` flag.

### Recursive Search

When `grep` is passed the `-r` flag, it searches through the given directory and its subdirectories recursively:

```bash
# This prints any lines that match search_pattern from multiple files
$ grep -r -E "search_pattern" directory/
directory/file1.txt:This is a line that matches search_pattern
directory/file2.txt:Another line that matches search_pattern
```

This behaviour is similar to searching multiple files:
- All matching lines are printed to stdout, but with a `<filepath>:` prefix instead of `<filename>:`.
- The program exits with code `0` if it finds any matching line in any of the files.
- The program exits with code `1` if it does not find any matching lines in any file.

### Tests

The tester will create test files in nested directories and search them using your program:

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

It will then verify that:

- All matching lines from all files in the directory tree are printed to stdout with filepath prefixes.
- The exit code is `0` if there are matching lines in any file.
- The exit code is `1` if there are no matching lines in any file.

### Notes

- GNU grep does not guarantee the order of its output. Instead, it processes files in the order they appear in the filesystem. Your `grep` can output matching lines in any order.
- The filepath prefix should be relative to the directory passed as an argument (e.g., `dir/subdir/file.txt`, not just `file.txt`).
