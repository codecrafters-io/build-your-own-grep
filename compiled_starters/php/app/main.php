<?php
error_reporting(E_ALL);

function match_pattern($input_line, $pattern) {
    if (strlen($pattern) == 1) {
        return str_contains($input_line, $pattern);
    } else {
        throw new RuntimeException("Unhandled pattern: $pattern");
    }
}

$pattern = $argv[2];
$input_line = stream_get_contents(STDIN);

if ($argv[1] !== "-E") {
    fwrite(STDERR, "Expected first argument to be '-E'\n");
    exit(1);
}

// You can use print statements as follows for debugging, they'll be visible when running tests.
fwrite(STDERR, "Logs from your program will appear here!\n");

// TODO: Uncomment the code below to pass the first stage
// if (match_pattern($input_line, $pattern)) {
//     exit(0);
// } else {
//     exit(1);
// }
