The matching logic is already complete for this stage.
Only the parser has to be adjusted.

Some function definitions may look unnecessary.
However, this approach makes it easier to extend support for new quantifiers - for example for the zero or more quantifier (`*`).

```Haskell
pQuantifiers = M.try oneOrMoreQuantifier
```
