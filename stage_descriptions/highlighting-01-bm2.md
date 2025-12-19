In this stage, you'll add support for highlighting a single match.

### The `--color` Flag

The `--color` flag tells grep to highlight matching text in its output. It accepts three values:
- `always`: Always use colors
- `auto`: Use colors only when outputting to a terminal
- `never`: Never use colors

For this stage, you'll implement the `--color=always` option.

### Highlighting Matched Text

When a user passes the `--color=always` option, grep highlights the matched text by wrapping it with special formatting codes.

For example:

<html>
<pre>
$ echo -n "I have 1 apple" | ./your_program.sh --color=always -E '\d'
I have <span style="color: red; font-weight: bold;">1</span> apple
</pre>
</html>

The match ("1") appears in bold red in the terminal output.

### ANSI Escape Sequences

Grep uses [ANSI escape sequences](https://en.wikipedia.org/wiki/ANSI_escape_code) to add color to its output. These are special character sequences that terminals interpret as formatting commands rather than normal text. 

By default, grep uses bold red for the matched text.

To highlight matched text, you need to: 
1. Insert an opening sequence before the matched text to add style and color formatting.
2. Insert a closing sequence after the matched text to reset formatting back to normal.

You can make a matched text bold red by using the following ANSI escape sequences:

```bash
\033[01;31m
...
\033[m
```

Here’s a breakdown of the opening sequence (`\033[01;31m`): 

| Component | Meaning |
|-----------|---------|
| `\033` | Escape character that introduces the ANSI control sequence |
| `[` | Start marker for [Select Graphic Rendition (SGR)](https://vt100.net/docs/vt510-rm/SGR.html) parameters |
| `01;31` | SGR codes: `01` = bold/bright text, `31` = red foreground color (separated by `;`) |
| `m` | Terminates the SGR sequence |


For the closing sequence (`\033[m`): 

| Component | Meaning |
|-----------|---------|
| `\033` | Escape character that introduces the ANSI control sequence |
| `[` | Start marker for SGR parameters |
| *(empty)* | No parameters = reset all attributes to default |
| `m` | Terminates the SGR sequence |

For exmaple, to produce the following output:
<html>
<pre>
hello<span style="color:red; font-weight:bold" >matched</span>world
</pre>
</html>

You can use any of the following sequences:
```
hello\033[01;31mmatched\033[mworld
# OR
hello\033[31;01mmatched\033[mworld
```

### Tests

The tester will execute your program like this:

<html>
<pre>
$ echo -n "I have 3 apples" | ./your_program.sh --color=always -E '\d'
I have <span style="font-weight:bold; color:red;">3</span> apples
</pre>
</html>

If the input does not match the pattern, your program must:
- Exit with the code `1`.
- Exit with no printed output.

If the input text matches the pattern, your program must:
- Exit with the code `0`.
- Print the input text to the standard output.
- Highlight the matched text using grep's default color.

### Notes

* You only need to handle a single match in this stage. We'll handle multiple matches in later stages.
* The order of the SGR codes doesn't matter: `\033[31;01m` and `\033[01;31m` both produce the same bold red effect.
* You'll need to find the position of the match in the input string, then insert the opening sequence before it and the closing sequence after it.
