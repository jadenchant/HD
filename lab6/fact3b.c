#include <stdio.h>

int main() {
  int n;
  printf("Input an int: ");
  scanf("%d", &n);

  if(n < 0 || n > 10) {
    printf("not a small (<=10) non-negative integer\n");
    return 1;
  }

  int index = 1;
  int fact = 1;
  
  printf("k    k!\n");
  printf("-    --------\n");
  
  if(n >= 0) {
    printf("0    1\n");
  }
  while(index <= n) {
    fact *= index;
    printf("%d    %d\n", index, fact);
    ++index;
  }
  return 0;
}
