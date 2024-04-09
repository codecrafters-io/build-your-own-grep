The entry point for your grep implementation is in `src/Program.cs`.

Study and uncomment the relevant code: 

```csharp
// Uncomment this block to pass the first stage

if (args[0] != "-E") {
    Console.WriteLine("Expected first argument to be '-E'");
    Environment.Exit(2);
}
string pattern = args[1];
string inputLine = Console.In.ReadToEnd();
if (MatchPattern(inputLine, pattern)) {
    Environment.Exit(0);
} else {
    Environment.Exit(1);
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
