import argv

pub fn main() {
  // You can use print statements as follows for debugging, they'll be visible when running tests.
  io.println("Logs from your program will appear here!")

  let args = argv.load().arguments
  input_line = io.read_line()
  
  // Uncomment this to pass the first stage
  case args {
    ["-E", pattern, ..] -> {
        case match_pattern(input_line, pattern) {
            True -> io.exit(0)
            False -> io.exit(1)
          }
    }
    _ -> {
      io.println("Expected first argument to be '-E'")
    }
  }
}

fn match_pattern(input_line: String, pattern: String) -> Bool {
    case string.length(pattern) {
      1 -> string.contains(input_line, pattern)
      _ -> {
        io.println("Unhandled pattern: " <> pattern)
        False
      }
    }
}