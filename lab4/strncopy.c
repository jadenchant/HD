#include <stdio.h>

// strncopy()
// 3 arguments: A character array, a C-style string, and a non-negative integer.
// State changes: Copy up to arg3 characters in arg2 into the array arg1, then  // add a terminating nullbyte to arg2 just after the last character copied.
// Return: none.

int main() {

  void strncopy(char *copy, const char *str, int chars) {
    int len = 0;
    while(str[len] != '\0' && len < chars) {
      ++len;
    }

    int i;
    for(i = 0; i < len; ++i) {
      copy[i] = str[i];
    }
    copy[len] = '\0';
    
    return;
  }

  char copy1[50];
  printf("Calling strncopy(A, \"The end\", 5);\n");
  strncopy(copy1, "The end", 5);
  printf("The array A now contains string \"%s\"\n", copy1);

}
