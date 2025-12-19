In this stage, you'll add support for highlighting matches in multiple lines.

### Highlighting Matches in Multiple Lines

When grep processes multiple lines:
- Each line is processed independently
- Only lines that contain at least one match are printed
- All matches within each printed line are highlighted

For example:

<html>
<pre>
$ echo -n "dogs and cats are pets\ndogs are nice" | grep --color=always -E '(dogs|cats)'
<span style="color: red; font-weight: bold;">dogs</span> and <span style="color: red; font-weight: bold;">cats</span> are pets
<span style="color:red; font-weight: bold;">dogs</span> are nice
</pre>
</html>

Here, both lines are printed with their matches highlighted.

### Tests

The tester will execute your program like this:

<html>
<pre>
$ echo -e "Tiger in the wild\nBird in the sky" | ./your_program.sh --color=always -E '(Tiger|Bird)'
<span style="color: red; font-weight: bold;">Tiger</span> in the wild
<span style="color: red; font-weight: bold;">Bird</span> in the sky

$ echo -e "Now: 2025\nNext: 2026" | ./your_program.sh --color=always -E '\d\d\d\d'
Now: <span style="color: red; font-weight: bold;">2025</span>
Next: <span style="color: red; font-weight: bold;">2026</span>
</pre>
</html>

If the input does not match the pattern, your program must:
- Exit with the code `1`.
- Exit with no printed output.

If the input text matches the pattern, your program must:
- Exit with the code `0`.
- Print each line that contains the match.
- Highlight every match in each line.

### Notes
- The order of the SGR codes doesn't matter: `\033[31;01m` and `\033[01;31m` both produce the same bold red effect.
