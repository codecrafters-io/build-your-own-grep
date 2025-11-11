In this stage, you'll implement the `auto` coloring option as the default coloring option when the `--color` flag is not present.

### The default behavior

When the `--color` flag is not present, it is equivalent of using grep with the `--color=auto` option.

Example usage:

<html>
<pre>
<code>$ echo -n "I have 3 cows" | grep -E 'cows'
I have <span style="font-weight:bold;color:red">3</span> cows
$ echo -n "I have 4 cows" | grep -E 'cows' >> /dev/tty
I have <span style="font-weight:bold;color:red">3</span> cows</code>
</pre>
</html>

The output text is highlighted in this case.

When the output stream is piped to another command, or redirected to a non-TTY device, the ANSI highlighting sequences are not placed in the output text.

```bash
# Output stream is piped to another command
$ echo -n "apple123" | grep -E '\d' | hexdump -C
00000000  61 70 70 6c 65 31 32 33  0a                       |apple123.|
00000009

# Output stream is redirected to a non-TTY device
$ echo -n "apple123" | grep -E '\d' >> output.txt

$ hexdump -C output.txt
00000000  61 70 70 6c 65 31 32 33  0a                       |apple123.|
00000009
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
# Redirection to a non-tty device
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