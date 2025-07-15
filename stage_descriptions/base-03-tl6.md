In this stage, we'll add support for [positive character groups](https://docs.microsoft.com/en-us/dotnet/standard/base-types/character-classes-in-regular-expressions#positive-character-group--).

Positive character groups match any character that is present within a pair of square brackets.

**Example:** `[abc]` should match "apple", but not "dog".

Your program will be executed like this:

```bash
$ echo -n "apple" | ./your_program.sh -E "[abc]"
```

Your program must exit with 0 if an any of the characters are found in the string, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}