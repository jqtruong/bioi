#include "../lib/strang.h"

#define SAMPLE "GATGGAACTTGACTACGTAAATT"

int
main(int argc, char **argv)
{
  char *strand = argc == 2 ? argv[1] : SAMPLE;
  size_t size = strlen(strand);
  char *rna_transcription = malloc(size);

  strncpy(rna_transcription, strand, size);
  strang_rna_transcribe(rna_transcription);
  printf("%s\n", rna_transcription);
  free(rna_transcription);

  return 0;
}
