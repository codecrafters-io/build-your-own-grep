In Stage 2 we use some new functions like `any` or `isDigit` and implemented a nested if statement.
`isDigit` cames from the `Data.Char` module.
The `Data.Char` module contains many more usefull functions to work with single characters.
For more information about the `Data.Char` module see the [Data.Char](https://hackage.haskell.org/package/base-4.17.0.0/docs/Data-Char.html) documentation on Hackage.

You may already noticed, but the indentation is important in Haskell.
Therefore, the second if must be more indentend than the first if.

Also the `any` function is quite neat.
`any` has a type of `any Foldable t => :: (a -> Bool) -> t a -> Bool`.
In our case this translates to `any :: (Char -> Bool) -> [Char] -> Bool`.
That means it taks first a predicate, which checks if the char fullfills a certain critera (is the char a digit?).
The second argument is a list of chars, our input string.
If at least one character in the input string fullfilss the predicate the whole expression evaluates to true.

```haskell
if pat == "\\d"
  then any isDigit input
  else
    if length pat == 1  -- This indentation is required
      then head pat `elem` input
      else error $ "Unhandled pattern: " ++ pat
```
