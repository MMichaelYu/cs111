.SILENT:

default:
	gcc -o lab0 -g lab0.c
check:
#test with normal arguments
	echo "test file" > input.txt;\
	./lab0 --input=input.txt --output=output.txt;\
	if [ $$? -ne 0 ];\
	then\
		echo "Program did not run correctly.";\
	else\
		echo "Program ran correctly.";\
	fi;\
	rm -f input.txt output.txt
#test for catch
	./lab0 --segfault --catch;\
	if [ $$? -ne 3 ];\
	then\
		echo "Program did not catch segmentation fault.";\
	else\
		echo "Program successfully caught segmentation fault.";\
	fi;
#test for segfault
	./lab0 --segfault;\
	if [ $$? -ne 139 ];\
	then\
		echo "Program did not experience segmentation fault.";\
	else\
		echo "Program did experience segmentation fault.";\
	fi;
#test for contents
	echo "test file" > input.txt;\
	./lab0 --input=input.txt --output=output.txt;\
	cmp input.txt output.txt;\
	if [ $$? -ne 0 ];\
	then\
		echo "Program did not correctly copy to output from input.";\
	else\
		echo "Program correctly copied to output from input.";\
	fi;\
	rm -f input.txt output.txt
#test with bad input file
	rm -f input.txt;\
	./lab0 --input=input.txt --output=output.txt;\
	if [ $$? -ne 1 ];\
	then\
		echo "Program did not catch an error with the input file.";\
	else\
		echo "Program caught error with input file.";\
	fi
#test with bad output file
	touch output.txt;\
	chmod u-w output.txt;\
	echo "test file" > input.txt;\
	./lab0 --input=input.txt --output=output.txt;\
	if [ $$? -ne 2 ];\
	then\
		echo "Program did not correctly catch an error with the output file.";\
	else\
		echo "Program caught error with output file.";\
	fi;\
	rm -f input.txt output.txt
clean:
	rm -f lab0 *.o *.tar.gz 
dist:
	tar -czf lab0-704637121.tar.gz lab0.c Makefile *.png README