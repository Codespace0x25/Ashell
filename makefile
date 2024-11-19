PREFIX := /usr/local
BINDIR := $(PREFIX)/bin

all: build/AShell

build:
	mkdir -p build

build/AShell.o: src/main.asm | build
	as -o build/AShell.o src/main.asm

build/AShell: build/AShell.o
	gcc -o build/AShell build/AShell.o

install: build/AShell
	sudo install -Dm755 build/AShell $(BINDIR)/AShell
	grep -qxF "$(BINDIR)/AShell" /etc/shells || echo "$(BINDIR)/AShell" | sudo tee -a /etc/shells

clean:
	rm -rf build

.PHONY: all build install clean

