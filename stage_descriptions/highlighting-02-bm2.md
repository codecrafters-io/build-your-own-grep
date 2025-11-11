In this stage, you'll add support for highlighting the matched text in your grep implementation.

### Highlighting the matched text

When `--color=always` option is used with grep, it always highlights the matched text in its output.

Example usage:

<html>
<pre>
<code>$ echo -n "I have 1 apple" | grep --color=always -E '\d'
I have <span style="color: red; font-weight: bold;">1</span> apple</code>
</pre>
</html>

Grep uses [ANSI escape sequences](https://en.wikipedia.org/wiki/ANSI_escape_code) to add color to terminal output. These are special character sequences that terminals interpret as formatting commands rather than regular text.

The default color used by grep for the matched text is bold red. The ANSI escape sequence to be used for wrapping the matched text is:
```
\033[01;31m\033[K
...
\033[m\033[K
```

#### Opening Sequence: `\033[01;31m\033[K`

| Component | Meaning |
|-----------|---------|
| `\033` | Escape character that introduces the ANSI control sequence |
| `[` | Start marker for Select Graphic Rendition (SGR) parameters |
| `01;31` | SGR codes: `01` = bold/bright text, `31` = red foreground color (separated by `;`) |
| `m` | Terminates the SGR sequence |
|  |
| `\033` | Escape character that introduces the ANSI control sequence |
| `[` | Start marker for SGR parameters |
| `K` | Erase all characters to the right of the cursor |

#### Closing Sequence: `\033[m\033[K`

| Component | Meaning |
|-----------|---------|
| `\033` | Escape character that introduces the ANSI control sequence |
| `[` | Start marker for SGR parameters |
| *(empty)* | No parameters = reset all attributes to default |
| `m` | Terminates the SGR sequence |
|   |
| `\033` | Escape character that introduces the ANSI control sequence
| `[` | Start marker for SGR parameters |
| `K` | Erase all characters to the right of the cursor |

**Note:** When the SGR parameter is `0` or is not present (empty), it resets all attributes so that the rest of the text will be printed without any highlights.

### Tests

The tester will execute your program like this:

<html>
<pre>
<code>$ echo -n "I have 3 apples" | grep --color=always -E '\d'
I have <span style="font-weight:bold; color:red;">3</span> apples</code>
</pre>
</html>

If the input does not match the pattern, your program must:
- Exit with the code 1

If the input text matches the pattern, your program must:
- Exit with the code 0
- Print the input text to the standard output
- Highlight the matched text in the input using the grep's default color.

### Notes

- You can use any combination of the escape sequences as long as the matched text is highlighted using the bold (`01`) and red (`31`) attributes.