#include "../lib/strang.h"

#define SAMPLE "AAAACCCGGT"

void
test(char *strand) {
  char *nt = strand;

  while (*nt) {
    if (*nt == 'T') *nt = 'U';
    nt++;
  }
}

int
main(int argc, char **argv)
{
  /* if using SAMPLE, need to make allocate memory and copy it to be
     able to manipulate it. */
  char *strand = argc == 2 ? argv[1] : SAMPLE;
  printf("%s\n", strand);

  size_t len = strlen(strand);
  char *reverse_complement = malloc(len);
  if (! reverse_complement) {
    fprintf(stderr, "failed to allocate memory for reverse_complement");
    return 1;
  }

  strncpy(reverse_complement, strand, len);
  strang_reverse_complement(reverse_complement);
  printf("%s\n", reverse_complement);
  free(reverse_complement);

  return 0;
}
