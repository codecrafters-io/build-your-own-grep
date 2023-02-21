The big idea with this stage is to move the loops up a level. Instead of taking a pattern with one component
and searching for it anywhere in the input like

```rust
r"\d" => {
    for ch in input_line.chars() {
        match ch {
            '0'..='9' => {
                return true;
            }
            _ => continue,
        }
    }

    false
}
```

We search for a pattern, which may have multiple components, anywhere in the input string by looking for the pattern
at starting at each character in the input like

```rust
fn match_pattern(input_line: &str, pattern: &str) -> bool {
    let mut chars_iter = input_line.chars();
    loop {
        if match_pattern_occurrence(chars_iter.as_str(), pattern) {
            return true;
        }

        if chars_iter.next().is_none() {
            return false;
        }
    }
}
```

Then each of the existing patterns just needs to be tweaked to look for a match between the next input character and the next
pattern component. No loops here now, if we don't get a match then the pattern doesn't match at this point in the input and 
we let the `match_pattern` progress through the input string.

We need to add checks for the input or pattern being empty. Then we also need to handle matching single characters with

```rust
else if input.chars().next() == pattern.chars().next() {
    match_pattern_occurrence(
        &input[input.chars().next().unwrap().len_utf8()..],
        &pattern[pattern.chars().next().unwrap().len_utf8()..],
    )
}
```

There is a bit of subtlety here because both sides of the `if` condition could return `None`, except that we've already checked
for either string being empty earlier in the function.
