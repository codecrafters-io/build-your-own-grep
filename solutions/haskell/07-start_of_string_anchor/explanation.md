The pattern `abc` is in grep the same as `.*abc.*`.
Therefore, we have to create a few new functions in the `RegEx.hs` file.

* [ ] `anyCharM :: M a` - matches any character
* [ ] `kleeneStarM :: M a -> M a` - matches the given character 0 or n times
* [ ] `kleenePlusM :: M a -> M a` - matches the given character 1 or n times

We implemented `kleeneStarM` and `kleenePlusM` as a mutual recursion.
`kleenStarM` uses `kleenPlusM` and the otherway around.

In the parser we only have to add the parsing for the `^` character and add it to the expression paring function.
