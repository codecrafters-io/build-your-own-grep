package main

import (
	"bytes"
	"fmt"
	"io"
	"os"
	"strings"
	"unicode"
	"unicode/utf8"
)

// Usage: echo <input_text> | your_grep.sh -E <pattern>
func main() {
	if len(os.Args) < 3 || os.Args[1] != "-E" {
		fmt.Fprintf(os.Stderr, "usage: mygrep -E <pattern>\n")
		os.Exit(2) // 1 means no lines were selected, >1 means error
	}

	pattern := os.Args[2]

	line, err := io.ReadAll(os.Stdin) // assume we're only dealing with a single line
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: read input text: %v\n", err)
		os.Exit(2)
	}

	ok, err := matchLine(line, pattern)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(2)
	}

	if !ok {
		os.Exit(1)
	}

	// default exit code is 0 which means success
}

func matchLine(line []byte, pattern string) (bool, error) {
	switch {
	case pattern == "":
		return true, nil
	case strings.HasPrefix(pattern, "^"):
		return matchHere(line, pattern[1:])
	}

	for i := range string(line) { // range over string handles multibyte utf-8 characters correctly
		// try for every starting position
		ok, err := matchHere(line[i:], pattern)
		if err != nil {
			return false, err
		}
		if ok {
			return true, nil
		}
	}

	return false, nil
}

func matchHere(line []byte, pattern string) (bool, error) {
	switch {
	case pattern == "": // empty pattern matches anything
		return true, nil

	case pattern == "$":
		return len(line) == 0, nil

	case len(line) == 0: // if there's no input, the match failed
		return false, nil

	case strings.HasPrefix(pattern, `\d`):
		char, size := utf8.DecodeRune(line)
		if !unicode.IsDigit(char) {
			return false, nil
		}

		return matchHere(line[size:], pattern[2:]) // cut matching and continue for the remaining

	case strings.HasPrefix(pattern, `\w`):
		char, size := utf8.DecodeRune(line)
		if !unicode.IsLetter(char) {
			return false, nil
		}

		return matchHere(line[size:], pattern[2:])

	case strings.HasPrefix(pattern, "[^"):
		end := strings.IndexByte(pattern, ']')
		charset := pattern[2:end]

		char, size := utf8.DecodeRune(line)
		if strings.ContainsRune(charset, char) {
			return false, nil
		}

		return matchHere(line[size:], pattern[end+1:])

	case strings.HasPrefix(pattern, "["):
		end := strings.IndexByte(pattern, ']')
		charset := pattern[1:end]

		char, size := utf8.DecodeRune(line)
		if !strings.ContainsRune(charset, char) {
			return false, nil
		}

		return matchHere(line[size:], pattern[end+1:])

	case utf8.RuneCountInString(pattern) == 1:
		return bytes.ContainsAny(line, pattern), nil
	}

	patternChar, patternCharSize := utf8.DecodeRuneInString(pattern)
	if patternChar == utf8.RuneError {
		return false, fmt.Errorf("bad pattern")
	}

	char, size := utf8.DecodeRune(line)

	if char != patternChar {
		return false, nil
	}

	return matchHere(line[size:], pattern[patternCharSize:])
}
