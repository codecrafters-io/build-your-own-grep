The application logic for alternation is already implemented (`altM`).
We have to modify the parser to support the alternation (`|`).

```Haskell
expression  ::= subExpression (| expression)
```
