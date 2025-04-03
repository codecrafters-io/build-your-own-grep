The entry point for your grep implementation is in `src/main.zig`.

Study and uncomment the relevant code: 

```zig
// Uncomment this block to pass the first stage

const pattern = args[2];
var input_line: [1024]u8 = undefined;
const input_len = try std.io.getStdIn().reader().read(&input_line);
const input_slice = input_line[0..input_len];
if (matchPattern(input_slice, pattern)) {
    std.process.exit(0);
} else {
    std.process.exit(1);
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
