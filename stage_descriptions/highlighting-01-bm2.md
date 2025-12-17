In this stage, you'll add support for highlighting a single match in your grep implementation.

### Highlighting the matched text

When the `--color=always` option is used with grep, it highlights the matched text in its output.

Example usage:

<html>
<pre>
<code>$ echo -n "I have 1 apple" | grep --color=always -E '\d'
I have <span style="color: red; font-weight: bold;">1</span> apple</code>
</pre>
</html>

Grep uses [ANSI escape sequences](https://en.wikipedia.org/wiki/ANSI_escape_code) to add color to terminal output. These are special character sequences that terminals interpret as formatting commands rather than regular text.

The default color used by grep for the matched text is bold red. For example, the following ANSI escape sequences can be used for wrapping the matched text:

```
\033[01;31m
...
\033[m
```

**Exaple Opening Sequence: `\033[01;31m`**

| Component | Meaning |
|-----------|---------|
| `\033` | Escape character that introduces the ANSI control sequence |
| `[` | Start marker for [Select Graphic Rendition (SGR)](https://vt100.net/docs/vt510-rm/SGR.html) parameters |
| `01;31` | SGR codes: `01` = bold/bright text, `31` = red foreground color (separated by `;`) |
| `m` | Terminates the SGR sequence |

**Example Closing Sequence: `\033[m`**

| Component | Meaning |
|-----------|---------|
| `\033` | Escape character that introduces the ANSI control sequence |
| `[` | Start marker for SGR parameters |
| *(empty)* | No parameters = reset all attributes to default |
| `m` | Terminates the SGR sequence |

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
- Exit with no printed output

If the input text matches the pattern, your program must:
- Exit with the code 0
- Print the input text to the standard output
- Highlight the matched text using grep's default color.

### Notes

1. You only need to handle the case of a single match. We'll get to highlighting multiple matches in the later stages.

2. The matched text should be highlighted using the bold (`01`) and red (`31`) attributes. You may use any combination of ANSI codes to achieve this highlighting effect. For example, to produce the following output:

<html>
<pre>
<code>hello<span style="color:red; font-weight:bold" >matched</span>world</code>
</pre>
</html>

Any of the following sequences can be used:

```
hello\033[31;01mmatched\033[mworld
hello\033[01;31mmatched\033[mworld
```