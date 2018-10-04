CC=gcc
CCFLAGS=-Wall
PRBSRC:=$(wildcard prb/*.c)
PRBBIN:=$(PRBSRC:prb/%.c=bin/%)
LIBSRC=$(wildcard lib/*.c)
LIBOBJ=$(LIBSRC:%.c=%.o)
LIBBIN=$(LIBSRC:lib/%.c=bin/lib%.a)
LIBS=$(foreach lib, \
	$(basename $(notdir $(LIBBIN))), \
	$(subst lib,-l,$(lib)))
LDFLAGS=-L./bin$(LIBS)

# @echo $@ $^ #

all: $(PRBBIN)

bin/%: prb/%.c $(LIBBIN)
	$(CC) $(CCFLAGS) -o $@ $< $(LDFLAGS)

bin/lib%.a: lib/%.o
	ar rcs $@ $^

%.o: %.c %.h
	$(CC) $(CCFLAGS) -o $@ -c $<

.PHONY: all
