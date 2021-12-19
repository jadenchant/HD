#include <stdio.h>

// read_string() 
// 2 arguments: An array of char, and an integer indicating the maximum number  // of values that may be stored in that array (including a final nullbyte).
// State changes:  Up to  arg2 - 1  char values are read from standard input and// stored in the array arg1, stopping if a newline character '\n' is read.  Do  // not store the newline character in arg1 for this function.  Finally, assign a// nullbyte character '\0' just after the last character stored in arg1.  
// Return:  int, the number of input values that were read and stored, not      // counting the final nullbyte.

int main() {
  
  int read_string(char *arr, int size) {
    int len = 0;
    char input;
    scanf("%c", &input);
    while(input != '\n' && len < (size - 1) && input != EOF) {
      arr[len] = input;
      ++len;
      scanf("%c", &input);
    }
    arr[len] = '\0';
    return len;
  }
  
  char mem[50];
  int message_len = read_string(mem, 50);
  printf("%s\n%d characters were stored\n", mem, message_len);

}
