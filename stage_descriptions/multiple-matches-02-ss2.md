In this stage, you'll add support for printing multiple matching texts from a single line to your grep implementation.


### Printing multiple matches

If there are multiple matches present in the same line, each of them are printed on a separate line.

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

If none of the lines match the specified pattern, your program must:
- Exit with the code 1
- Exit with no printed output

If at least one line matches the pattern, your program must

- Exit with the code 0
- Print all the matching parts to the standard output

### Notes

- You only need the handle the case of single input line. We'll get to processing multiple input lines in the next stage.