#include <stdio.h>

// strlen()
// 1 argument: A C-style string.
// Return: int, the number of characters in arg1 (excluding the nullbyte).

int main() {
  
  int strlen(const char *str) {
    int len;
    for(len = 0; str[len] != '\0'; ++len) { }

    return len;
  }

  printf("The return value from strlen(\"The end\") is %d\n", strlen("the end"));


}
