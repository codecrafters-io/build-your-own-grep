use std::env;
use std::io;
use std::process;

fn match_pattern(input_line: &str, pattern: &str) -> bool {
    match pattern {
        r"\d" => {
            for ch in input_line.chars() {
                match ch {
                    '0'..='9' => {
                        return true;
                    }
                    _ => continue
                }
            }

            false
        }
        r"\w" => {
            for ch in input_line.chars() {
                match ch {
                    '0'..='9' | 'a'..='z' | 'A'..='Z' | '_' => {
                        return true;
                    }
                    _ => continue
                }
            }

            false
        }
        _ => {
            if pattern.starts_with("[") {
                let end_index = if let Some(i) = pattern.find("]") {
                    i
                } else {
                    panic!("Unclosed '[' in pattern");
                };

                for ch in pattern.chars().skip(1).take(end_index - 1) {
                    if input_line.contains(ch) {
                        return true;
                    }
                }

                false
            }
            else if pattern.chars().count() == 1 {
                input_line.contains(pattern)
            } else {
                panic!("Unhandled pattern: {}", pattern);
            }
        }
    }
}

// Usage: echo <input_text> | your_grep.sh -E <pattern>
fn main() {
    if env::args().nth(1).unwrap() != "-E" {
        println!("Expected first argument to be '-E'");
        process::exit(1);
    }

    let pattern = env::args().nth(2).unwrap();
    let mut input_line = String::new();

    io::stdin().read_line(&mut input_line).unwrap();

    if match_pattern(&input_line, &pattern) {
        process::exit(0)
    } else {
        process::exit(1)
    }
}
