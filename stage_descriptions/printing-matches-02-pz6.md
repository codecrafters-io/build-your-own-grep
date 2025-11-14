In this stage, you'll add support for printing multiple input lines if they match the pattern.

### Printing multiple input lines

If multiple input lines are provided, grep prints all the matching lines to the standard output.

Example usage:

```bash
$ echo -ne "line1\nline_two\nline3" | grep -E "\d"
line1
line3
```

### Tests

The tester will execute your program like this:

```bash
$ echo -ne "first_line\n2nd_line\n3rd_line" | ./your_program.sh -E "\d"
```

If none of the input lines match the specified pattern, your program must:
- Exit with the code 1
- Exit with no printed output

If at least one input line matches the specified pattern, 
- Exit with the code 0
- Print all the matching input lines to the standard output


### Notes

- You should print all the matching lines to the standard output.