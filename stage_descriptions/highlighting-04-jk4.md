In this stage, you'll add support for disabling the highlighting in your grep implementation using the `never` coloring option.

### The `--color=never` option

When a user passes the `--color=never` option:
- Matching lines are still printed.
- No ANSI escape sequences are added.
- The output is plain text without any formatting.

This is essentially the behavior from earlier stages before you added highlighting support.

For example:

```
$ echo -n "Sally has 3 parrots" | grep --color=never -E "par+ots?"
Sally has 3 parrots
```

### Tests

The tester will execute your program like this:

```
$ echo -n "I have 5 vegetables" | grep --color=never -E '\d'
I have 5 vegetables
```

The tester will verify that:
- Matching lines are printed without any ANSI escape sequences.
- The output is plain text.
- Your program exits with code `0` when a match is found.
- Your program prints nothing and exits with code `1` when no match is found.
