#include <stdio.h>

// mean()
// 2 arguments. double (double-precision floating-point numbers)
// Return: A double, the average value of arg1 and arg2. 

// sum_input() 
// No arguments.
// State changes: Integer values are read from standard input, which is assumed // to consist only of a series of integer values.
// Return: A int, the sum of those input integers. 


int main() {

  double mean(double num1, double num2) {
    return (num1 + num2) / 2;
  }

  int sum_input() {
    int val;       /* holds next integer value from standard input */
    int sum = 0;   /* sum of input integers so far */
    while (scanf("%d", &val) != EOF) 
      sum = sum + val;
    return sum; 
  }

  printf("%f\n", mean(5, 8));
  printf("%d\n", sum_input());

}
