The Multiple Matches extension prints the matching portions of text with `-o`,
using your existing matcher to locate each match's start and end. In this stage,
you'll print one match from one input line.

### The `-o` flag

The `-o` flag, also known as the `only-matching` flag, is used to print only the
matching text in a separate line.

For example:

```bash
$ echo -ne "I have one cow" | grep -o -E 'cow'
cow
```

When grep finds a match with the `-o` flag:

1. Extract the substring that matched the pattern
2. Print that substring on its own line
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

- Your program prints only the matched text
- Your program exits with code `0` when a match is found
- Your program prints nothing and exits with code `1` when no match is found

### Notes

- You only need to handle a single line of input and a single occurrence of the
  pattern. We'll get to printing multiple matches and processing multiple lines
  in the later stages.
