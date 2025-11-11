In this stage, you'll add support for printing the matched line in the standard output of your grep implementation.

### Printing matched line to the standard output

If a line from the standard intput is matched, grep prints the matched line to the standard output.

Example usage:

```bash
$ echo -n "caats" | grep -E "ca+ts"
caats
```

### Tests

The tester will execute your program like this:

```bash
$ echo -n "dogs" | ./your_program.sh -E "dogs?"
dogs
```

If the input matches the pattern, your program must:
- Exit with the code 0
- Print the input line to the standard output

If the input does not match the pattern, your program must:
- Exit with the code 1

### Notes

- You only need to print the matched line to the standard output. You don't need to highlight the matched text. We'll get to that in the later stages.