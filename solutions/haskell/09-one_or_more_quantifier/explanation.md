The matching logic is already complete for this stage.
Only the parser has to be adjusted.

Some function definitions may look unnecessary.
However, this approach makes it easier to extend support for new quantifiers. 

```Haskell
pQuantifiers = M.try oneOrMoreQuantifier
```

We also added the support to group patterns (`pGroup`).
