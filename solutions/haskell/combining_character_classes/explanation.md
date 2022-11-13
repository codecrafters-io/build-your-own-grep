# Instruction to solve Stage 6
## Project Structure
We will start from scratch to get a clean implementation.
For this we decided to separate the parsing of the pattern from the input and the matching logic.
Therefore, we create a file `RegEx.hs` for the regex pattern matching and a `Parser.hs` for the parsing.
The `Main.hs` uses the functions from the other two files and glues everything together.

The project structure should look like this:

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

Before we write our first function we will create a type alias for our matching functions.
Every matching function will get a list of characters as input and will return a list of unprocessed inputs.


```Haskell
type M a = [a] -> [[a]]
```

We will begin with the most basic function: `singleM`.
`singleM` will be a function which checks if the first character from the input matches a given predicate.

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
* [ ] `altM :: [M a] -> M a` - matches if at least one matcher from the list was successful.
* [ ] `concatM :: [M a] -> M a`

We provided some tests, so you can verify your implementation.
You can run these tests with `stack test`.
After you implemented `concatM` correctly you finished the application logic for this stage, and you can start with the parser.

## Implement parser using megaparsec

We are going to implement a parser for the RegEx using the [megaparsec library](https://hackage.haskell.org/package/megaparsec).


## Next Stage
The big rewrite of our application is done!
In the next stage we are going to implement support for the *start of string* anchor.
