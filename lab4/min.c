#include <stdio.h>

// min()
// 2 arguments. double
// Return: A double, the minimum value, either arg1 or arg2

int main() {
  double n1;
  double n2;
  
  printf("Input 2 numerical values:\nValue 1: ");
  scanf("%lf", &n1);
  printf("Value 2: ");
  scanf("%lf", &n2);

  double min(double x, double y) {
    if (x > y)
      return y;
    else
      return x;
  } 


  printf("The call min(%g,%g) returns the value %g\n", n1, n2, min(n1, n2));

}
