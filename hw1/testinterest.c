#include <stdio.h>

int main() {
  float moInterest(float principal, float rate) {
    return principal * (rate / 1200);
  }

  printf("moInterest(10000, 6) -> %f\n", moInterest(10000, 6));

}
