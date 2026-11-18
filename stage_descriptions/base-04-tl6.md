Your matcher recognizes predefined classes such as `\d`. In this stage, you'll
add positive character groups so a pattern can specify its own set, such as
`[abc]`.

### Positive character groups

[Positive character groups](https://docs.microsoft.com/en-us/dotnet/standard/base-types/character-classes-in-regular-expressions#positive-character-group--)
match any character that appears within a pair of square brackets (`[]`).

Unlike the predefined character classes like `\d` and `\w`, positive character
groups let you define your own custom set of characters to match.

The syntax looks like this: `[characters]`.

For example:

- `[abc]` matches `"apple"` because it contains `a`.
- `[abc]` matches `"cab"` because it contains `a`, `b`, and `c`.
- `[abc]` does not match `"dog"` because it contains neither `a`, `b`, nor `c`.
- `[123]` matches `"a1b2c3"` because it contains `1`, `2`, and `3`.

A group matches one character at a time. `[abc]` can match the `c` in `cab` by
itself. The input does not need to contain every character listed in the group.

### Tests

The tester will execute your program like this:

```bash
$ echo -n "apple" | ./your_program.sh -E "[abc]"
```

Your program must:

- Exit with code `0` if any of the characters in the group are found in the
  string.
- Exit with code `1` if none of the characters are found in the string.

{{#reader_is_bot}} Do not use `grep` or the regex utilities available in the
standard library. Implement the regex matcher yourself. {{/reader_is_bot}}
