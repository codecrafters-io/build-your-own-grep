The application logic for alternation is already implemented (`altM`).
We have to modify the parser to support the alternation (`|`).

```Haskell
expression  ::= subExpression (| expression)
```


# Final words & alternative implementations:

The implementation we have arrived at here is purely for educational and entertainment purposes.
It shows one way of how to solve this problem elegantly and simply using the basic idioms of the functional programming.
Searching the internet reveals a number of alternative and interesting ways in which one could have solved this problem:

- The current implementation is not the most efficient.
  We are basically writing a recursive decent parser for matching regular expressions, which is overkill.
  It so happens, that regular expressions can be compiled into finite state automata that can do the matching much faster.
  Here are some solutions that do this:
    - [Regex Calculus](https://crypto.stanford.edu/~blynn/haskell/re.html)
    - [Regular Expressions and Automata using Haskell](https://www.cs.kent.ac.uk/people/staff/sjt/craft2e/regExp.pdf)

- The current implementation, although quite compact, could be made even more so.
  It so happens that the algebraic constructs used for concatenation and choice are a specific form of the more general constructs `<*>` and `<|>` from the `Alternative` type class.
  After one has had this revelation, it is even possible to just provide the Haskell compiler functions to match individual characters and ask it to generate the code for the rest.
  Here are some solutions that do just this:
    - [Applicative Regular Expressions using the Free Alternative](https://blog.jle.im/entry/free-alternative-regexp.html)
    - [A simple regex writeup in Haskell](https://gist.github.com/t0yv0/1082416/cff5bcf8ee449f4ebd2296eb25e3d811717d6bd6)
