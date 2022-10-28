In this stage we add an additonal if statement to match alphanumeric characters.
Because the `Data.Char` module does not have a fitting function we have to write one by our self.
However, we don't need this function somewhere else so we can create a lambda.

A lambda is Haskell is created using the `\` character.
The `\` character looks a little bit like the greek letter lambda (λ).
Directly after the `\` the parameter(s) followed.
Now we can define functions inplace.

```haskell
any (\c -> isAlphaNum c || c == '_') input
```
