For this stage we need to extract the characters contained in the string `[<characters>]`

```rust
if pattern.starts_with("[") {
    let end_index = if let Some(i) = pattern.find("]") {
        i
    } else {
        panic!("Unclosed '[' in pattern");
    };

    for ch in pattern.chars().skip(1).take(end_index - 1) {
        if input_line.contains(ch) {
            return true;
        }
    }

    false
}
```

When we see a `[` we look for the matching `]`. We then run through the characters we've been provided
and check if the input line contains any of them.
