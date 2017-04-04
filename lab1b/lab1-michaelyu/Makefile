.SILENT:

default:
	gcc -o simpsh -g -std=gnu11 simpsh.c
clean:
	rm -f simpsh *.o *.tar.gz
check:
	./test.sh


DIST_FILES = Makefile README test.sh simpsh.c

dist:

	tar cf - --transform='s|^|lab1-michaelyu/|' $(DIST_FILES) | gzip -9 > lab1-michaelyu.tar.gz



