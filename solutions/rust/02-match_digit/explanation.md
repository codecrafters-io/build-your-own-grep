For this stage we can extend the `match_pattern` function from stage 1.

```rust
fn match_pattern(input_line: &str, pattern: &str) -> bool {
    match pattern {
        r"\d" => {
            for ch in input_line.chars() {
                match ch {
                    '0'..='9' => {
                        return true;
                    }
                    _ => continue
                }
            }

            false
        }
        _ => {
            if pattern.chars().count() == 1 {
                input_line.contains(pattern)
            } else {
                panic!("Unhandled pattern: {}", pattern);
            }
        }
    }
}
```

There are two things to note here. The first is the `r"\d"` syntax which is a raw string which lets us
match a literal `\d` rather than it being interpreted as an escape sequence in the string. The second
is the `'0'..='9'` syntax which matches digits between 0 and 9 inclusive using Rust's range syntax.
