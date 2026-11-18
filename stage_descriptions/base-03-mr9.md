A pattern can describe an identifier character without listing every
possibility. In this stage, you'll add `\w` to match a single letter, digit or
underscore.

### The `\w` character class

The `\w`
[character class](https://learn.microsoft.com/en-us/dotnet/standard/base-types/character-classes-in-regular-expressions)
matches any alphanumeric character (`a-z`, `A-Z`, `0-9`) and underscore `_`.

For example:

- `\w` matches `"alpha_num3ric"` because it contains alphanumeric and underscore
  characters.
- `\w` matches `"foo101"` because it contains letters and digits.
- `\w` does not match `"$!?"` because none of the symbols are word characters.

A single `\w` matches one character. For example, it can match just the `a` in
`alpha_num3ric`. The input contains a match as soon as any one character belongs
to this class.

### Tests

The tester will execute your program like this:

```bash
$ echo -n "alpha_num3ric" | ./your_program.sh -E "\w"
```

Your program must:

- Exit with code `0` if it finds a word character in the input string.
- Exit with code `1` if it finds no word characters in the input string.

### Notes

- Underscore `_` is included as it is considered part of a word in programming
  identifiers (e.g., variable and function names).

{{#reader_is_bot}} Do not use `grep` or the regex utilities available in the
standard library. Implement the regex matcher yourself. {{/reader_is_bot}}
