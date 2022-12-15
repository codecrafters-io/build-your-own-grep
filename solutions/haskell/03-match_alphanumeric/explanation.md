In this stage we add an additional `if` statement to match alphanumeric characters.
Because the `Data.Char` module does not have a function that fits exactly (i.e., `isAlphaNum ` does not accept the underscore character) we need to write one ourselves.
However, since we do not need this function anywhere else we can create a lambda function.

A lambda function in Haskell is created using the backslash character `\` (this character looks similar to the greek letter lambda (λ)).
Directly after the `\` one or more parameters are added, separated by a comma, and followed by an arrow `->`.
You can then use the defined parameters in your lambda function.
For more information about lambda functions, check out the [Haskell Wiki](https://wiki.haskell.org/Lambda_abstraction).

Using a lambda function we can define the `isAlphaNum` function in-place.

```haskell
any (\c -> isAlphaNum c || c == '_') input
```
