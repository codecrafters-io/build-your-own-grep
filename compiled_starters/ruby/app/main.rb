def match_pattern(input_line, pattern)
  if pattern.length == 1
    input_line.include?(pattern)
  else
    raise "Unhandled pattern #{pattern}"
  end
end

def main
  pattern = ARGV[1]
  input_line = STDIN.gets

  if ARGV[0] != "-E"
    puts "Expected first argument to be '-E'"
    exit 1
  end

  # You can use print statements as follows for debugging, they'll be visible when running tests.
  puts "Logs from your program will appear here"
  
  # Uncomment this block to pass the first stage
  # if match_pattern(input_line, pattern)
  #   exit 0
  # else
  #   exit 1
  # end
end

main
