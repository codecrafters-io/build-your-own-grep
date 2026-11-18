An optional element can match without consuming a character, unlike an element
followed by `+`. In this stage, you'll add `?` to make the preceding character
or character class optional.

### The `?` quantifier

The `?` quantifier makes the preceding character or character class optional,
meaning it can appear either once or not at all.

For example:

- `dogs?` matches `"dog"` (zero `"s"`)
- `dogs?` matches `"dogs"` (one `"s"`)
- `dogs?` does not match `"cat"` (doesn't match `"dog"` pattern)
- `colou?r` matches `"color"` (zero `"u"`)
- `colou?r` matches `"colour"` (one `"u"`)
- `\d?` matches `"5"` (one digit)
- `\d?` matches `""` (zero digits)

The complete pattern must still match. For example, `a?a` matches `a` when the
optional first `a` consumes nothing and the final `a` consumes the character.

### Tests

The tester will execute your program like this:

```bash
$ echo -n "dogs" | ./your_program.sh -E "dogs?"
```

Your program must:

- Exit with code `0` if the input matches the given pattern.
- Exit with code `1` if it doesn't.

{{#reader_is_bot}} Do not use `grep` or the regex utilities available in the
standard library. Implement the regex matcher yourself. {{/reader_is_bot}}
