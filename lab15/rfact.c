#include <stdio.h>

int fact(int n) {
  if (n == 0) {
    return 1;
  }else {
    return n * fact(n-1);
  }
}


int main() {
  int x;
  printf("Input a non-negative integer: ");
  scanf("%d", &x);

  if(x < 0) {
    return -1;
  }

  printf("The factorial of %d is %d\n", x, fact(x));
  return 0;
}
