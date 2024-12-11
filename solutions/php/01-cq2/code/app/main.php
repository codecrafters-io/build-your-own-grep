<?php
error_reporting(E_ALL);

function match_pattern($input_line, $pattern) {
    if (strlen($pattern) == 1) {
        return str_contains($input_line, $pattern);
    } else {
        throw new RuntimeException("Unhandled pattern: $pattern");
    }
}

function main($argv) {
    $pattern = $argv[2];
    $input_line = stream_get_contents(STDIN);

    if ($argv[1] !== "-E") {
        fwrite(STDERR, "Expected first argument to be '-E'\n");
        exit(1);
    }

    if (match_pattern($input_line, $pattern)) {
        exit(0);
    } else {
        exit(1);
    }
}

main($argv);