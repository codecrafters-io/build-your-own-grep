using System;
using System.IO;

if (args.Length < 2)
{
    Console.WriteLine("Expected at least two arguments.");
    Environment.Exit(2);
}
if (args[0] != "-E")
{
    Console.WriteLine("Expected first argument to be '-E'");
    Environment.Exit(2);
}
string pattern = args[1];
string inputLine = Console.In.ReadToEnd();
if (MatchPattern(inputLine, pattern))
{
    Environment.Exit(0);
}
else
{
    Environment.Exit(1);
}
static bool MatchPattern(string inputLine, string pattern)
{
    if (pattern.Length == 1)
    {
        return inputLine.Contains(pattern);
    }
    else
    {
        throw new ArgumentException($"Unhandled pattern: {pattern}");
    }
}
