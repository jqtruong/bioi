CC=gcc
CCFLAGS=-Wall
PRBSRC:=$(wildcard prb/*.c)		# problem sources
PRBBIN:=$(PRBSRC:prb/%.c=bin/%)		# problem binaries
LIBSRC=$(wildcard lib/*.c)		# custom lib sources
LIBOBJ=$(LIBSRC:%.c=%.o)		# custom lib objects
LIBBIN=$(LIBSRC:lib/%.c=bin/lib%.a)	# custom lib binaries
LIBS=$(foreach lib, \
	$(basename $(notdir $(LIBBIN))), \
	$(subst lib,-l,$(lib)))
LDFLAGS=-L./bin$(LIBS)

# a problem is compiled by first compiling all the custom libs and
# linking them
all: $(PRBBIN)

# put binaries in bin/ compiled with libs
bin/%: prb/%.c $(LIBBIN)
	$(CC) $(CCFLAGS) -o $@ $< $(LDFLAGS)

# a lib is built into an archive, also in bin/
bin/lib%.a: lib/%.o
	ar rcs $@ $^

# object files (in lib/)
%.o: %.c %.h			# .h might not exists
	$(CC) $(CCFLAGS) -o $@ -c $<

.PHONY: all

##################
# output example #
##################
# gcc -Wall -o lib/strang.o -c lib/strang.c
# ar rcs bin/libstrang.a lib/strang.o
# gcc -Wall -o bin/dna prb/dna.c -L./bin -lstrang
# rm bin/libstrang.a lib/strang.o

## idk where the rm comes from

#########################
# makefile special vars #
#########################
# $@ target
# $^ prereqs
# $< first prereq
