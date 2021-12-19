#include <stdio.h>
#include <math.h>

int main() {
  float v = 7.2;
  if(v < 0)
    printf("%f is negative\n", v);
  else if(v > 0)
    printf("%f is positive\n", v);
  else
    printf("%f is zero\n", v);

  float f = 2.5;
  if((int) f == f)
    printf("%f is an integer\n", f);
  else
    printf("%f is not an integer\n", f);

  int i = 26;
  float j = (float) sqrt(i);
  if((int) j == j)
    printf("The square root of %i is an integer\n", i);
  else
    printf("The square root of %i is not an integer\n", i);

}
