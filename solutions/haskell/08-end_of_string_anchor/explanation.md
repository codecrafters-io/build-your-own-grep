We have to create a new matcher, a matcher for the empty string (`emptyStrM`).
This matcher is only then successfull if the input string is empty.

In the parser we have to add the function for parsing the `end of string` nachor (`$`) and call it from the regex parsing function.
