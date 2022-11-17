# Instructions to solve Stage 6
## Project Structure
We will start from scratch to get a clean implementation.
For this we separate the parsing of the pattern from the input and the matching logic.
Therefore, we create a file `RegEx.hs` for the regex pattern matching and a `Parser.hs` for the parsing and place it in a new folder called `src`.
The `Main.hs` imports the functions from the other two files and glues everything together.

Your project structure should look like this:

```
.
├── app
│   └── Main.hs
├── package.yaml
├── README.md
├── src
│   ├── Parser.hs
│   └── RegEx.hs
├── stack.yaml
├── stack.yaml.lock
└── your_grep.sh
```

## Implement Pattern Matching Logic
### Basic Functions
In functional programming your application logic is composed of many small functions.

Before we write our first function we create a type alias for our matching functions.
Every matching function will get a list of characters as input and should return a list of unprocessed inputs.


```Haskell
type M a = [a] -> [[a]]
```

We begin with the most basic function: `singleM`. It checks if the first character from the input matches a given predicate.

```Haskell
singleM :: (a -> Bool) -> M a
```

From this point we can construct one matcher after another based on `singleM`.
We need the following functions:

* [ ] `posLit :: Eq a => a -> M a` - matches the given literal
* [ ] `negLit :: Eq a => a -> M a` - matches if the char is not the given literal
* [ ] `digitM :: M Char` - matches if the char is a digit
* [ ] `digitInverseM :: M Char` - matches if the char is not a digit
* [ ] `alphaNumM :: M Char` - matches if the char is an alphanumeric or '_'
* [ ] `alphaNumInverserM :: M Char` - matches if the char is not an alphanumeric and not '_'
* [ ] `anyCharM :: M Char` - matches any char
* [ ] `failM :: M a` - always fails (always returns the empty list)
* [ ] `noOpM :: M a` - does not perform any matching

All these functions are based on `singleM`.

### Higher-Order Matchers

Negative character groups require two additional functions:

* [ ] `andM :: [M a] -> M a` - matches if all matchers from the list are matching
* [ ] `altM :: [M a] -> M a` - matches if at least one matcher from the list was successful
* [ ] `concatM :: [M a] -> M a` - combines different matchers from the given list

Once you have `concatM` correctly implemented you can finish the application logic for this stage, and then continue with implementing the parser.

## Implement Parser Using Megaparsec

We are going to implement a parser for the RegEx using the [Megaparsec library](https://hackage.haskell.org/package/megaparsec).
Our parser should parse the Extended Backus Naur Form ([EBNF](https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_form)) from [this file](https://github.com/kean/Regex/blob/master/grammar.ebnf).

This is an adjusted EBNF that better fits to our parser:

```EBNF
CharacterGroup         ::= PositiveCharacterGroup | NegativeCharacterGroup
PositiveCharacterGroup ::= "[" CharacterGroupItem+ "]"
CharacterGroup         ::= "[" CharacterGroupNegativeModifier CharacterGroupItem+ "]"
```

To use the Megaparsec Parser you need to create a type alias first.
The first parameter `M.Parsec` is the Megaparsec parser.
The second parameter is the error type for which `Void` is commonly used.
Lastly, we want to parse strings, hence the type `String.

```Haskell
type MParser = M.Parsec Void String
```

With that in place you can write one function for every EBNF rule.

You may have observed that one function is still missing - the `parse` function itself.
The `parse` function is our entry point for the parser and should return the parsed matcher (`M a`). Since the Megaparsec's `parse` function returns something of type `Either`, we have to distinguish these two cases (`Left` holds an error, `Right` means correct).

```Haskell
parse :: String -> M Char
parse s = case M.parse pRegEx "Error" s of
                 Left e -> error $ M.errorBundlePretty e
                 Right x -> x
```

## Next Stage
Congratulations - the big rewrite of our application is done!
In the next stage we are going to implement support for the *start of string* anchor.
