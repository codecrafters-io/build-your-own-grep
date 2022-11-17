In Stage 2 we use some new functions like `any` or `isDigit` and implement a nested if statement.

`isDigit` is a function from the `Data.Char` module.
The `Data.Char` module contains many more useful functions when you work with single characters.

For more information about the `Data.Char` module check out the [Data.Char](https://hackage.haskell.org/package/base/docs/Data-Char.html) documentation on Hackage.

You may have already noticed that the indentation is important in Haskell.
Therefore, the second `if` statement must be nested one level deeper than the first `if`.

Also the `any` function is quite neat when you want to check if at least one character matches a certain criterion.
The function `any` has a type of `any Foldable t => :: (a -> Bool) -> t a -> Bool`.
In our case this translates to `any :: (Char -> Bool) -> [Char] -> Bool`.
This means, `any` takes a predicate as a first input, which checks if a given `Char` fulfills the provided criterion (e.g., is the character a digit).
The second argument is a list of characters; this is our input string.
If at least one character in the input string matches the predicate the whole expression evaluates to true.

```haskell
if pat == "\\d"
  then any isDigit input
  else
    if length pat == 1  -- This indentation is required
      then head pat `elem` input
      else error $ "Unhandled pattern: " ++ pat
```
