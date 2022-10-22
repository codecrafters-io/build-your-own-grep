package main

import (
	"fmt"
	"io"
	"os"
	"bytes"
)

// Usage: echo <input_text> | your_grep.sh -E <pattern>
func main() {
	if len(os.Args) < 3 || os.Args[1] != "-E" {
		fmt.Fprintf(os.Stderr, "usage: mygrep -E <pattern>\n")
		os.Exit(2) // 1 means no lines were selected, >1 means error
	}

	pattern := os.Args[2]

	text, err := io.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: read input text: %v\n", err)
		os.Exit(3)
	}

	ok, err := match(text, pattern)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(4)
	}

	code := 0

	if !ok {
		code = 1
	}

	os.Exit(code)
}

func match(text []byte, pattern string) (bool, error) {
	var ok bool

	ok = bytes.IndexAny(text, pattern) != -1

	return ok, nil
}
