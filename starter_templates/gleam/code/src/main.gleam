import argv
import gleam/io
import gleam/string

pub fn main() {
  let args = argv.load().arguments
  let input_line = get_line("")

  // You can use print statements as follows for debugging, they'll be visible when running tests.
  io.print_error("Logs from your program will appear here!")

  // TODO: Uncomment the code below to pass the first stage
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

@external(erlang, "io", "get_line")
fn get_line(prompt prompt: String) -> String

@external(erlang, "erlang", "halt")
pub fn exit(code: Int) -> Int
