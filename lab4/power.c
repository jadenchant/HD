#include <stdio.h>

int main() {
  
  int power(int base, int exp) {
    int result = 1;
    int i;
    for(i = exp; i > 0; --i) {
      result *= base;
    }
    return result;
  }

  int b = 5;
  int e = 2;
  printf("Base: %d\nExponent: %d\nResult: %d\n", b, e, power(b, e));


  b = 10;
  e = 0;
  printf("Base: %d\nExponent: %d\nResult: %d\n", b, e, power(b, e));
}
