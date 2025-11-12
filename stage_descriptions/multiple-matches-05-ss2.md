In this stage, you'll add support for printing only the matching texts.

### The `-o` flag

The `-o` flag, also known as the `only-matching` flag, is used to print only the matching texts in a separate line.

Example usage:

```bash
# The `\d` matches each digit separately, so each digit (if found) is printed in its own line
$ echo -ne "line1_text11_text2\nline2\nline3_text33" | grep -o -E '\d'
1
1
1
2
2
3
3
3

# The `\d\d` matches a pair of digits, so each pair (if found) is printed in its own line
$ echo -ne "line1_text11_text2\nline2\nline3_text33" | grep -o -E '\d\d'
11
33

# Each match is printed in its own line
$ echo -ne "I have 4 cows and 9 cats\nHe has 3 cats" | grep -o -E '\d (cows|cats)'
4 cows
9 cats
3 cats
```

### Tests
The tester will execute your program like this:

```bash
$ echo -e "line1\nline2\nline3" | ./your_program.sh -o -E "pattern"
```

If none of the lines match the specified pattern,

- Your program should exit with the code 1
- No output should be printed

If at least one line matches the pattern,

- Your program should exit with the code 0
- All the matching parts should be printed in their separate line