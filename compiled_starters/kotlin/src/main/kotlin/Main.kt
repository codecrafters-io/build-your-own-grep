import kotlin.system.exitProcess

fun main(args: Array<String>) {
    if (args.size != 2 || args[0] != "-E") {
        println("Usage: ./your_program.sh -E <pattern>")
        exitProcess(1)
    }

    val pattern = args[1]
    val inputLine = System.`in`.bufferedReader().readText()

    // You can use print statements as follows for debugging, they'll be visible when running tests.
    System.err.println("Logs from your program will appear here!")

    // Uncomment this block to pass the first stage
    // if (matchPattern(inputLine, pattern)) {
    //     exitProcess(0)
    // } else {
    //     exitProcess(1)
    // }
}

fun matchPattern(inputLine: String, pattern: String): Boolean {
    return if (pattern.length == 1) {
        pattern in inputLine
    } else {
        throw RuntimeException("Unhandled pattern: $pattern")
    }
}
