public class Main {
  public static void main(String[] args){
    if(args.length < 2 || !args[0].equals("-E")) {
      System.out.println("Expected first argument to be -E");
      return;
    }

    final String pattern = args[1];
    final String inputLine = System.console().readLine();

    if (inputLine.matches(pattern)) {
      System.exit(0);
    } else {
      System.exit(1);
    }
  }
}
