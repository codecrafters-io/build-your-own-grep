In this stage we learn something about the `fmap` function and list manipulation.

To get all allowed characters from the character group we can write a custom function.
We call this function `getAllowedCharacters`.

Our pattern could look like `"[abcd]"`.
Since we are only interested in matching `abcd` but not the square brackets `[` and `]`, we need to remove the first and last characters of the pattern.
Using the `tail` function we get a new list without the first character `"abcd]"`.
To remove the second bracket we can use the `take` function, which returns a new list containing the first `n` characters.
Now, we can combine `tail`, `take` and `length` to get only the characters between the two brackets, i.e. `"abcd"`.

```haskell
take (length s - 2) (tail s)
```

In Haskell you can spare brackets that span until the end of an expression by using `$` instead. In the above case, this would be implemented as following:
```haskell
take (length s - 2) $ tail s
```

The `fmap` function is identical to the `map` function that exists in many other programming languages.
The `map` function also exists in Haskell but its application is restricted to lists.
The Functor map, or `fmap`, is more generic and can be applied to many other parametrically polymorphic types that are an instance of the type class `Functor`.

For more information about the `Functor` type class, see [this tutorial](https://mmhaskell.com/monads/functors).
If you are not familiar with type classes in general, [this article](https://serokell.io/blog/haskell-typeclasses) by Serokell provides a good introduction.

Using `fmap` we can implement the allowed characters pattern matching. 

```haskell
fmap (`elem` input) (getAllowedCharacters pat)
```

You may note correctly that the second pair of brackets could be replaced by `$`.
This is a valid suggestion and can be even further improved by replacing `fmap` with `<$>`
However, for this stage we want to show the `fmap` functionality first.