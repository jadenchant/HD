#include <stdio.h>
#include <math.h>

int main() {
  int max_num = 5;

  printf("x  sqrt(x)\n-  -------\n");
  
  int i = 1;
  for(i = 1; i <= max_num; ++i) {
    printf("%d  %f\n",i, sqrt(i));
  }

  return 0;

}
