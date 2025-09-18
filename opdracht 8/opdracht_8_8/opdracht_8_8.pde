{
  printFibonacci(30);
}
void printFibonacci(int n) {
  int fib = 0;
  int ona = 1;
  int cci;
  println(fib);
  println(ona);
  for (int i = 2; i < n; i++) {
    cci = fib + ona;
    println(cci);
    fib = ona;
    ona = cci;
  }
}
