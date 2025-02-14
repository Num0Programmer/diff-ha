HARE=hare
HAREFLAGS=

DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin

all: diff

diff:
	$(HARE) build $(HAREFLAGS) -o $@ cmd/$@/

clean:
	rm -rf diff
