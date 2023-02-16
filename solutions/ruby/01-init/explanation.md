The entry point for your grep implementation is in `app/main.rb`.

Study and uncomment the relevant code: 

```ruby
# Uncomment this block to pass the first stage
if match_pattern(input_line, pattern)
  exit(0)
else
  exit(1)
end
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
