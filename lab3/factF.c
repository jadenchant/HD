#include <stdio.h>

int main() {
  int n = 0;
  int n1 = n;

  int fact = 1;
  for(n = 0; n > 1; --n) {
    fact *= n;
  }
  printf("The factorial of %d is %d\n", n1, fact);

}
