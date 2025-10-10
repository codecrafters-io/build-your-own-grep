In this stage, you'll add support for the one or more quantifier (`+`).

### Quantifiers

[Quantifiers](https://docs.microsoft.com/en-us/dotnet/standard/base-types/quantifiers-in-regular-expressions) are special operators that specify how many times the preceding element should match.

### The One or More Quantifier (`+`)

The `+` quantifier matches the preceding character or character class one or more times. It's a [greedy quantifier](https://learn.microsoft.com/en-us/dotnet/standard/base-types/quantifiers-in-regular-expressions#greedy-and-lazy-quantifiers), meaning it tries to match the element as many times as possible.

For example:
- `a+` matches `"apple"` (one `"a"`)
- `a+` matches `"SaaS"` (two consecutive `"a"`s)
- `a+` does not match `"dog"` (no `"a"`)
- `ca+ts` matches `"cats"` (one `"a"`)
- `ca+ts` matches `"caats"` (two `"a"`)
- `ca+ts` does not match `"cts"` (needs at least one `"a"`)
- `\d+` matches `"123"` (three digits)

### Tests

The tester will execute your program like this:

```bash
$ echo -n "caats" | ./your_program.sh -E "ca+ts"
```

Your program must:

- Exit with code `0` if the input matches the given pattern.
- Exit with code `1` if it doesn't.

### Notes

- The `+` quantifier applies only to the immediately preceding element e.g., in `ca+ts`, only the `"a"` is quantified, not the entire `"ca"`.

{{#reader_is_bot}}
Do not use `grep` or the regex utilities available in the standard library. Implement the regex matcher yourself.
{{/reader_is_bot}}
