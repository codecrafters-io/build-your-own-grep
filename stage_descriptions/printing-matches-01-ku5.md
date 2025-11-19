In this stage, you'll add support for printing a single input line if it matches the pattern.

### Printing the input line

If the input line matches the pattern, Grep prints the line to the standard output.

Example usage:

```bash
$ echo -n "apple" | ./your_program.sh -E "[^abc]"
apple
```

### Tests

The tester will execute your program like this:

```bash
$ echo -n "dog" | ./your_program.sh -E "dog$"
```

If the input line does not match the specified pattern, your program must:
- Exit with the code 1
- Exit with no printed output

If the input line matches the specified pattern, your program must:
- Exit with the code 0
- Print the input line to the standard output


### Notes

- The tester will only test against a single input line. You don't need to process multiple input lines in this stage. We'll get to that in the next stage.