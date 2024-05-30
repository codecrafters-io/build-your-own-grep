The entry point for your grep implementation is in `src/grep.gleam`.

Study and uncomment the relevant code: 

```gleam
// Uncomment this to pass the first stage
let args = argv.load().arguments
let assert Ok(input_line) = erlang.get_line("")
case args {
 ["-E", pattern, ..] -> {
     case match_pattern(input_line, pattern) {
         True -> exit(0)
          False -> exit(1)
        }
   io.println("Success")
  }
  _ -> {
    io.println("Expected first argument to be '-E'")
  }
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
