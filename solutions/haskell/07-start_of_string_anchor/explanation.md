As mentioned earlier, there is a difference between matching in the theory of regular languages, and matching in grep: Whereas in the theory of regular languages, matching is exact (i.e., `/a/` only matches "a", but neither "abc" nor "bac"), for grep, the match may (for user convenience) occur anywhere within the given string (i.e., `/a/` matches "a", "abc" and "bac").

Accounting for the difference is now trivial once we have all our basic building blocks in place (i.e., we just need to append and prepend the given pattern with ".*" depending on the anchors specified).

We add support for the start of string anchor in the following way: If the start of string anchor `^` is **NOT** present at the start of the given regular expression, the parser will add the regular expression `.*` to the start of the given regular expression.
