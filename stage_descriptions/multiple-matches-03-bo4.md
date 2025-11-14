In this stage, you'll add support for processing multiple input lines to print all matching texts.

### Printing multiple matches from multiple lines

If there are multiple lines in the input, matches from all lines are printed, each on their own line.

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

### Tests

The tester will execute your program like this:

```bash
$ echo -e "jekyll and hyde\nmickey mouse" | ./your_program.sh -o -E "(jekyll|hyde|mouse)"
jekyll
hyde
mouse
```

If none of the lines match the specified pattern,
- Your program should exit with the code 1
- No output should be printed

If at least one line matches the pattern,
- Your program should exit with the code 0
- All the matching parts from all lines should be printed on their separate lines