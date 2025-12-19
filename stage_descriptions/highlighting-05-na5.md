In this stage, you'll add support for the `--color=auto` option.

### The `--color=auto` Option

The `--color=auto` option makes grep automatically decide whether to use highlighting based on where the output is going:

- If the output stream is a [TTY device](https://www.ibm.com/docs/en/aix/7.1.0?topic=communications-tty-terminal-device), like a terminal, highlighting is enabled.
- If the output is piped to another command or redirected to a non-TTY device, highlighting is disabled.

For example, when you run grep in your terminal, stdout is connected to a TTY and highlighting is enabled:

<html>
<pre>
$ echo -n "I have 3 cows" | ./your_program.sh --color=auto -E 'cows'
I have 3 <span style="font-weight:bold;color:red">cows</span>
</pre>
</html>

However, when you pipe the output to another command, stdout is no longer a TTY. In this case, grep detects this and disables highlighting:
```bash
$ echo -n "I have 3 apples" | ./your_program.sh --color=auto -E '\d' | hexdump -C
00000000  49 20 68 61 76 65 20 33  20 61 70 70 6c 65 73     |I have 3 apples|
0000000f
```

Notice there are no ANSI escape sequences in the output. It's just plain text.

The same thing happens when you redirect output to a file:
```bash
$ echo -n "I have 4 apples" | ./your_program.sh --color=auto -E '\d' > output.txt
$ hexdump -C output.txt
00000000  49 20 68 61 76 65 20 34  20 61 70 70 6c 65 73     |I have 4 apples|
0000000f
```

The `--color=auto` option is helpful because ANSI escape sequences might look like gibberish when viewed in text files or processed by other programs. By detecting the output destination, grep can provide colored output for humans while keeping the output clean for programs.

### Tests

The tester will execute your program in a terminal (TTY):

<html>
<pre>
$ echo -n "I have 4 cats" | grep --color=auto -E 'cats'
I have 4 <span style="color:red; font-weight:bold;">cats
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
$ echo -n "He has 9 rabbits" | grep --color=auto -E '\d' | another_command
```

If the input does not match the pattern, your program must:
- Exit with the code `1`.
- Exit with no printed output.

If the input text matches the pattern, your program must:
- Exit with the code `0`.
- Print the input text to the standard output.
- Ensure the output text does not contain highlight matches with ANSI sequences.

### Notes

- Most languages provide a way to check if stdout is a TTY: `isatty()` in C, `os.isatty(sys.stdout.fileno())` in Python, `System.console() != null` in Java, etc.
