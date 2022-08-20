import sys

# import pyparsing - available if you need it!
# import lark - available if you need it!


def match_here(remaining_input, pattern):
    # Base case: empty pattern matches any input
    if pattern == "":
        return True

    # If we're matching an end of string anchor, the remaining input should be empty
    if pattern == "$":
        return remaining_input == ""

    # Base case: if there's no input remaining, the match failed
    if remaining_input == "":
        return False

    if pattern.startswith("\\d"):
        if remaining_input[0].isdigit():
            return match_here(remaining_input[1:], pattern[2:])
        else:
            return False

    elif pattern.startswith("\\w"):
        if remaining_input[0].isalnum():
            return match_here(remaining_input[1:], pattern[2:])
        else:
            return False

    elif pattern.startswith("[^"):
        characters_in_negative_character_group = pattern.split(']')[0][2:]

        if remaining_input[0] not in characters_in_negative_character_group:
            return match_here(remaining_input[1:], pattern[3+len(characters_in_negative_character_group):])
        else:
            return False
    elif pattern.startswith("["):
        characters_in_positive_character_group = pattern.split(']')[0][1:]

        if remaining_input[0] in characters_in_positive_character_group:
            return match_here(remaining_input[1:], pattern[2+len(characters_in_positive_character_group):])
        else:
            return False
    else:
        if remaining_input[0] == pattern[0]:
            return match_here(remaining_input[1:], pattern[1:])
        else:
            return False


def match_pattern(input_line, pattern):
    if pattern[0] == "^":
        return match_here(input_line, pattern[1:])

    if match_here(input_line, pattern):
        return True
    else:
        return match_here(input_line[1:], pattern)


def main():
    pattern = sys.argv[2]
    input_line = sys.stdin.read().splitlines()[0]

    if sys.argv[1] != "-E":
        print("Expected first argument to be '-E'")
        exit(1)

    if match_pattern(input_line, pattern):
        exit(0)
    else:
        exit(1)


if __name__ == "__main__":
    main()
