#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>


int main() {
  sleep(5);
  pid_t pid = getpid();
  printf("pid=%d %s\n", pid, "...");
  return 0;
}
