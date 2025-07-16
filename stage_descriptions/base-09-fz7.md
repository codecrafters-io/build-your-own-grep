In this stage, we'll add support for `+`, the [one or more](https://docs.microsoft.com/en-us/dotnet/standard/base-types/quantifiers-in-regular-expressions#match-one-or-more-times-) quantifier.

**Example**: `a+` should match "apple" and "SaaS", but not "dog".

Your program will be executed like this:

```bash
$ echo -n "caats" | ./your_program.sh -E "ca+ts"
```

Your program must exit with 0 if the input matches the given pattern, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}