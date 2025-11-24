In this stage, you'll add support for printing a single matching text to your grep implementation.

### The `-o` flag

The `-o` flag, also known as the `only-matching` flag, is used to print only the matching texts in a separate line.

Example usage:

```bash
$ echo -ne "I have one cow" | grep -o -E 'cow'
cow
```

### Tests

The tester will execute your program like this:

```bash
$ echo -n "The king had 7 daughters" | ./your_program.sh -o -E "\d"
7
```

If the input line does not match the specified pattern, your program must:
- Exit with the code 1
- Exit with no printed output

If the input line matches the specified pattern, your program must:
- Print the matched text to the standard output
- Exit with the code 0

### Notes

- You only need to handle a single line of input and a single occurence of the pattern. We'll get to printing multiple matches and processing multiple lines in the later stages.