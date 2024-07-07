CFLAGS = -g -Wall -Wextra -Wconversion -Wsign-conversion
ALL_CFLAGS = -std=gnu11 $(CFLAGS)

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

bindir = /bin
prefix = /usr/local
DESTDIR = $(prefix)

include config.mk

.PHONY: all
all: guile-bits

guile-bits: LDLIBS += $(GUILE_LIBS)
guile-bits: main.o
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

main.o: CFLAGS += $(GUILE_CFLAGS)

.c.o:
	$(CC) $(ALL_CFLAGS) -o $@ -c $<

.PHONY: install
install:
	mkdir -p $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) guile-bits $(DESTDIR)$(bindir)/guile-bits
