In this stage, we'll add support for nested backreferences. This means that a backreference is part of a larger capturing group, which itself is referenced again.

**Example:** `('(cat) and \2') is the same as \1` should match "'cat and cat' is the same as 'cat and cat'".

Your program will be executed like this:

```
$ echo -n "<input>" | ./your_program.sh -E "<pattern>"
```

Your program must exit with 0 if the input matches the given pattern, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}
