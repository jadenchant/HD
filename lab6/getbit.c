#include <stdio.h>

int main() {

  int getbit(int num, int bitnum){
    int bitcat = 1;
    --bitnum;
    while(bitnum != 0) {
      bitcat *= 2;
      --bitnum;
    }
    if((num & bitcat) != 0) {
      return 1;
    } else {
      return 0;
    }
  }

  printf("Input a hex value: ");
  int x;
  scanf("%x", &x);

  int i;
  for(i = 8; i >= 1; --i) {
    printf("%d ", getbit(x, i));
  }
  printf("\n");
}
