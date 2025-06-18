package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:io"
import "core:unicode/utf8"
import "core:bytes"
import "core:bufio"

match_line :: proc(line: string, pattern: string) -> (matched: bool, err: string) {
    if utf8.rune_count(pattern) != 1 {
        return false, fmt.tprintf("unsupported pattern: %q", pattern)
    }
    
    matched = false

    // You can use print statements as follows for debugging, they'll be visible when running tests.
    fmt.eprintln("Logs from your program will appear here!")

    // Uncomment this to pass the first stage
    // matched = strings.contains(line, pattern)
    return matched, ""
}

main :: proc() {
    if len(os.args) < 3 || os.args[1] != "-E" {
        fmt.eprintf("usage: mygrep -E <pattern>\n")
        os.exit(2)
    }

    pattern := os.args[2]

    stdin_stream := os.stream_from_handle(os.stdin)
    reader := bufio.Reader{}
    bufio.reader_init(&reader, stdin_stream)

    line, read_err := bufio.reader_read_string(&reader, 0)
    if read_err != nil && read_err != io.Error.EOF {
        fmt.eprintf("error: read input text: %v\n", read_err)
        os.exit(1)
    }

    matched, match_err := match_line(line, pattern)
    if match_err != "" {
        fmt.eprintf("error: %s\n", match_err)
        os.exit(2)
    }

    os.exit(0 if matched else 1)
}
