We have to create a new matcher, one that matches the empty string (`emptyStrM`).
This matcher is only successful if the input string is empty, i.e. `""`.

In the parser we have to add the function for parsing the `end of string` anchor (`$`) and call it from the regex parsing function.
