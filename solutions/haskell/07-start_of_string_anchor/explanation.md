In our application we implemented the support for the `^` in the following way:

- when the `^` is **NOT** present, the parser will add the sequence `.*` (match many times anything or nothing)
- when the `^` is present, the parser will do nothing special


In the parser we have to add a function to parse the `^` character and add it to the expression parsing function.
