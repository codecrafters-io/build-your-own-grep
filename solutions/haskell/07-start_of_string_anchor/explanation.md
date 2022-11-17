In our parse we implemented the support for the `^` in the following way:

- when the `^` is **NOT** present, the parser will add the sequence `.*` (match many times anything or nothing)
- when the `^` is present, the parser will do nothing special

Therefore, we have to create a few new functions in the `RegEx.hs` file.

* [ ] `anyCharM :: M a` - matches any character
* [ ] `kleeneStarM :: M a -> M a` - matches the given character 0 or n times
* [ ] `kleenePlusM :: M a -> M a` - matches the given character 1 or n times

We implement `kleeneStarM` and `kleenePlusM` as a mutual recursion.
Mutual recursion is when two or more functions call it self interchangable manner recursively.
In our case `kleenStarM` uses / calls `kleenPlusM`, but also the other way around.

In the parser we only have to add the parsing for the `^` character and add it to the expression parsing function.
