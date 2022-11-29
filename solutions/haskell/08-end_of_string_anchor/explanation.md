In this stage we only have to update the parser, because `$` does not introduce any new matching logic.
If the `$` is missing the parser appends `.*` to the result.

In the parser we have to add the function for parsing the `end of string` anchor (`$`) and call it from the regex parsing function.
