In this stage, you'll add support for disabling the highlighting in your grep implementation using the `never` coloring option.

### The `--color=never` option

When a line is matched, grep only prints the matched line to the standard output. It does not highlight the matched text.

Example usage:

```bash
$ echo -n "Sally has 3 parrots" | grep --color=never -E "par+ots?"
Sally has 3 parrots
```

### Tests

The tester will execute your program like this:

```bash
$ echo -n "I have 5 vegetables" | grep --color=never -E '\d'
I have 5 vegetables
```

If the input matches the pattern, your program must:
- Exit with the code 0
- Print the input line to the standard output
- No highlights should be placed in the output text because `--color=never` option is being used.

If the input does not match the pattern, your program must:
- Exit with the code 1
- Exit with no printed output