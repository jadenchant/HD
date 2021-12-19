#include <stdio.h>

int main() {

  void strappend(char *og, char *app) {
    int count;
    int len;
    for(len = 0; og[len] != '\0'; ++len);
    for(count = 0; app[count] != '\0'; ++count) {
	og[len] = app[count];
	++len;
    }
    og[len] = '\0';
  }

  char A[100] = "From start ";
  strappend(A, "to finish");
  printf("%s\n", A);

} 
