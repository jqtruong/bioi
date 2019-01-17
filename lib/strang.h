#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// struct NTS;
struct NTS {
  int A, C, G, T;
};

char *strang_store(const char *bases);
void strang_count_acgt(struct NTS *nts, const char *strand);
void strang_remove(char *buffer);
void strang_reverse_complement(char *strand);
void strang_rna_transcribe(char *strand);
