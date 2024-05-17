The entry point for your grep implementation is in `app/Main.hs`.

Study and uncomment the relevant code: 

```haskell
-- Uncomment this block to pass stage 1
if head args /= "-E"
  then do
    putStrLn "Expected first argument to be '-E'"
    exitFailure
  else do if matchPattern pattern input_line
            then exitSuccess
            else exitFailure
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
