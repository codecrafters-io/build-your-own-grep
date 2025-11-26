In this stage, you'll add support for printing multiple input lines if they match the pattern.

### Printing Multiple Matching Lines

When grep receives multiple lines of input, it checks each line against the pattern and prints all lines that match.

For example:

```bash
$ echo -ne "line1\nline_two\nline3" | grep -E "\d"
line1
line3
```

Here, grep receives three lines of input. It prints `"line1"` and `"line3"` because they contain digits. `"line_two"` does not contain any digits, so it is not printed.

Grep's exit code indicates whether any matches were found:

- If at least one line matches the pattern, the program exits with code `0`.
- If no lines match the pattern, the program exits with code `1`.

### Tests

The tester will execute your program like this:

```bash
$ echo -ne "first_line\n2nd_line\n3rd_line" | ./your_program.sh -E "\d"
```

The tester will verify that:

- Your program prints all matching lines to stdout (one per line).
- Your program prints nothing if no lines match.
- Your program exits with code `0` if at least one line matches.
- Your program exits with code `1` if no lines match.
