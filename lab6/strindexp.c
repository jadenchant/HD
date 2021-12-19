#include <stdio.h>

int main() {

  int strindex(char *str, char val) {
    char *strp = str;
    int index = 0;
    while(*strp != '\0') {
      if(*strp == val) {
	return index;
      }
      ++strp;
      ++index;
    }
    return -1;
  }

  printf("The return value from strindex(\"The end\", 'e') is %d\n", strindex("The end", 'e'));
  printf("The return value from strindex(\"The end\", 'a') is %d\n", strindex("The end", 'a'));

}
