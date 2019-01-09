#include "../lib/strang.h"

#define SAMPLE "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

int
main(int argc, char **argv) {
  char *strand = argc == 2 ? argv[1] : SAMPLE;
  struct NTS nts = { 0, 0, 0, 0 };

  strang_count_acgt(&nts, strand);
  printf("%d %d %d %d\n",
         nts.A, nts.C, nts.G, nts.T);

  return 0;
}
