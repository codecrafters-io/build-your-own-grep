import { TextDecoder } from "util";

const args = process.argv;
const pattern = args[3];

const inputBuffer: ArrayBuffer = await Bun.stdin.arrayBuffer();
const decoder: TextDecoder = new TextDecoder();
const inputLine: string = decoder.decode(inputBuffer);

function matchPattern(inputLine: string, pattern: string): boolean {
  if (pattern.length === 1) {
    return inputLine.includes(pattern);
  } else {
    throw new Error(`Unhandled pattern: ${pattern}`);
  }
}

if (args[2] !== "-E") {
  console.log("Expected first argument to be '-E'");
  process.exit(1);
}

if (matchPattern(inputLine, pattern)) {
  process.exit(0);
} else {
  process.exit(1);
}
