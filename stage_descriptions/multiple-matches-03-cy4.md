In this stage, you'll add support for displaying the line numbers of the matching lines.

### The `-n` option

The `-n` option, also known as the `line number` option, is used to display the line number of each matching line.

Example usage:

```bash
$ echo -ne "dogs\ncat\ndog" | grep -n -E "dogs?"
1:dogs
3:dog
```

When the -n option is used, the output is the line number, followed by a colon, followed by that line's text.

### Tests

The tester will execute your program like this:

```bash
$ echo -e "line1\nline2\nline3" | ./your_program.sh -n -E "pattern"
```

If none of the lines match the specified pattern:

- The exit code of your program should be 1.
- No output should be produced by the program to the standard output.

If at least one line matches the specified pattern:

- The exit code of your program should be 0.
- All the matching lines should be printed, each preceded by its number and a colon separator.

### Notes

1. The line numbering starts from 1, not 0.