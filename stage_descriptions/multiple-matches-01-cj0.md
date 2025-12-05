In this stage, you'll add support for printing a single matching text.

### The `-o` Flag

The `-o` flag, also known as the `only-matching` flag, is used to print only the matching text in a separate line.

For example:

```bash
$ echo -ne "I have one cow" | grep -o -E 'cow'
cow
```

When grep finds a match with the `-o` flag:
1. Extract the substring that matched the pattern
2. Print only that substring (not the entire line)
3. Exit with code `0`

When no match is found:
1. Print nothing
2. Exit with code `1`

### Tests

The tester will execute your program like this:

```bash
$ echo -n "The king had 7 daughters" | ./your_program.sh -o -E "\d"
7
```

The tester will verify that:
- Your program prints only the matched text (not the entire line)
- Your program exits with code `0` when a match is found
- Your program prints nothing and exits with code `1` when no match is found

### Notes

- You only need to handle a single line of input and a single occurrence of the pattern. We'll get to printing multiple matches and processing multiple lines in the later stages.
