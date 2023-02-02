For this stage we extend our match block to look for `\w` in the pattern.

```rust
r"\w" => {
    for ch in input_line.chars() {
        match ch {
            '0'..='9' | 'a'..='z' | 'A'..='Z' | '_' => {
                return true;
            }
            _ => continue
        }
    }

    false
}
```

Here we use the `|` operator to provide alternative patterns to match.
