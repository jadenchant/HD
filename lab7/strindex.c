#include <stdio.h>

int main() {

  int strindex(char *str, char val) {
    char *strp = str;
    int count = 0;
    while(*strp != '\0') {
      if(*strp == val) {
	return count;
      }
      ++strp;
      ++count;
    }
    return -1;
  }

  printf("Find the index of 'o', in 'hello world': %d\n", strindex("hello world", 'o'));

}
