/*********************************************
 * callorca.c
 * A simple memory eater.
 * Call with number of megabytes to allocate
 * This is the sister of mallorca.c - it uses
 * calloc(3) instead of malloc(3)
 *********************************************/

#include <stdlib.h>
#include <stdio.h>
#include <limits.h>

int main(int argc, char *argv[]) {

  int errno = 0;
  char *p;
  char *q;
  long int i;

  if ( argc == 2 ) {
    long mb_in = strtol(argv[1], &p, 10);
    if (errno != 0 || *p != '\0' || mb_in > INT_MAX) {
      printf("Something went wrong. Anyway, have a nice day!\n");
      exit(1);
    }
    char *q = calloc(mb_in, 1048576);
        printf ("Allocated %ld bytes of precious memory!\n", 1048576 * mb_in);
    sleep(9999999);
  }
  else if ( argc > 2 ) {
    printf("Please only *one* argument, darling!\n");
    exit(1);
  }
  else {
    printf("Please provide the number of megabytes to allocate as one argument.\n");
    exit(1);
  }
}
