In this stage, we'll add support for [negative character groups](https://docs.microsoft.com/en-us/dotnet/standard/base-types/character-classes-in-regular-expressions#negative-character-group-).

Negative character groups match any character that is not present within a pair of square brackets.

**Examples:** 
- `[^abc]` should match "cat", since "t" is not in the set "a", "b", or "c".
- `[^abc]` should not match "cab", since all characters are in the set.

Your program will be executed like this:

```bash
$ echo -n "apple" | ./your_program.sh -E "[^abc]"
```

Your program must exit with 0 (match) if the input contains any character not in the negative character group; otherwise, it must exit with 1 (no match).

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}