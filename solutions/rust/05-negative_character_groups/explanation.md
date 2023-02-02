This stage is similar to the last one with the logic reversed.

```rust
if pattern.starts_with("[^") {
    let end_index = if let Some(i) = pattern.find("]") {
        i
    } else {
        panic!("Unclosed '[' in pattern");
    };

    for ch in pattern.chars().skip(2).take(end_index - 2) {
        if input_line.contains(ch) {
            return false;
        }
    }

    true
}
```

We look for the negative group syntax `[^` at the start of the string. If any of these characters
are found, we return false and otherwise it is a match.
