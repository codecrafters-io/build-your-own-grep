In this stage we learned something about about `fmap` and list manipulation.

To get all allowed characters from the character group we can write a custom function for this.
We called this function `getAllowedCharacters`.

Our pattern looks something like this "[abcd]".
Therefore, the first and last character must be elimniated.
Using `tail` we get a new list without the first character ("abcd]").
The `take` function returns again a new list with only the first `n` characters.

Now we can combine `tail` and `take` and `length` to get only the characters between the two brackets.

```haskell
take (length s - 2) (tail s)
```

To save a pare of brackets we can use the `$` function which evaluates first the right side and then the left side
```haskell
take (length s - 2) $ tail s
```


The `fmap` is something like the `map` function in many other languages.
However, the `fmap` function is more general.
The `map` function also exists in Haskell but it is restricted to lists.
The `fmap` function is more general and can be applied to any type which is a functor.
A functor can be seen a generic container.
For more informations about the `Functor` typeclass see [this tutorial](https://mmhaskell.com/monads/functors).
If you don't know what a `Functor` is, see [this article](https://serokell.io/blog/haskell-typeclasses) by Serokell.

```haskell
fmap (`elem` input) (getAllowedCharacters pat)
```
