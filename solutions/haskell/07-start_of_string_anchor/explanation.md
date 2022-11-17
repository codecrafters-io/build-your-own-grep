In grep the pattern `abc` is the same as `.*abc.*`.
Therefore, we have to create a few new functions in the `RegEx.hs` file.

* [ ] `anyCharM :: M a` - matches any character
* [ ] `kleeneStarM :: M a -> M a` - matches the given character 0 or n times
* [ ] `kleenePlusM :: M a -> M a` - matches the given character 1 or n times

We implement `kleeneStarM` and `kleenePlusM` as a mutual recursion.
`kleenStarM` uses `kleenPlusM`, but also the other way around.

In the parser we only have to add the parsing for the `^` character and add it to the expression parsing function.
