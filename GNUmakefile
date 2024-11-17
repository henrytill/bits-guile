CFLAGS = -g -Wall -Wextra -Wconversion -Wsign-conversion
ALL_CFLAGS = -std=gnu11 $(CFLAGS)

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

bindir = /bin
prefix = /usr/local
DESTDIR = $(prefix)

-include config.mk

.PHONY: all
all: bits-guile

bits-guile: LDLIBS += $(GUILE_LIBS)
bits-guile: main.o
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

main.o: CFLAGS += $(GUILE_CFLAGS)

.c.o:
	$(CC) $(ALL_CFLAGS) -o $@ -c $<

.PHONY: install
install:
	mkdir -p $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) bits-guile $(DESTDIR)$(bindir)/bits-guile

.PHONY: clean
clean:
	rm -f bits-guile
	rm -f main.o

.PHONY: distclean
distclean: clean
	rm -f aclocal.m4
	rm -rf autom4te.cache
	rm -f config.h
	rm -f config.h.in
	rm -f config.log
	rm -f config.mk
	rm -f config.status
	rm -f configure
	rm -f configure~
