package main

import (
	"bufio"
	"bytes"
	"fmt"
	"io"
	"os"
)

// Usage: echo <input_text> | your_grep.sh -E <pattern>
func main() {
	if len(os.Args) < 3 || os.Args[1] != "-E" {
		fmt.Fprintf(os.Stderr, "usage: mygrep -E <pattern>\n")
		os.Exit(2) // 1 means no lines were selected, >1 means error
	}

	pattern := os.Args[2]

	ok, err := match(os.Stdin, pattern)
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

func match(r io.Reader, pattern string) (bool, error) {
	var ok bool
	s := bufio.NewScanner(r)

	for s.Scan() {
		line := s.Bytes()

		if matchLine(line, pattern) {
			ok = true
		}
	}

	if err := s.Err(); err != nil {
		return false, fmt.Errorf("scan input: %w", err)
	}

	return ok, nil
}

func matchLine(line []byte, pattern string) bool {
	var ok bool

	ok = bytes.ContainsAny(line, pattern)

	return ok
}
