The entry point for your grep implementation is in `app/Main.hs`.

Study and uncomment the relevant code: 

```haskell
-- Uncomment this to pass stage 1
if matchPattern pat input_line
then exitSuccess
  else exitFailure
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
