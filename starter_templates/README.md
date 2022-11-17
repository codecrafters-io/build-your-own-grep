This is a starting point for {{language_name}} solutions to the
["Build Your Own grep" Challenge](https://app.codecrafters.io/courses/grep/overview).

[Regular expressions](https://en.wikipedia.org/wiki/Regular_expression) (Regexes, for short) are patterns used to
match character combinations in strings. [`grep`](https://en.wikipedia.org/wiki/Grep) is a CLI tool for searching
using Regexes.

In this challenge you'll build your own implementation of `grep`. Along the way we'll learn about Regex syntax, how
parsers/lexers work, and how regular expressions are evaluated.

**Note**: If you're viewing this repo on GitHub, head over to [codecrafters.io](https://codecrafters.io) to try the challenge.

# Passing the first stage

The entry point for your `grep` implementation is in `{{ user_editable_file }}`. Study and uncomment the relevant code, and
push your changes to pass the first stage:

``` sh
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```

Time to move on to the next stage!

# Stage 2 & beyond

Note: This section is for stages 2 and beyond.

1. Ensure you have `{{ required_executable }}` installed locally
1. Run `./your_grep.sh` to run your program, which is implemented in
   `{{ user_editable_file }}`.{{# language_is_rust }} This command compiles your
   Rust project, so it might be slow the first time you run it. Subsequent runs
   will be fast.{{/ language_is_rust}}
1. Commit your changes and run `git push origin master` to submit your solution
   to CodeCrafters. Test output will be streamed to your terminal.

{{# language_is_haskell }}
# Stage 6 & beyond

Please be aware that when implementing your solution in Haskell, there is a heavy re-write of the code after stage 5.

Since the solutions start in a more imperative way, mainly to get accustomed to the Haskell language, its main benefit is the functional style.
After stage 5 the more advanced functional concepts allow an elegant implementation of `grep`, which may not be familiar to someone who is just starting with Haskell.
But, you will learn a lot from it and quickly notice its benefits - we promise, it is worth the effort!

Please feel free to implement your solution from the beginning in a functional style with the caveat that this may require more work for passing stage 2, but less work afterwards.

{{/ language_is_haskell }}