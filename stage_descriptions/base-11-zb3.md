In this stage, we'll add support for `.`, which matches any character.

**Example**: `d.g` should match "dog", but not "cog".

Your program will be executed like this:

```bash
$ echo -n "dog" | ./your_program.sh -E "d.g"
```

Your program must exit with 0 if the input matches the given pattern, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}