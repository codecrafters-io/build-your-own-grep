The entry point for your grep implementation is in `src/Server.cpp`.

Study and uncomment the relevant code: 

```cpp
// Uncomment this block to pass the first stage
std::string input_line;
std::getline(std::cin, input_line);

try {
    if (match_pattern(input_line, pattern)) {
        return 0;
    } else {
        return 1;
    }
} catch (const std::runtime_error& e) {
    std::cerr << e.what() << std::endl;
    return 1;
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
