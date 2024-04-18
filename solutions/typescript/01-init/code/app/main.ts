function matchPattern(inputLine: string, pattern: string): boolean {
    if (pattern.length === 1) {
        return inputLine.includes(pattern);
    } else {
        throw new Error(`Unhandled pattern: ${pattern}`);
    }
}

const args = Deno.args;
const pattern = args[1];

const decoder = new TextDecoder();
const inputLine = decoder.decode(await Deno.readAll(Deno.stdin));

if (args[0] !== "-E") {
    console.log("Expected first argument to be '-E'");
    Deno.exit(1);
}

if (matchPattern(inputLine, pattern)) {
    Deno.exit(0);
} else {
    Deno.exit(1);
}
