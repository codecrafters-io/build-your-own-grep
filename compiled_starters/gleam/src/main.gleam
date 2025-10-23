import argv
import gleam/erlang
import gleam/io
import gleam/string

pub fn main() {
  // You can use print statements as follows for debugging, they'll be visible when running tests.
  io.print_error("Logs from your program will appear here!")

  let args = argv.load().arguments
  let assert Ok(input_line) = erlang.get_line("")

  // Uncomment this to pass the first stage
  // case args {
  //   ["-E", pattern, ..] -> {
  //     case match_pattern(input_line, pattern) {
  //       True -> exit(0)
  //       False -> exit(1)
  //     }
  //   }
  //   _ -> {
  //     io.println("Expected first argument to be '-E'")
  //     exit(1)
  //   }
  // }
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

@external(erlang, "erlang", "halt")
pub fn exit(code: Int) -> Int
