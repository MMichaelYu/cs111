#!/bin/sh


NUM_PASSED=0
NUM_FAILED=0

# test case 1
echo ""
echo "test case 1:"
touch test1in.txt
./simpsh --verbose --profile --rdonly test1in.txt \
	 --creat --wronly test1out.txt --pipe --wait
rm -f test1in.txt test1out.txt

# test case 2 
echo ""
echo "--->test case 2:"
echo "Hello World" > test2in.txt
./simpsh --verbose --profile --rdonly test2in.txt \
	 --creat --wronly test2out.txt --creat --wronly test2err.txt \
	 --pipe --command 0 1 2 cat -
rm -f test2in.txt test2out.txt test2err.txt

# test case 3 --profile sort large file
echo ""
echo "--->test case 3:"
echo "HI WORLD" > test3in.txt
./simpsh --verbose --profile --rdonly test3in.txt \
	 --creat --wronly test3out.txt --creat --wronly test3err.txt \
	 --pipe --command 3 1 2 tr A-Z a-z --command 0 4 2 cat --wait
rm -f test3in.txt test3out.txt test3err.txt

