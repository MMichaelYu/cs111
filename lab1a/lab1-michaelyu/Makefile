.SILENT:

default:
	gcc -o simpsh -g -std=gnu11 simpsh.c
clean:
	rm -f simpsh *.o *.tar.gz
check:
	./test.sh

DISTDIR = lab1-michaelyu
DIST_FILES = Makefile README test.sh simpsh.c

dist: $(DISTDIR)

$(DISTDIR): clean $(DIST_FILES)
	tar cf - --transform='s|^|$(DISTDIR)/|' $(DIST_FILES) | gzip -9 > $@.tar.gz



