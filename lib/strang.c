#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "strang.h"

void
strang_count_acgt(struct NTS *nts, const char *strand) {
  for (int i=0; i<strlen(strand); i++) {
    char nt = strand[i];
    switch (nt) {
    case 'A':
      nts->A++;
      break;
    case 'C':
      nts->C++;
      break;
    case 'G':
      nts->G++;
      break;
    case 'T':
      nts->T++;
      break;
    default:
      fprintf(stderr, "unknown nucleotide: %c\n", nt);
    }
  }
}

char *
strang_store(const char *bases) {
  // printf("%s: %zu characters\n", bases, strlen(bases));
  size_t len = strlen(bases);
  char *buffer = (char *) malloc(len*sizeof(char));

  return strcpy(buffer, bases);
}

void
strang_remove(char *buffer) {
  free(buffer);
  buffer = NULL;
}

void
__attribute__ ((constructor)) initLibrary(void) {
  /* initialize BASES */
}

void
__attribute__ ((destructor)) cleanUpLibrary(void) {
  /* free all BASES */
}
