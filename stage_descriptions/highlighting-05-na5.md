In this stage, you'll add support for `auto` coloring option in the `--color` flag in your grep implementation.

### The `auto` color option

When `--color=auto` option is used with grep, it behaves in the following manner:

- If the output stream is a [TTY device](https://www.ibm.com/docs/en/aix/7.1.0?topic=communications-tty-terminal-device), like the terminal, highlighting is enabled.

- If the output stream is not a TTY device, for example, the output is piped to another command, or being redirected to a non-TTY device, highlighting is disabled.

Example usage:

<html>
<pre>
<code>$ echo -n "I have 3 cows" | grep --color=auto -E 'cows'
I have <span style="font-weight:bold;color:red">3</span> cows</code>
</pre>
</html>

The output text is highlighted in this case since the output stream is a TTY device.

When the output stream is piped to another command, or redirected to a non-TTY device, the ANSI highlighting sequences are not placed in the output text.

```bash
# Output stream is piped to another command
$ echo -n "I have 3 apples" | grep --color=auto -E '\d' | hexdump -C
00000000  49 20 68 61 76 65 20 33  20 61 70 70 6c 65 73 0a  |I have 3 apples.|
00000010

# Output stream is redirected to a non-TTY device
$ echo -n "I have 4 apples" | grep --color=auto -E '\d' >> output.txt

$ hexdump -C output.txt
00000000  49 20 68 61 76 65 20 34  20 61 70 70 6c 65 73 0a  |I have 4 apples.|
00000010
```

### Tests

The tester will execute your program like this inside a TTY:

<html>
<pre>
<code>$ echo -n "I have 4 cats" | grep --color=auto -E 'cats'
I have 4 <span style="color:red; font-weight:bold;">cats</span>
</code>
</pre>
</html>

If the input does not match the pattern, your program must:
- Exit with the code 1

If the input text matches the pattern, your program must:
- Exit with the code 0
- Print the input text to the standard output
- The matched text in the output should be highlighted because the

The tester will also execute your program like this:

```bash
# Piping to another command
$ echo -n "He has 9 rabbits" | grep --color=auto -E '\d' | another_command
```

For both of these cases,
If the input does not match the pattern, your program must:
- Exit with the code 1
- Exit with no printed output

If the input text matches the pattern, your program must exit with the code 0 and
- The output text should be supplied to another command.
- The output text should not contain the ANSI sequences used for highlighting the matches.

### Notes

- You might find it helpful to use the equivalent of [`isatty()`](https://man7.org/linux/man-pages/man3/isatty.3.html) function in your programming language to check whether the output stream is a TTY device.