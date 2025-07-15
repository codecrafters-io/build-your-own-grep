In this stage, we'll implement support for the `\d`
[character class](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Character_Classes).

`\d` matches any digit.

**Example:** `\d` should match "3", but not "c".

Your program will be executed like this:

```bash
$ echo -n "apple123" | ./your_program.sh -E "\d"
```

Your program must exit with 0 if a digit is found in the string, and 1 if not.

 ### Notes

- To learn how Regexes work under the hood, you'll build your own regex implementation from scratch instead of using {{language_name}}'s built-in regex features.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}