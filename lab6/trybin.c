#include <stdio.h>

int main() {

  short x = 37;
  printf("x has the value %d in decimal, %x in hexadecimal\n", x, x);
  printf("x & 1 has the value %d in decimal, %x in hexadecimal\n", x & 1, x & 1);
  printf("x | 1 has the value %d in decimal, %x in hexadecimal\n", x | 1, x | 1);
  printf("x << 1 has the value %d in decimal, %x in hexadecimal\n", x << 1, x << 1);
  printf("length of short: %d\n", sizeof(short));
  printf("x << 4 has the value %hd in decimal, %hx in hexadecimal\n", x << 4, x << 4);
  printf("x >> 2 has the value %d in decimal, %x in hexadecimal\n", x >> 2, x >> 2);
  printf("(x >> 4) & 1 has the value %d in decimal, %x in hexadecimal\n", (x >> 4) & 1, (x >> 4) & 1);
  printf("(x >> 5) & 1 has the value %d in decimal, %x in hexadecimal\n", (x >> 5) & 1, (x >> 5) & 1);
}
