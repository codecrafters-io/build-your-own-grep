In this stage, you'll add support for highlighting multiple matches.

### Highlighting Multiple Matches

Grep highlights all matching text it finds in a line.

For example:

<html>
<pre>
$ echo -n "dogs and cats are pets" | grep --color=always -E '(dogs|cats)'
<span style="color: red; font-weight: bold;">dogs</span> and <span style="color: red; font-weight: bold;">cats</span> are pets
</pre>
</html>

Here, both `dogs` and `cats` are in bold red formatting.

For each match found in an input:
1. Insert the opening ANSI sequence `\033[01;31m` before the match
2. Insert the closing ANSI sequence `\033[m` after the match
3. Continue searching for the next match from where the previous match ended

### Tests

The tester will execute your program like this:

<html>
<pre>
$ echo -n "jekyll and hyde" | ./your_program.sh --color=always -E '(jekyll|hyde)'
<span style="color: red; font-weight: bold;">jekyll</span> and <span style="color: red; font-weight: bold;">hyde</span>

$ echo -n "2025" | ./your_program.sh --color=always -E '\d'
<span style="color: red; font-weight: bold;">2</span><span style="color: red; font-weight: bold;">0</span><span style="color: red; font-weight: bold;">2</span><span style="color: red; font-weight: bold;">5</span>
</pre>
</html>

If the input does not match the pattern, your program must:
- Exit with the code `1`.
- Exit with no printed output.

If the input text matches the pattern, your program must:
- Exit with the code `0`.
- Print the input text to the standard output.
- Highlight all the matched texts in the input with bold red formatting.

### Notes

- You only need to handle the case of a single line. We'll get to highlighting matches in multiple lines in the later stages.
- The order of the SGR codes doesn't matter: `\033[31;01m` and `\033[01;31m` both produce the same bold red effect.
