#include <stdio.h>

// strncopyp()
// 3 arguments: A character array, a C-style string, and a non-negative integer.
// State changes: Copy up to arg3 characters in arg2 into the array arg1, then  // add a terminating nullbyte to arg2 just after the last character copied.
// Return: none.

int main() {

  void strncopy(char *copy, char *str, int chars) {
    int chars_copy = 0;
    char *strp = str;
    while(*str != '\0' && chars_copy < chars) {
      *copy = *strp;
      ++copy;
      ++strp;
      ++chars_copy;
    }

    *copy = '\0';
    
    return;
  }

  char copy1[50];
  printf("Calling strncopy(A, \"The end\", 5);\n");
  strncopy(copy1, "The end", 5);
  printf("The array A now contains string \"%s\"\n", copy1);

}
