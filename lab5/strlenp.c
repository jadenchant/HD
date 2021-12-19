#include <stdio.h>

int main() {

  int strlen(char *str) {
    char *strp = str;
    int count = 0;
    while(*strp != '\0') {
      ++count;
      ++strp;
    }

    return count;
  }

  int x;
  x = strlen("The end");
  printf("The return value from strlen(\"The end\") is %d\n", x);

}
