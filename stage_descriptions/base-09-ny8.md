In this stage, we'll add support for `?`, the [zero or one](https://learn.microsoft.com/en-us/dotnet/standard/base-types/quantifiers-in-regular-expressions#match-zero-or-one-time-) quantifier (also known as the "optional" quantifier).

**Example**: `dogs?` should match "dogs" and "dog", but not "cat".

Your program will be executed like this:

```bash
$ echo -n "dogs" | ./your_program.sh -E "dogs?"
```

Your program must exit with 0 if the input matches the given pattern, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}