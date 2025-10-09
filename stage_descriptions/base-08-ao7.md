In this stage, you'll add support for the end of string or line anchor (`$`).

### The `$` Anchor

The `$` anchor is an [end of string or line anchor](https://learn.microsoft.com/en-us/dotnet/standard/base-types/anchors-in-regular-expressions#end-of-string-or-line-). It matches the position at the very end of the input string.

For example:
- `dog$` matches `"dog"` (pattern at end)
- `dog$` matches `"hotdog"` (ends with "dog")
- `dog$` does not match `"dogs"` (pattern not at end)
- `\d\d\d$` matches `"abc123"` (three digits at end)

### Tests

The tester will execute your program like this:

```bash
$ echo -n "dog" | ./your_program.sh -E "dog$"
```

Your program must:

- Exit with code `0` if the input ends with the given pattern.
- Exit with code `1` if it doesn't.

### Notes
- The `$` anchor constrains where the pattern must end, but the pattern can still match anywhere in the string as long as it ends at the string's end.
- You can combine `^` and `$` in the same pattern (e.g., `^dog$`) to match the entire string exactly.
- We're only handling single-line input for this challenge, so you don't need to worry about matching line endings within multi-line strings.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}
