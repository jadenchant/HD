#include <stdio.h>

int main() {

  int arr[5] = {1, 2, 3, 4, 5};
  
  int prod_array(int a[], int size) {
    int i, prod=1;
    for (i = 0; i < size; i++)
      prod = prod * a[i];
    return prod;
  }

  printf("The product of array elements is %d\n", prod_array(arr, 5));

}
