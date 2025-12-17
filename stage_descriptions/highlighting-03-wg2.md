In this stage, you'll add support for highlighting matches in multiple lines.

### Highlighting multiple matches

Grep highlights all the matching texts it can find in each line.

Example usage:

<html>
<pre>
$ echo -n "dogs and cats are pets\ndogs are nice" | grep --color=always -E '(dogs|cats)'
<span style="color: red; font-weight: bold;">dogs</span> and <span style="color: red; font-weight: bold;">cats</span> are pets
<span style="color:red; font-weight: bold;">dogs</span> are nice
</pre>
</html>

### Tests

The tester will execute your program like this:

<html>
<pre>
$ echo -n "Tiger in the wild\nBird in the sky" | grep --color=always -E '(Tiger|Bird)'
<span style="color: red; font-weight: bold;">Tiger</span> in the wild
<span style="color: red; font-weight: bold;">Bird</span> in the sky
$ echo -n "Now: 2025\nNext: 2026" | grep --color=always -E '\d\d\d\d'
Now: <span style="color: red; font-weight: bold;">2025</span>
Next: <span style="color: red; font-weight: bold;">2026</span>
</pre>
</html>

If the input does not match the pattern, your program must:
- Exit with the code 1
- Exit with no printed output

If the input text matches the pattern, your program must:
- Exit with the code 0
- Print each line that contains the match
- Highlight every match in every printed line

### Notes

- The tester accepts multiple valid ANSI-encoded representations of the same highlighted text. To display the bold red text: <span style="color: red; font-weight: bold;">apple</span>, any equivalent combination is acceptable. Example of valid ANSI sequences:
    - `\033[01;31mapple\033[m`
    - `\033[31;01mapple\033[m`
