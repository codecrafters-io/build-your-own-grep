In this stage, you'll add support for printing the matching lines.

### Printing the matching line

If a line from the standard input is matched, grep prints all the matching lines to the standard output.

Example usage:

```bash
$ echo -ne "caats\ndog\ncaaaats" | grep -E "ca+ts"
caats
caaaats
```

### Tests

The tester will execute your program like this:

```bash
$ echo -ne "dogs\ndog" | ./your_program.sh -E "dogs?"
dogs
dog
```

If none of the lines match the specified pattern, your program must:
- Exit with the code 1

If at least one line matches the specified pattern, your program must:
- Exit with the code 0
- Print all the matching lines to the standard output