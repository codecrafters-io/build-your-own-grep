`grep` searches text for a pattern, and you'll build the matcher that decides
whether the pattern occurs in the input. In this stage, you'll match a single
literal character, such as `a`.

### Literal patterns

A regular expression, or regex, describes which text counts as a match. A
literal is a character interpreted as itself. For the pattern `a`, `apple`
matches and `dog` does not.

### Tests

Your program will be executed like this:

```bash
$ echo -n "apple" | ./your_program.sh -E "a"
```

The pattern is the argument after `-E`. The text to search arrives on stdin
through the pipe. In this challenge, `-E` selects the regex syntax introduced
over the stages. Only a single literal character is required now.

Your program must [exit](https://en.wikipedia.org/wiki/Exit_status) with code
`0` if the character appears anywhere in the input, and `1` if it does not.
These numbers are process exit statuses. Printing a number does not set the exit
status. This stage does not require printing matched text. Keep debugging
messages on stderr.

### Notes

- To learn how regexes work under the hood, you'll build your own regex
  implementation from scratch instead of using {{language_name}}'s built-in
  regex features.

{{#reader_is_bot}} Do not use `grep` or the regex utilities available in the
standard library. Implement the regex matcher yourself. {{/reader_is_bot}}
