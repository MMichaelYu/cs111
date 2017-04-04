#!/bin/sh
#without yield
./lab2_add --threads=1 --iterations=100 >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100 >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100 >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100 >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100 >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=1000 >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=1000 >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=1000 >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=1000 >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=1000 >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=10000 >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10000 >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10000 >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10000 >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10000 >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100000 >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100000 >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100000 >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100000 >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100000 >> lab_2b_list.csv
#with yield
./lab2_add --threads=1 --iterations=10 --yield >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10 --yield >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10 --yield >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10 --yield >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10 --yield >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=20 --yield >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=20 --yield >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=20 --yield >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=20 --yield >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=20 --yield >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=40 --yield >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=40 --yield >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=40 --yield >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=40 --yield >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=40 --yield >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=80 --yield >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=80 --yield >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=80 --yield >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=80 --yield >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=80 --yield >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100 --yield >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100 --yield >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100 --yield >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100 --yield >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100 --yield >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=1000 --yield >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=1000 --yield >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=1000 --yield >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=1000 --yield >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=1000 --yield >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=10000 --yield >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10000 --yield >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10000 --yield >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10000 --yield >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10000 --yield >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100000 --yield >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100000 --yield >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100000 --yield >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100000 --yield >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100000 --yield >> lab_2b_list.csv
#sync=m yield
./lab2_add --threads=1 --iterations=10 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=20 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=20 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=20 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=20 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=20 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=40 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=40 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=40 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=40 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=40 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=80 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=80 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=80 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=80 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=80 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=1000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=1000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=1000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=1000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=1000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=10000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10000 --yield --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10000 --yield --sync=m >> lab_2b_list.csv
#sync=c yield
./lab2_add --threads=1 --iterations=10 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=20 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=20 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=20 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=20 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=20 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=40 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=40 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=40 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=40 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=40 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=80 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=80 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=80 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=80 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=80 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=1000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=1000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=1000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=1000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=1000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=10000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10000 --yield --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10000 --yield --sync=c >> lab_2b_list.csv
#sync=s yield
./lab2_add --threads=1 --iterations=10 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=20 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=20 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=20 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=20 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=20 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=40 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=40 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=40 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=40 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=40 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=80 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=80 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=80 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=80 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=80 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=1000 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=1000 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=1000 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=1000 --yield --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=1000 --yield --sync=s >> lab_2b_list.csv
#sync = m no yield
./lab2_add --threads=1 --iterations=10 --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10 --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10 --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10 --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10 --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=20 --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=20 --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=20 --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=20 --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=20 --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=40 --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=40 --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=40 --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=40 --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=40 --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=80 --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=80 --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=80 --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=80 --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=80 --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100 --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100 --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100 --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100 --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100 --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=10000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10000 --sync=m >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10000 --sync=m >> lab_2b_list.csv
#sync=c no yield
./lab2_add --threads=1 --iterations=10 --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10 --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10 --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10 --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10 --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=20 --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=20 --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=20 --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=20 --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=20 --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=40 --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=40 --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=40 --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=40 --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=40 --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=80 --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=80 --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=80 --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=80 --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=80 --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100 --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100 --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100 --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100 --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100 --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=1000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=1000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=1000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=1000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=1000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=10000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10000 --sync=c >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10000 --sync=c >> lab_2b_list.csv
#sync=s no yield
./lab2_add --threads=1 --iterations=10 --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10 --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10 --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10 --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10 --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=20 --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=20 --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=20 --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=20 --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=20 --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=40 --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=40 --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=40 --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=40 --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=40 --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=80 --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=80 --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=80 --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=80 --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=80 --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=100 --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=100 --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=100 --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=100 --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=100 --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=1 --iterations=10000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=2 --iterations=10000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=4 --iterations=10000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=8 --iterations=10000 --sync=s >> lab_2b_list.csv
./lab2_add --threads=12 --iterations=10000 --sync=s >> lab_2b_list.csv
#list
./lab2_list --threads=1 --iterations=10 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=100 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=10000 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=20000 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=10 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=10 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=10 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=10 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=100 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=100 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=100 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=100 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 >> lab_2b_list.csv
#yield=i
./lab2_list --threads=2 --iterations=2 --yield=i >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=4 --yield=i >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=8 --yield=i >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=16 --yield=i >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=32 --yield=i >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=2 --yield=i >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=4 --yield=i >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=8 --yield=i >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=16 --yield=i >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=32 --yield=i >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=2 --yield=i >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=4 --yield=i >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=8 --yield=i >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=16 --yield=i >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=32 --yield=i >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=2 --yield=i >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=4 --yield=i >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=8 --yield=i >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=16 --yield=i >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=32 --yield=i >> lab_2b_list.csv
#yield=d
./lab2_list --threads=2 --iterations=2 --yield=d >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=4 --yield=d >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=8 --yield=d >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=16 --yield=d >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=32 --yield=d >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=2 --yield=d >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=4 --yield=d >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=8 --yield=d >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=16 --yield=d >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=32 --yield=d >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=2 --yield=d >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=4 --yield=d >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=8 --yield=d >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=16 --yield=d >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=32 --yield=d >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=2 --yield=d >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=4 --yield=d >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=8 --yield=d >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=16 --yield=d >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=32 --yield=d >> lab_2b_list.csv
#yield=il
./lab2_list --threads=2 --iterations=2 --yield=il >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=4 --yield=il >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=8 --yield=il >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=16 --yield=il >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=32 --yield=il >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=2 --yield=il >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=4 --yield=il >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=8 --yield=il >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=16 --yield=il >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=32 --yield=il >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=2 --yield=il >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=4 --yield=il >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=8 --yield=il >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=16 --yield=il >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=32 --yield=il >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=2 --yield=il >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=4 --yield=il >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=8 --yield=il >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=16 --yield=il >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=32 --yield=il >> lab_2b_list.csv
#yield=dl
./lab2_list --threads=2 --iterations=2 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=4 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=8 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=16 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=32 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=2 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=4 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=8 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=16 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=32 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=2 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=4 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=8 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=16 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=32 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=2 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=4 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=8 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=16 --yield=dl >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=32 --yield=dl >> lab_2b_list.csv
#sync=m
./lab2_list --threads=2 --iterations=2 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=4 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=8 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=16 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=32 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=2 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=4 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=8 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=16 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=32 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=2 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=4 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=8 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=16 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=32 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=2 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=4 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=8 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=16 --yield=dl --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=32 --yield=dl --sync=m >> lab_2b_list.csv
#sync=s
./lab2_list --threads=2 --iterations=2 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=4 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=8 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=16 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=32 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=2 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=4 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=8 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=16 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=32 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=2 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=4 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=8 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=16 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=32 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=2 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=4 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=8 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=16 --yield=dl --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=32 --yield=dl --sync=s >> lab_2b_list.csv
#many iterations
./lab2_list --threads=1 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=24 --iterations=1000 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_list --threads=24 --iterations=1000 --sync=s >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=1000 --sync=m >> lab_2b_list.csv
./lab2_list --threads=24 --iterations=1000 --sync=m >> lab_2b_list.csv
#list no sync
./lab2_list --threads=1 --iterations=1 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=2 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=4 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=8 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=16 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=2 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=4 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=8 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=16 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=2 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=4 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=8 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=16 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=2 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=4 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=8 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=16 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=1 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=2 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=4 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=8 --yield=id --lists=4 >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=16 --yield=id --lists=4 >> lab_2b_list.csv 
#list with sync
./lab2_list --threads=1 --iterations=10 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=20 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=40 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=80 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=10 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=20 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=40 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=80 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=10 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=20 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=40 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=80 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=10 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=20 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=40 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=80 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=10 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=20 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=40 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=80 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=10 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=20 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=40 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=80 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=10 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=20 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=40 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=80 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=10 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=20 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=40 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=80 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=10 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=20 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=40 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=80 --yield=id --lists=4 --sync=s >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=10 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=20 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=40 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
./lab2_list --threads=16 --iterations=80 --yield=id --lists=4 --sync=m >> lab_2b_list.csv
#list performance test
./lab2_list --threads=1 --iterations=1000 --sync=m --lists=1 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=m --lists=1 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=m --lists=1 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=m --lists=1 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=m --lists=1 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=s --lists=1 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=s --lists=1 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=s --lists=1 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=s --lists=1 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=s --lists=1 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=m --lists=4 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=m --lists=4 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=m --lists=4 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=m --lists=4 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=m --lists=4 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=s --lists=4 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=s --lists=4 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=s --lists=4 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=s --lists=4 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=s --lists=4 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=m --lists=8 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=m --lists=8 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=m --lists=8 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=m --lists=8 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=m --lists=8 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=s --lists=8 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=s --lists=8 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=s --lists=8 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=s --lists=8 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=s --lists=8 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=m --lists=16 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=m --lists=16 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=m --lists=16 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=m --lists=16 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=m --lists=16 >> lab_2b_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=s --lists=16 >> lab_2b_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=s --lists=16 >> lab_2b_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=s --lists=16 >> lab_2b_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=s --lists=16 >> lab_2b_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=s --lists=16 >> lab_2b_list.csv
