#include <stdio.h>

int main() {
  double arr[4] = {3.14, 72.6, 45, -13.8};

  double sum_arrayd(double a[], int len) {
    double sum = 0.0;
    int i;
    for(i = 0; i < len; ++i) {
      sum += a[i];
    }
    return sum;
  }

  printf("The sum of array elements is %g\n", sum_arrayd(arr, 4));
}
