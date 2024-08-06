The entry point for your grep implementation is in `src/main.gleam`.

Study and uncomment the relevant code: 

```gleam
// Uncomment this to pass the first stage
case args {
  ["-E", pattern, ..] -> {
    case match_pattern(input_line, pattern) {
      True -> exit(0)
      False -> exit(1)
    }
  }
  _ -> {
    io.println("Expected first argument to be '-E'")
    exit(1)
  }
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
