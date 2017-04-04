.SILENT:

default:
	gcc -lmraa -lm -o lab4_1 lab4_part1.c
	gcc -lpthread -lmraa -lm -o lab4_2 -g lab4_part2.c
	gcc -lcrypto -lssl -lpthread -lmraa -lm -o lab4_3 -g lab4_part3.c

clean:
	rm -f lab4_1.log lab4_2.log lab4_3.log lab4_1 lab4_2 lab4_3

dist:
	tar -czvf lab4-704637121.tar.gz lab4_1.log lab4_part1.c lab4_2.log lab4_part2.c lab4_3.log lab4_part3.c TrustStore.pem Makefile README
