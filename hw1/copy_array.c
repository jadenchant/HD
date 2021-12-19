#include <stdio.h>

int main() {
  int copy_array(int *copy, const int *og, int values) {
    int i;
    // int size_og = sizeof(og)/sizeof(int);
    for(i = 0; i < values; ++i) {
      copy[i] = og[i];
    }
    return i;
  }

  int count = 0;
  // Need dynamic allocation to set the array length
  int from_arr[10];
  int input;
  scanf("%d", &input);
  while(input != EOF && count < 10) {
    from_arr[count] = input;
    ++count;
    scanf("%d", &input);
  }
  printf("%d\n", count);

  int to_arr[++count];
  int values_copied = copy_array(to_arr, from_arr, count);
  printf("%d values copied", values_copied);
}
