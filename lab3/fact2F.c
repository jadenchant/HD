#include <stdio.h>

int main() {
  int n;
  printf("Input an int: ");
  scanf("%d", &n);

  if(n < 0 || n > 10) {
    printf("not a small (<=10) non-negative integer\n");
    return 1;
  }

  int n1 = n;
  int fact = 1;
  for(n = n1; n > 1; --n) {
    fact *= n;
  }
  printf("The factorial of %d is %d\n", n1, fact);

}
