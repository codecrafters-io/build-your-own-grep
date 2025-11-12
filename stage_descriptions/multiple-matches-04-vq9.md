In this stage, you'll add support for stopping the pattern search after a specified number of lines have been matched.

### The `-m` option

The `-m` option, also known as the `max-count` option, is used to stop the search after the specified number of lines have matched the pattern.

Example usage:

```bash
# Stop after 1 matching line has been found
$ echo -ne "line1_text11_text2\nline2\nline3_text33" | grep -m 1 -E '\d'
line1_text11_text2
```

### Tests

The tester will execute your program like this:

```bash
$ echo -e "line1\nline2\nline3" | ./your_program.sh -m 1 -E "pattern"
```

If none of the lines match the specified pattern

- The exit code of the program should be 1
- No output should be printed by the program

If at least one line matches the specified pattern:

- The exit code of the program should be 0
- All the matching lines should be printed
- There should not be more than the `max-count` number of lines in the output. The search should stop after encountering first `max-count` number of lines.

### Notes

- The tester will only test with a positive value of `max-count`. You don't need to implement the cases where the max count is zero or negative.