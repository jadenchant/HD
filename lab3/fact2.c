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
  while(n > 1) {
    fact *= n;
    --n;
  }
  printf("The factorial of %d is %d\n", n1, fact);

}
