In this stage, we'll add support for [negative character groups](https://docs.microsoft.com/en-us/dotnet/standard/base-types/character-classes-in-regular-expressions#negative-character-group-).

Negative character groups match any character that is not present within a pair of square brackets.

**Example:** `[^abc]` should match "dog", but not "cab" (since all characters are either "a", "b" or "c").

Your program will be executed like this:

```bash
$ echo -n "apple" | ./your_program.sh -E "[^abc]"
```

Your program must exit with 0 if the input contains characters that aren't part of the negative character group, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}