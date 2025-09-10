The entry point for your grep implementation is in `src/main.zig`.

Study and uncomment the relevant code: 

```zig
// Uncomment this block to pass the first stage

var line_buffer: [1024]u8 = undefined;
const input_len = try stdin.read(&line_buffer);
const input_slice = line_buffer[0..input_len];

const pattern = args[2];
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
