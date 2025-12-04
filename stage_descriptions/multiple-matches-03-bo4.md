In this stage, you'll add support for processing multiple input lines to print all matching texts.

### Printing Multiple Matches from Multiple Lines

When the input contains multiple lines, the `-o` flag prints all matches from all lines, with each match on its own line.

For example:

```bash
# The '\d' pattern matches 1 and 0 separately in multiple lines
$ echo -ne "Line1: 10\nLine2: 42" | grep -o -P '\d'
1
1
0
2
4
2

# The `\d\d` matches a pair of digits, so each pair (if found) is printed in its own line
$ echo -ne "Line01: 50\nLine02: 42" | grep -o -P '\d\d'
01
50
02
42
```

The output appears in the same order as the input: all matches from line 1, then all matches from line 2, and so on.

### Tests

The tester will execute your program like this:

```bash
$ echo -e "jekyll and hyde\nmickey mouse" | ./your_program.sh -o -E "(jekyll|hyde|mouse)"
jekyll
hyde
mouse
```

The tester will verify that:
- All matches from all lines are printed (one per line)
- Matches are printed in order (line by line, match by match)
- Your program exits with code `0` when at least one match is found
- Your program prints nothing and exits with code `1` when no matches are found
