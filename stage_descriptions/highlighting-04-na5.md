In this stage, you'll add support for `auto` coloring option in the `--color` flag in your grep implementation.

### The `auto` color option

When `--color=auto` option is used with grep, it behaves in the following manner:

- If the output stream is a [TTY device](https://www.ibm.com/docs/en/aix/7.1.0?topic=communications-tty-terminal-device), like the terminal, highlighting is enabled.

- If the output stream is not a TTY device, for example, the output is piped to another command, or being redirected to a non-TTY device, highlighting is disabled.

Example usage:

<html>
<pre>
<code>$ echo -n "I have 3 cows" | grep --color=auto -E 'cows'
I have <span style="font-weight:bold;color:red">3</span> cows
$ echo -n "I have 4 cows" | grep --color=auto -E 'cows' >> /dev/tty
I have <span style="font-weight:bold;color:red">3</span> cows</code>
</pre>
</html>

The output text is highlighted in this case since the output in both cases is a TTY device.

When the output stream is piped to another command, or redirected to a non-TTY device, the ANSI highlighting sequences are not placed in the output text.

```bash
# Output stream is piped to another command
$ echo -n "apple123" | grep --color=auto -E '\d' | hexdump -C
00000000  61 70 70 6c 65 31 32 33  0a                       |apple123.|
00000009

# Output stream is redirected to a non-TTY device
$ echo -n "apple123" | grep --color=auto -E '\d' >> output.txt

$ hexdump -C output.txt
00000000  61 70 70 6c 65 31 32 33  0a                       |apple123.|
00000009
```

### Tests

The tester will execute your program like this:

<html>
<pre>
<code>$ echo -n "I have 4 cats" | grep --color=auto -E 'cats'
I have 4 <span style="color:red; font-weight:bold;">cats</span>
$ echo -n "I have 5 cats" | grep --color=auto -E 'cats' >> /dev/tty
I have 5 <span style="color:red; font-weight:bold;">cats</span></code>
</pre>
</html>

If the input does not match the pattern, your program must:
- Exit with the code 1

If the input text matches the pattern, your program must:
- Exit with the code 0
- Print the input text to the standard output
- The matched text in the output should be highlighted

The tester will also execute your program like this:

```bash
# Redirection to a non-tty device
$ echo -n "apple211" | grep --color=auto -E '\d' >> file.txt

# Piping to another command
$ echo -n "apple211" | grep --color=auto -E '\d' | another_command
```

For both of these cases,
If the input does not match the pattern, your program must:
- Exit with the code 1

If the input text matches the pattern, your program must exit with the code 0 and
- The input text should be written to the file `file.txt`, or be supplied to another command, depending on the case.
- The ANSI escape sequence for highlighting should not be present inside the file, or supplied to another command, depending on the case.

### Notes

- You might find it helpful to use the equivalent of [`isatty()`](https://man7.org/linux/man-pages/man3/isatty.3.html) function in your programming language to check whether the output stream is a TTY device.