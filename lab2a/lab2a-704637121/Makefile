.SILENT:

default:
	gcc -lpthread -o lab2_add -g lab2_add.c
	gcc -lpthread -o lab2_list -g lab2_list.c SortedList.c 
build:
	gcc -lpthread -o lab2_add -g lab2_add.c
	gcc -lpthread -o lab2_list -g lab2_list.c SortedList.c
tests:
	./lab2a_sample_script.sh
	./test.sh
graphs:
	gnuplot lab2_add.gp
	gnuplot lab2_list.gp
tarball:
	tar -czvf lab2a-704637121.tar.gz lab2_add.c SortedList.h SortedList.c lab2_list.c Makefile lab2_add.csv lab2_list.csv test.sh *.png README.txt
clean:
	rm -f *.png lab2_add lab2_list lab2_list.csv lab2_add.csv


