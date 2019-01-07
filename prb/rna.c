#include <stdio.h>

#define SAMPLE "GATGGAACTTGACTACGTAAATT"

void
rna_transcribe(char *dna_strand)
{
  
}

int
main(int argc, char **argv)
{
  char *strand = argc == 2 ? argv[1] : SAMPLE;

  while(*strand) {
    if (*strand == 'T')
    printf("%c\n", *strand);
    strand++;
  }

  return 0;
}
