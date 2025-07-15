In this stage, we'll add support for `$`, the [End of String or Line anchor](https://learn.microsoft.com/en-us/dotnet/standard/base-types/anchors-in-regular-expressions#end-of-string-or-line-).

`$` doesn't match a character, it matches the end of a line.

**Example:** `dog$` should match "dog", but not "dogs".

Your program will be executed like this:

```bash
$ echo -n "dog" | ./your_program.sh -E "dog$"
```

Your program must exit with 0 if the input matches the given pattern, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}