CC=gcc
CCFLAGS=-Wall
PRBSRC:=$(wildcard prb/*.c)	# problem sources
PRBBIN:=$(PRBSRC:prb/%.c=bin/%)	# problem binaries
LIBSRC=$(wildcard lib/*.c)	# custom lib sources
LIBOBJ=$(LIBSRC:%.c=%.o)	# custom lib objects
LIBBIN=$(LIBSRC:lib/%.c=bin/lib%.a) # custom lib binaries
LIBS=$(foreach lib, \
	$(basename $(notdir $(LIBBIN))), \
	$(subst lib,-l,$(lib)))
LDFLAGS=-L./bin$(LIBS)

all: $(PRBBIN)

bin/%: prb/%.c $(LIBBIN)
	$(CC) $(CCFLAGS) -o $@ $< $(LDFLAGS)

bin/lib%.a: lib/%.o
	ar rcs $@ $^

%.o: %.c %.h
	$(CC) $(CCFLAGS) -o $@ -c $<

.PHONY: all

##################
# output example #
##################
# gcc -Wall -o lib/strang.o -c lib/strang.c
# ar rcs bin/libstrang.a lib/strang.o
# gcc -Wall -o bin/dna prb/dna.c -L./bin -lstrang
# rm bin/libstrang.a lib/strang.o
