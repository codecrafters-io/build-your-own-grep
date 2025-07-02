In this stage, we'll handle the simplest regex possible: a single character.

**Example:** `a` should match "apple", but not "dog".

Your program will be executed like this:

```bash
$ echo -n "apple" | ./your_program.sh -E "a"
```

The `-E` flag instructs `grep` to interpret patterns as extended regular expressions (with support
for metacharacters like `+`, `?` etc.). We'll use this flag in all stages.

Your program must [exit](https://en.wikipedia.org/wiki/Exit_status) with 0 if the character is found, and 1 if not.

### Notes

- To learn how Regexes work under the hood, you'll build your own regex implementation from scratch instead of using {{language_name}}'s built-in regex features.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}
