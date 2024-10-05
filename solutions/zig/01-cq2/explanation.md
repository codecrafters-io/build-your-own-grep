The entry point for your grep implementation is in `src/main.zig`.

Study and uncomment the relevant code: 

```zig
// Uncomment this block to pass the first stage
const pattern = std.mem.span(std.os.argv[2]);

   const stdin = std.io.getStdIn().reader();
   var buffer: [1024]u8 = undefined;
   const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

   if (input) |line| {
       const matched = matchLine(line, pattern);
       if (!matched) {
           std.process.exit(1);
       }
   }
}

fn matchLine(line: []const u8, pattern: []const u8) bool {
   if (pattern.len == 1) {
       for (line) |c| {
           if (c == pattern[0]) {
               return true;
           }
       }
   } else {
       std.debug.panic("Unhandeled pattern: {s}", .{pattern});
   }
   return false;
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
