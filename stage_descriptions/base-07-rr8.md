In this stage, we'll add support for `^`, the [Start of String or Line anchor](https://docs.microsoft.com/en-us/dotnet/standard/base-types/anchors-in-regular-expressions#start-of-string-or-line-).

`^` doesn't match a character, it matches the start of a line.

**Example:** `^log` should match "log", but not "slog".

Your program will be executed like this:

```bash
$ echo -n "log" | ./your_program.sh -E "^log"
```

Your program must exit with 0 if the input starts with the given pattern, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}