The entry point for your grep implementation is in `src/main/java/Main.java`.

Study and uncomment the relevant code: 

```java
// Uncomment this block to pass the first stage

if (matchPattern(inputLine, pattern)) {
    System.exit(0);
} else {
    System.exit(1);
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
