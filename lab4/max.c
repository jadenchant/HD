#include <stdio.h>

// max()
// 2 arguments. double
// Return: A double, the maximum value, either arg1 or arg2

int main() {
  double n1;
  double n2;
  
  printf("Input 2 numerical values:\nValue 1: ");
  scanf("%lf", &n1);
  printf("Value 2: ");
  scanf("%lf", &n2);

  double max(double x, double y) {
    if (x < y)
      return y;
    else
      return x;
  } 


  printf("The call max(%g,%g) returns the value %g\n", n1, n2, max(n1, n2));

}
