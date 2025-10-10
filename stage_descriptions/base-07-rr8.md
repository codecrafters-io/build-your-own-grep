In this stage, you'll add support for the start of string or line anchor (`^`).

### Anchors

[Anchors](https://learn.microsoft.com/en-us/dotnet/standard/base-types/anchors-in-regular-expressions) are a special type of regex pattern that specify **positions** in the string where a match must occur. 

Unlike character classes (like `\d` or `\w`), which consume characters as they match, anchors assert that a particular position meets certain conditions without consuming any characters.

### Start of String or Line Anchor (`^`)

The `^` anchor matches patterns at the start of an input string.

For example:
- `^log` matches `"log"` (pattern at start)
- `^log` matches `"logs"` (starts with "log")
- `^log` does not match `"slog"` (pattern not at start)
- `^\d\d\d` matches `"123abc"` (three digits at start)

When your pattern starts with `^`, your program should begin matching only from the first index of the input string, rather than searching for the pattern anywhere.

### Tests

The tester will execute your program like this:

```bash
$ echo -n "log" | ./your_program.sh -E "^log"
```

Your program must:

- Exit with code `0` if the input starts with the given pattern.
- Exit with code `1` if it doesn't.

### Notes
- Be careful to distinguish between `^` as an anchor (at the start of a pattern) and `^` as negation (inside character groups like `[^abc]`).
- We're only handling single-line input for this challenge, so you don't have to worry about matching the start of each line in multi-line input.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}
