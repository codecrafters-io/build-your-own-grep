In this stage, we'll add support for `*`, the [zero or more](https://docs.microsoft.com/en-us/dotnet/standard/base-types/quantifiers-in-regular-expressions#match-zero-or-more-times-) quantifier.

The `*` quantifier matches the preceding element zero or more times. This means the element can be absent entirely or repeated any number of times.

**Examples**:
- `ca*t` should match "ct", "cat", and "caaat", but not "dog".
- `k\d*t` should match "kt", "k1t", "k123t", and "k999t", but not "kabct".
- `k[abc]*t` should match "kt", "kat", "kabct", and "kcccbbbt", but not "kaxyzt" or "kxyzt".

Your program will be executed like this:

```bash
$ echo -n "ct" | ./your_program.sh -E "ca*t"
```

Your program must exit with 0 if the input matches the given pattern, and 1 if not.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}
