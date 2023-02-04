To check whether the pattern matched at the end of the string we need to check for a `$` in the pattern before checking
whether the input is empty and making a decision about the match.

```rust
else if pattern == "$" {
    input.len() == 0
} else if input.is_empty() {
    false
}
```

If the input is empty at the point that we reach the `$` in the pattern then we have a match.
