In this stage, you'll implement the `auto` coloring option as the default coloring option when the `--color` flag is not present.

### The default behavior

When the `--color` flag is not present, it is equivalent of using grep with the `--color=auto` option.

Example usage:

<html>
<pre>
<code>$ echo -n "I have 3 cows" | grep -E 'cows'
I have <span style="font-weight:bold;color:red">3</span> cows
</code>
</pre>
</html>

The output text is highlighted in this case.

When the output is piped to another command, or if it is being redirected to a file, the ANSI highlighting sequences are not present in the output text.

```bash
$ echo -n "I have 3 dogs" | grep -E '\d' | hexdump -C
00000000  49 20 68 61 76 65 20 33  20 64 6f 67 73 0a        |I have 3 dogs.|
0000000e
```

### Tests

The tester will execute your program like this:

```bash
$ echo -n "apple321" | grep -E '\d'
```

If the input does not match the pattern, your program must:
- Exit with the code 1

If the input text matches the pattern, your program must:
- Exit with the code 0
- Print the input text to the standard output
- The matched text in the output should be highlighted

The tester will also execute your program like this:

```bash
# Redirection to a file
$ echo -n "apple211" | grep -E '\d' >> file.txt

# Piping to another command
$ echo -n "apple211" | grep -E '\d' | another_command
```

For both of these cases,
If the input does not match the pattern, your program must:
- Exit with the code 1

If the input text matches the pattern, your program must exit with the code 0 and
- The input text should be written to the file `file.txt`, or be supplied to another command, depending on the case.
- The ANSI escape sequence for highlighting should not be present inside the file, or supplied to another command, depending on the case.