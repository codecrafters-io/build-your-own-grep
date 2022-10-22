The entry point for your grep implementation is in `cmd/mygrep/main.go`.

Study and uncomment the relevant code: 

```go
// Uncomment this to pass the first stage
"bytes"
```

```go
// Uncomment this to pass the first stage
line := s.Bytes()

if bytes.IndexAny(line, pattern) != -1 {
	ok = true
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
