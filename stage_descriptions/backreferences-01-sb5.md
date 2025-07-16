In this stage, we'll add support for backreferences.

A backreference lets you reuse a captured group in a regular expression. It is denoted by `\` followed by a number, indicating the position of the captured group.

**Examples:**
- `(cat) and \1` should match "cat and cat", but not "cat and dog".
  - `\1` refers to the first captured group, which is `(cat)`.
- `(\w+) and \1` should match "cat and cat" and "dog and dog", but not "cat and dog".
  - `\1` refers to the first captured group, which is `(\w+)`.

Your program will be executed like this:

```
$ echo -n "<input>" | ./your_program.sh -E "<pattern>"
```

Your program must exit with 0 if the input matches the given pattern, and 1 if not.

**Note:** You only need to focus on one backreference and one capturing group in this stage. We'll get to handling multiple backreferences in the next stage.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}
