.SILENT:

default:
	gcc -lpthread -o lab2_add -g lab2_add.c
	gcc -lpthread -o lab2_list -g lab2_list.c SortedList.c 
build:
	gcc -lpthread -o lab2_add -g lab2_add.c
	gcc -lpthread -o lab2_list -g lab2_list.c SortedList.c
tests:
	-./test.sh
graphs:
	gnuplot lab2_list.gp
tarball:
	tar -czvf lab2b-704637121.tar.gz SortedList.h SortedList.c lab2_list.c Makefile lab2_add.c lab_2b_list.csv test.sh *.png README.txt lab2_list.gp *.gperf
clean:
	rm -f *.png lab2_add lab2_list lab_2b_list.csv *.gperf
profile:
	LD_PRELOAD=/u/cs/ugrad/michaely/gperf/lib/libprofiler.so CPUPROFILE=./raw.gperf ./lab2_list --threads=32 --iterations=1000 --sync=s
	pprof --text ./lab2_list ./raw.gperf > profile.gperf
	pprof --list=thread_todo ./lab2_list ./raw.gperf >> profile.gperf
	LD_PRELOAD=/u/cs/ugrad/michaely/gperf/lib/libprofiler.so CPUPROFILE=./raw.gperf ./lab2_list --threads=32 --iterations=1000 --sync=m
	pprof --text ./lab2_list ./raw.gperf >> profile.gperf
	pprof --list=thread_todo ./lab2_list ./raw.gperf >> profile.gperf



