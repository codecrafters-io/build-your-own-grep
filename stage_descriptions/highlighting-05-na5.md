Your program supports always-on and always-off color. In this stage, you'll add
`--color=auto` to choose between them based on whether stdout is connected to a
terminal.

### The `--color=auto` option

A TTY is an operating-system terminal interface. Check whether stdout is
attached to one to decide whether `--color=auto` should emit formatting:

- If the output stream is a
  [TTY device](https://www.ibm.com/docs/en/aix/7.1.0?topic=communications-tty-terminal-device),
  like a terminal, highlighting is enabled.
- If the output is piped to another command or redirected to a non-TTY device,
  highlighting is disabled.

For example, when you run grep in your terminal, stdout is connected to a TTY
and highlighting is enabled:

<html>
<pre>
$ echo -n "I have 3 cows" | ./your_program.sh --color=auto -E 'cows'
I have 3 <span style="font-weight:bold;color:red">cows</span>
</pre>
</html>

A pipe on stdin does not determine this choice. In the example above, input is
piped in but stdout still goes to the terminal. When you also pipe stdout to
another command, highlighting is disabled:

```bash
$ echo -n "I have 3 apples" | ./your_program.sh --color=auto -E '\d' | hexdump -C
00000000  49 20 68 61 76 65 20 33  20 61 70 70 6c 65 73 0a  |I have 3 apples.|
00000010
```

These dumps show a program that terminates the output line with a newline
(`0a`). There are no ANSI escape bytes in the output.

The same thing happens when you redirect output to a file:

```bash
$ echo -n "I have 4 apples" | ./your_program.sh --color=auto -E '\d' > output.txt
$ hexdump -C output.txt
00000000  49 20 68 61 76 65 20 34  20 61 70 70 6c 65 73 0a  |I have 4 apples.|
00000010
```

The `--color=auto` option is helpful because ANSI escape sequences might look
like gibberish when viewed in text files or processed by other programs. By
detecting the output destination, grep can provide colored output for humans
while keeping the output clean for programs.

### Tests

The tester will execute your program in a terminal (TTY):

<html>
<pre>
$ echo -n "I have 4 cats" | ./your_program.sh --color=auto -E 'cats'
I have 4 <span style="color:red; font-weight:bold;">cats</span>
</pre>
</html>

If the input does not match the pattern, your program must:

- Exit with the code `1`.

If the input text matches the pattern, your program must:

- Exit with the code `0`.
- Print the input text to the standard output.
- Highlight the matched text in the output.

The tester will also pipe your output to another command:

```bash
# Piping to another command
$ echo -n "He has 9 rabbits" | ./your_program.sh --color=auto -E '\d' | another_command
```

If the input does not match the pattern, your program must:

- Exit with the code `1`.
- Exit with no printed output.

If the input text matches the pattern, your program must:

- Exit with the code `0`.
- Print the input text to the standard output.
- Do not add ANSI escape sequences to the output.

### Notes

- Use a terminal check for stdout specifically. For example, C provides
  `isatty()` for a file descriptor, and Python provides
  `os.isatty(sys.stdout.fileno())`. A general console check such as Java's
  `System.console() != null` can differ from stdout's status when individual
  streams are redirected. Check the behavior of the API you use.
