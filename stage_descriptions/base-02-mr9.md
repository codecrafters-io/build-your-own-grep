In this stage, we'll implement support for the `\w`
[character class](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Character_Classes).

`\w` matches any alphanumeric character (`a-z`, `A-Z`, `0-9`, `_`).

**Example:** `\w` should match "foo101", but not "$!?".

Your program will be executed like this:

```bash
$ echo -n "alpha-num3ric" | ./your_program.sh -E "\w"
```

Your program must exit with 0 if an alphanumeric character is found in the string, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}