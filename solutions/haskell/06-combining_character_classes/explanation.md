# Instructions to solve Stage 6
## Introduction
Until now we have been able to get away with not having to really think about the problem and solve it more-or-less in the same quick-and-dirty way one would do this in an imperative programming language.
Solving this stage in this way is significantly more difficult and can make the existing code significantly more complicated.
Both these points can be illustrated by looking at the solutions up to and including this stage in the other programming languages.

When programming in the functional style, one places special emphasis on simplicity and clarity.
In particular, one tries to study the problem from the viewpoint of [algebraic design](https://algebradriven.design) and arrive at a solution that is made up of smaller building blocks that compose elegantly.

The solution till now has several problems:
- No [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns): The code to parse the pattern string is in the same place as the code used for matching.
- The individual solutions do not compose: We cannot build on the existing functions in order to arrive at a solution for this and later stages.
  For instance, there is no way to reuse the function that matches a single digit to do this in sequence in order to match a sequence of two digits.
- The code is in one big function, making it difficult to read or test portions relevant to individual concerns (such as single characters, positive groups, negative groups, etc.).
- ...

We therefore have no choice but to throw away our existing code and start from scratch by first thinking about the problem more deeply with the aim of understanding it thoroughly and arriving at an elegant algebraic design for it that composes elegantly and is fun and easy to program correctly.
Luckily for us, Stephen [Cole Kleene](https://en.wikipedia.org/wiki/Stephen_Cole_Kleene) has already worked this out for us in his theory of [regular expressions and languages](https://en.wikipedia.org/wiki/Regular_expression).
Looking at this theory, it is clear that it fits very well with what we require for this exercise, with one major difference: Whereas in the theory of regular languages, matching is exact (i.e., `/a/` only matches "a", but neither "abc" nor "bac"), for grep, the match may (for user convenience) occur anywhere within the given string (i.e., `/a/` matches "a", "abc" and "bac").
This is not a serious deal breaker: As we will see later, accounting for the difference is trivial once we have all our basic building blocks in place (i.e., we just need to append and prepend the given pattern with ".*" depending on the anchors specified). 

With this out of the way, we are ready to stand on the shoulders of giants and use the theory of regular languages and expressions to arrive at simple and elegant code that is easy to reuse, review and test.

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
* [ ] `alphaNumInverseM :: M Char` - matches if the char is not an alphanumeric and not '_'
* [ ] `anyCharM :: M Char` - machtes any character

All these functions are based on `singleM`.

But how did we make the decision to implement these specific functions?
You try to find an [algebraic design](https://algebradriven.design).
Here is an example how you can do this.

First you have to understand that RegEx does nothing more than checking if the current character matches a given predicate.
This gives us the first function `singleM`.
Next consider a basic pattern like "a".
This pattern represent the predicate "match the current character if it is equal to 'a'".

```Haskell
predicateA :: Char -> Bool
predicateA c = c == 'a'
```

`predicateA` and `singleM` can now be combined to create a new matcher: `aM`.
```Haskell
aM :: M a
aM = singleM predicateA
```

However, we can write this code more generally.
```Haskell
posLit :: Eq a => a -> M a
posLit c = singleM (==c)
```

Instead of creating a matcher for each character, a single matcher is created.
The new matcher takes a parameter to indicate which character is to be matched.


### Higher-Order Matchers
Lets now look at some extreme matchers that we can use as [identity elements](https://en.wikipedia.org/wiki/Identity_element) in our later operations and properties:

- `failM :: M a`: A matcher that matches nothing (returns `[]`).
  This is equivalent to the 'empty set' or '∅' or '0' from the theory of regular languages, [Wikipedia](https://en.wikipedia.org/wiki/Empty_set)
- `emptyStrM :: M a`: A matcher that matches the empty string (the string between '').
  This is equivalent to the 'empty string' or 'empty word' or 'ε' or '1' from the theory of regular languages, [Wikipedia](https://en.wikipedia.org/wiki/Empty_string)


For (negative) character groups and concatination (combining) we need the following functions:

* [ ] `andM :: [M a] -> M a` - matches if all matchers from the list are matching
* [ ] `orM :: [M a] -> M a` - matches if at least one matcher from the list was successful
* [ ] `concatM :: [M a] -> M a` - matches a list of mathers in a row

Again how did we end up with these functions?
Think about RegEx as mathematical equations:

$$ [abc] = \text{posLit 'a' || (posLit 'b' || posLit 'c')} $$

$$ [\^abc] = \text{negLit 'a' \&\& (negLit 'b' \&\& negLit 'c')} $$

$$ abc = \text{posLit 'a' then (posLit 'b' then posLit c')} $$

`||`, `&&` and `then` can also be expressed as functions: `orM`, `andM` and `concatM`.

In the recursive case in `orM` you perform the match on the first element and concat the result with the same operation.
```Haskell
orM (m:ms) s = m s ++ orM ms s
```

But now we need the base case, the [identity elements](https://en.wikipedia.org/wiki/Identity_element).
After you performed the `m s` the base case should **not** change the result.
```Haskell
["a", "b"] == ["a", "b"] ++ []
[] = [] ++ []
```
This can be done using the `failM`.

The same goes for `andM` and `concatM`.
If you would use `failM` in `andM` and `concatM` then you would change the result.
In both cases you want to match the 'empty word' and are therefore the bases case for both functions.

### KleeneStar and KleenPlus
In grep the pattern `abc` is the same as `.*abc.*`.
To support this behaviour we have to insert at the start and end the kleene star with the wildcard.
For this we required the following three functions:

* [ ] `anyCharM :: M a` - matches any character
* [ ] `kleeneStarM :: M a -> M a` - matches the given character 0 or n times
* [ ] `kleenePlusM :: M a -> M a` - matches the given character 1 or n times

We implement `kleeneStarM` and `kleenePlusM` as a mutual recursion.
Mutual recursion is when two or more functions call it self interchangable manner recursively.
In our case `kleenStarM` uses / calls `kleenPlusM`, but also the other way around.

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
Lastly, we want to parse strings, hence the type `String`.

```Haskell
type MParser = M.Parsec Void String
```

With that in place you can write one function for every EBNF rule.

You may have observed that one function is still missing - the `parse` function itself.
The `parse` function is our entry point for the parser and should return an [Abstract Syntax Tree (AST)](https://en.wikipedia.org/wiki/Abstract_syntax_tree).
For every matcher you need a constructor in the `data AST` data type.
After you got an `AST` from the parser you have to convert it to an matcher.
For this purpose we have to write an `astToMatcher` function.

Since the Megaparsec's `parse` function returns something of type `Either`, we have to distinguish these two cases (`Left` holds an error, `Right` means correct).

```Haskell
parse :: String -> M Char
parse s = case M.parse pRegEx "Error" s of
                 Left e -> error $ M.errorBundlePretty e
                 Right x -> x
```

## main function
The `main` function performs the following steps:
1. parses the pattern to an AST
2. if no valid pattern: exit
3. check if `-E` is provided as argument
4. run matching
5. print matched lines

The `grep` function read the input line for line using recursion.
The result for each list is stored in a list, which will be returned after all input is processed

If at least one match was succesfully we have to iterate over the list and print all lines which match the pattern.
To iterate over all elements in the list we can use the `mapM_` function.
This function works similar to the normal `map` function.
Each value from the input (list) is fed into a function which returns a monad (`putStrLn`) and the return value is discarded.


``` Haskell
if any ((==True) . fst) bs -- has at least one line matched the pattern?
  then do
     mapM_ (putStrLn . snd) $ filter ((==True) . fst) bs
     exitSuccess
  else do
     exitFailure
```

## Next Stage
Congratulations - the big rewrite of our application is done!
In the next stage we are going to implement support for the *start of string* anchor.
