The parser must be extended again.
However, the changes are easy and straightforward.

By now you may have noticed that building additional support for quantifiers is relatively easy in the functional style. For example, adding support for the zero or one (`?`) quantifier is a simple addition of the following function:

```Haskell
zeroOrOneQuantifier :: AST a -> MParser (AST a)
zeroOrOneQuantifier x = do
  _ <- char '?'
  return $ OrM [EmptyStrM, x]
```

The effort of having (re-)written everything in a functional style is for sure paying off by now.
