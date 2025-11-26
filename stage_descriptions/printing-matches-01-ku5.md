In this stage, you'll add support for printing a single input line if it matches a pattern.

### Printing Matching Lines

When grep finds a match, it prints the entire input line to standard output.

For example:

```bash
$ echo -n "apple" | ./your_program.sh -E "[^abc]"
apple
$ echo -n "cab" | ./your_program.sh -E "[^abc]"
$
```

Here, grep prints the line `"apple"` because it matches the pattern `[^abc]` (contains characters that aren't a, b, or c). When grep receives `"cab"`, it doesn't match, so nothing is printed.

Grep also uses its exit code to indicate whether any matches were found:

- If the input line matches the pattern, the program exits with code `0` (success).
- If the input line does not match the pattern, the program exits with code `1` (no match).

### Tests

The tester will execute your program like this:

```bash
$ echo -n "dog" | ./your_program.sh -E "dog$"
```

The tester will verify that your program:
- Prints the input line to stdout when it matches.
- Prints nothing to stdout when it doesn't match.
- Exits with code `0` if the pattern matches.
- Exits with code `1` if the pattern doesn't match.

### Notes

- The tester will only test against a single input line. You don't need to process multiple input lines in this stage. We'll get to that in later stages.
