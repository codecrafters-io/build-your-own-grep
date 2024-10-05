const std = @import("std");

pub fn main() !void {
    // You can use print statements as follows for debugging, they'll be visible when running tests.
    std.debug.print("Logs from your program will appear here!\n", .{});

    if (std.os.argv.len != 3 or !std.mem.eql(u8, std.mem.span(std.os.argv[1]), "-E")) {
        std.debug.print("Usage: mygrep -E <pattern>\n", .{});
        std.process.exit(2);
    }

    // Uncomment this block to pass the first stage
    //const pattern = std.mem.span(std.os.argv[2]);
    //
    //    const stdin = std.io.getStdIn().reader();
    //    var buffer: [1024]u8 = undefined;
    //    const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n');
    //
    //    if (input) |line| {
    //        const matched = matchLine(line, pattern);
    //        if (!matched) {
    //            std.process.exit(1);
    //        }
    //    }
    //}
    //
    //fn matchLine(line: []const u8, pattern: []const u8) bool {
    //    if (pattern.len == 1) {
    //        for (line) |c| {
    //            if (c == pattern[0]) {
    //                return true;
    //            }
    //        }
    //    } else {
    //        std.debug.panic("Unhandeled pattern: {s}", .{pattern});
    //    }
    //    return false;
}
