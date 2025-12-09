#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool match_pattern(const char* input_line, const char* pattern) {
    if (strlen(pattern) == 1) {
        return strchr(input_line, pattern[0]) != NULL;
    } else {
        fprintf(stderr, "Unhandled pattern %s\n", pattern);
        exit(1);
    }
}

int main(int argc, char* argv[]) {
    // Disable output buffering
    setbuf(stdout, NULL);
    setbuf(stderr, NULL);

    if (argc != 3) {
        fprintf(stderr, "Expected two arguments\n");
        return 1;
    }

    const char* flag = argv[1];
    const char* pattern = argv[2];

    if (strcmp(flag, "-E") != 0) {
        fprintf(stderr, "Expected first argument to be '-E'\n");
        return 1;
    }

    char input_line[1024];
    if (fgets(input_line, sizeof(input_line), stdin) == NULL) {
        return 1;
    }

    // Remove trailing newline
    input_line[strcspn(input_line, "\n")] = '\0';

    if (match_pattern(input_line, pattern)) {
        return 0;
    } else {
        return 1;
    }
}
