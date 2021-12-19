#include <stdio.h>
#include <math.h>

int main() {
  int max_num = 5;

  printf("x  sqrt(x)\n-  -------\n");
  
  int i = 1;
  while(i <= max_num) {
    printf("%d  %f\n",i, sqrt(i));
    ++i;
  }

  return 0;

}
