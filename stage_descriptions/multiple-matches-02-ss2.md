In this stage, you'll add support for printing multiple matching texts from a single line.

### Printing multiple matches

When a single line contains multiple matches for a pattern, the `-o` flag prints each match on its own line.

For example:

```bash
# The '\d' pattern matches 1 and 0 separately
$ echo -n "The king had 10 children" | grep -o -P '\d'
1
0

# The `\d\d` matches a pair of digits, so each pair (if found) is printed in its own line
$ echo -n "The king had 10 children" | grep -o -P '\d\d'
10
```

### Tests

The tester will execute your program like this:

```bash
$ echo -e "jekyll and hyde" | ./your_program.sh -o -E "(jekyll|hyde)"
jekyll
hyde
```

The tester will verify that:
- All matches from the line are printed (one per line)
- Your program exits with code `0` when at least one match is found
- Your program prints nothing and exits with code `1` when no matches are found
  
### Notes

- You only need to handle the case of a single input line. We will get to processing multiple input lines in later stages.
