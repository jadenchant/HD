#include <stdio.h>

int main() {

  int x = 0xc93e;
  printf("The value of x is %d in decimal, %x in hexadecimal\n", x, x);


  printf("Enter a decimal integer: ");
  int y;
  scanf("%d", &y);
  printf("The value of y is %d in decimal, %x in hexadecimal\n", y, y);
  return 0;

}
