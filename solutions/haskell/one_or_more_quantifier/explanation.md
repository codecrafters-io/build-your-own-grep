The matching logic is already complete for this stage.
Only the parser has to be adjusted.

Some function definition look unneccesary.
We decided using this approach it is easyier to extend support for new quantifiers - for example for the zero or more quantifier (`*`).

```Haskell
pQuantifiers = M.try oneOrMoreQuantifier
```
