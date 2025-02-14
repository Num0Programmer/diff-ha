HARE=hare
HAREFLAGS=

DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin

all: diff

diff: cmd/diff/main.ha
	$(HARE) build $(HAREFLAGS) -o $@ cmd/$@/

clean:
	rm -rf diff
