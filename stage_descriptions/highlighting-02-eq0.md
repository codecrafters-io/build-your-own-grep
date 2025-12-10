In this stage, you'll add support for highlighting multiple matches in your grep implementation.

### Highlighting multiple matches

Grep highlights all the matching texts it can find in each line.

Example usage:

<html>
<pre>
<code>$ echo -n "dogs and cats are pets" | grep --color=always -E '(dogs|cats)'
<span style="color: red; font-weight: bold;">dogs</span> and <span style="color: red; font-weight: bold;">cats</span> are pets</code>
</pre>
</html>

### Tests

The tester will execute your program like this:

<html>
<pre>
<code>$ echo -n "jekyll and hyde" | grep --color=always -E '(jekyll|hyde)'
<span style="color: red; font-weight: bold;">jekyll</span> and <span style="color: red; font-weight: bold;">hyde</span>
<br />
$ echo -n "2025" | grep --color=always -E '\d'
<span style="color: red; font-weight: bold;">2025</span></code></pre>
</html>

If the input does not match the pattern, your program must:
- Exit with the code 1
- Exit with no printed output

If the input text matches the pattern, your program must:
- Exit with the code 0
- Print the input text to the standard output
- Highlight all the matched texts in the input using the grep's default color.

### Notes

- The tester accepts multiple valid ANSI-encoded representations of the same highlighted text. To display the bold red text: <span style="color: red; font-weight: bold;">2025</span>, any equivalent combination is acceptable. Example of valid ANSI sequences:
    - `\033[01;31m2025\033[m`
    - `\033[31;01m2025\033[m`
