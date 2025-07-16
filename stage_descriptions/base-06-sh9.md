In this stage, we'll add support for patterns that combine the character classes we've seen so far.

This is where your regex matcher will start to _feel_ useful.

Keep in mind that this stage is harder than the previous ones. You'll likely need to rework your
implementation to process user input character-by-character instead of the whole line at once.

We recommend taking a look at the example code in ["A Regular Expression Matcher"](https://www.cs.princeton.edu/courses/archive/spr09/cos333/beautiful.html)
by Rob Pike to guide your implementation.

**Examples:**

- `\d apple` should match "1 apple", but not "1 orange".
- `\d\d\d apple` should match "100 apples", but not "1 apple".
- `\d \w\w\ws` should match "3 dogs" and "4 cats" but not "1 dog" (because the "s" is not present at the end).

Your program will be executed like this:

```bash
$ echo -n "1 apple" | ./your_program.sh -E "\d apple"
```

Your program must exit with 0 if the pattern matches the input, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}