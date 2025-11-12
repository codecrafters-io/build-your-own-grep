In this stage, you'll add support for printing the count of matching lines.

### The `-c` option

The `-c` option, also known as the count option, is used to count the number of lines which match the specified pattern.

Example Usage:

```bash
# Two of the three lines contain a digit
echo -e "line1\nline2\nlinethree" | grep -c -E '\d'
2

# Both lines contain a digit
# Even though the first line contains multiple occurences of digit, this line is counted only once
echo -e "line1text1text2\nline2 | grep -c -E '\d'
2
```

### Tests

The tester will execute your program like this:

```bash
$ echo -e "line1\nline2\nline3" | ./your_program.sh -E "pattern"
```

If none of the lines match the specified pattern:

- The exit code of the program should be `1`.
- The output of the program should be `0`

If at least one line matches the specified pattern:

- The exit code of the program should be `0`.
- The output of the program should be the number of lines that match the pattern.
