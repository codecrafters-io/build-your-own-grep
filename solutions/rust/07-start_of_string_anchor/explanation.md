The `match_pattern_occurrence` function we wrote in the last stage can solve this stage too.

```rust
if pattern.starts_with("^") {
    // Match at the start of the input only, don't search later in the input string
    return match_pattern_occurrence(input_line, &pattern[1..]);
}
```

We just need to remember to skip the `^` at the start of the pattern and try to match the rest of it.
