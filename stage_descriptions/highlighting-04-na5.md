In this stage, you'll add support for `auto` coloring option in the `--color` flag in your grep implementation.

### The `auto` color option

When `--color=auto` option is used with grep, it behaves in the following manner:

- If the output stream is piped to another command, or redirected to a file, highlighting is disabled.

- If the output stream is neither piped to another command, nor redirected to a file, highlighting is enabled.

Example usage:

<html>
<pre>
<code>$ echo -n "I have 3 cows" | grep --color=auto -E 'cows'
I have <span style="font-weight:bold;color:red">3</span> cows
</code>
</pre>
</html>

The output text is highlighted in this case.

When the output stream is piped to another command, or redirected to a file, the ANSI highlighting sequences are not placed in the output text.

```bash
# Output stream is piped to another command
$ echo -n "apple123" | grep --color=auto -E '\d' | hexdump -C
00000000  61 70 70 6c 65 31 32 33  0a                       |apple123.|
00000009

# Output stream is redirected to a file
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
</code>
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
# Redirection to a file
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