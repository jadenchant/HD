#include <stdio.h>

int main() {
  int n = 0;
  int n1 = n;

  int fact = 1;
  while(n > 1) {
    fact *= n;
    --n;
  }
  printf("The factorial of %d is %d\n", n1, fact);

}
