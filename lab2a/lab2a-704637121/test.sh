#!/bin/sh
#without yield
./lab2_add --threads=1 --iterations=100 >> lab2_add.csv
./lab2_add --threads=2 --iterations=100 >> lab2_add.csv
./lab2_add --threads=4 --iterations=100 >> lab2_add.csv
./lab2_add --threads=8 --iterations=100 >> lab2_add.csv
./lab2_add --threads=12 --iterations=100 >> lab2_add.csv
./lab2_add --threads=1 --iterations=1000 >> lab2_add.csv
./lab2_add --threads=2 --iterations=1000 >> lab2_add.csv
./lab2_add --threads=4 --iterations=1000 >> lab2_add.csv
./lab2_add --threads=8 --iterations=1000 >> lab2_add.csv
./lab2_add --threads=12 --iterations=1000 >> lab2_add.csv
./lab2_add --threads=1 --iterations=10000 >> lab2_add.csv
./lab2_add --threads=2 --iterations=10000 >> lab2_add.csv
./lab2_add --threads=4 --iterations=10000 >> lab2_add.csv
./lab2_add --threads=8 --iterations=10000 >> lab2_add.csv
./lab2_add --threads=12 --iterations=10000 >> lab2_add.csv
./lab2_add --threads=1 --iterations=100000 >> lab2_add.csv
./lab2_add --threads=2 --iterations=100000 >> lab2_add.csv
./lab2_add --threads=4 --iterations=100000 >> lab2_add.csv
./lab2_add --threads=8 --iterations=100000 >> lab2_add.csv
./lab2_add --threads=12 --iterations=100000 >> lab2_add.csv
#with yield
./lab2_add --threads=1 --iterations=10 --yield >> lab2_add.csv
./lab2_add --threads=2 --iterations=10 --yield >> lab2_add.csv
./lab2_add --threads=4 --iterations=10 --yield >> lab2_add.csv
./lab2_add --threads=8 --iterations=10 --yield >> lab2_add.csv
./lab2_add --threads=12 --iterations=10 --yield >> lab2_add.csv
./lab2_add --threads=1 --iterations=20 --yield >> lab2_add.csv
./lab2_add --threads=2 --iterations=20 --yield >> lab2_add.csv
./lab2_add --threads=4 --iterations=20 --yield >> lab2_add.csv
./lab2_add --threads=8 --iterations=20 --yield >> lab2_add.csv
./lab2_add --threads=12 --iterations=20 --yield >> lab2_add.csv
./lab2_add --threads=1 --iterations=40 --yield >> lab2_add.csv
./lab2_add --threads=2 --iterations=40 --yield >> lab2_add.csv
./lab2_add --threads=4 --iterations=40 --yield >> lab2_add.csv
./lab2_add --threads=8 --iterations=40 --yield >> lab2_add.csv
./lab2_add --threads=12 --iterations=40 --yield >> lab2_add.csv
./lab2_add --threads=1 --iterations=80 --yield >> lab2_add.csv
./lab2_add --threads=2 --iterations=80 --yield >> lab2_add.csv
./lab2_add --threads=4 --iterations=80 --yield >> lab2_add.csv
./lab2_add --threads=8 --iterations=80 --yield >> lab2_add.csv
./lab2_add --threads=12 --iterations=80 --yield >> lab2_add.csv
./lab2_add --threads=1 --iterations=100 --yield >> lab2_add.csv
./lab2_add --threads=2 --iterations=100 --yield >> lab2_add.csv
./lab2_add --threads=4 --iterations=100 --yield >> lab2_add.csv
./lab2_add --threads=8 --iterations=100 --yield >> lab2_add.csv
./lab2_add --threads=12 --iterations=100 --yield >> lab2_add.csv
./lab2_add --threads=1 --iterations=1000 --yield >> lab2_add.csv
./lab2_add --threads=2 --iterations=1000 --yield >> lab2_add.csv
./lab2_add --threads=4 --iterations=1000 --yield >> lab2_add.csv
./lab2_add --threads=8 --iterations=1000 --yield >> lab2_add.csv
./lab2_add --threads=12 --iterations=1000 --yield >> lab2_add.csv
./lab2_add --threads=1 --iterations=10000 --yield >> lab2_add.csv
./lab2_add --threads=2 --iterations=10000 --yield >> lab2_add.csv
./lab2_add --threads=4 --iterations=10000 --yield >> lab2_add.csv
./lab2_add --threads=8 --iterations=10000 --yield >> lab2_add.csv
./lab2_add --threads=12 --iterations=10000 --yield >> lab2_add.csv
./lab2_add --threads=1 --iterations=100000 --yield >> lab2_add.csv
./lab2_add --threads=2 --iterations=100000 --yield >> lab2_add.csv
./lab2_add --threads=4 --iterations=100000 --yield >> lab2_add.csv
./lab2_add --threads=8 --iterations=100000 --yield >> lab2_add.csv
./lab2_add --threads=12 --iterations=100000 --yield >> lab2_add.csv
#sync=m yield
./lab2_add --threads=1 --iterations=10 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=10 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=10 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=10 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=10 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=20 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=20 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=20 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=20 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=20 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=40 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=40 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=40 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=40 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=40 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=80 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=80 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=80 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=80 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=80 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=100 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=100 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=100 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=100 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=100 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=1000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=1000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=1000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=1000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=1000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=10000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=10000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=10000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=10000 --yield --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=10000 --yield --sync=m >> lab2_add.csv
#sync=c yield
./lab2_add --threads=1 --iterations=10 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=10 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=10 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=10 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=10 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=20 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=20 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=20 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=20 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=20 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=40 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=40 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=40 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=40 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=40 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=80 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=80 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=80 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=80 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=80 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=100 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=100 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=100 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=100 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=100 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=1000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=1000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=1000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=1000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=1000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=10000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=10000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=10000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=10000 --yield --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=10000 --yield --sync=c >> lab2_add.csv
#sync=s yield
./lab2_add --threads=1 --iterations=10 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=10 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=10 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=10 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=10 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=20 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=20 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=20 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=20 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=20 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=40 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=40 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=40 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=40 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=40 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=80 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=80 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=80 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=80 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=80 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=100 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=100 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=100 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=100 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=100 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=1000 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=1000 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=1000 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=1000 --yield --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=1000 --yield --sync=s >> lab2_add.csv
#sync = m no yield
./lab2_add --threads=1 --iterations=10 --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=10 --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=10 --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=10 --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=10 --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=20 --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=20 --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=20 --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=20 --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=20 --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=40 --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=40 --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=40 --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=40 --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=40 --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=80 --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=80 --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=80 --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=80 --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=80 --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=100 --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=100 --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=100 --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=100 --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=100 --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=1000 --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=1000 --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=1000 --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=1000 --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=1000 --sync=m >> lab2_add.csv
./lab2_add --threads=1 --iterations=10000 --sync=m >> lab2_add.csv
./lab2_add --threads=2 --iterations=10000 --sync=m >> lab2_add.csv
./lab2_add --threads=4 --iterations=10000 --sync=m >> lab2_add.csv
./lab2_add --threads=8 --iterations=10000 --sync=m >> lab2_add.csv
./lab2_add --threads=12 --iterations=10000 --sync=m >> lab2_add.csv
#sync=c no yield
./lab2_add --threads=1 --iterations=10 --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=10 --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=10 --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=10 --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=10 --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=20 --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=20 --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=20 --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=20 --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=20 --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=40 --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=40 --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=40 --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=40 --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=40 --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=80 --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=80 --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=80 --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=80 --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=80 --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=100 --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=100 --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=100 --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=100 --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=100 --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=1000 --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=1000 --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=1000 --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=1000 --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=1000 --sync=c >> lab2_add.csv
./lab2_add --threads=1 --iterations=10000 --sync=c >> lab2_add.csv
./lab2_add --threads=2 --iterations=10000 --sync=c >> lab2_add.csv
./lab2_add --threads=4 --iterations=10000 --sync=c >> lab2_add.csv
./lab2_add --threads=8 --iterations=10000 --sync=c >> lab2_add.csv
./lab2_add --threads=12 --iterations=10000 --sync=c >> lab2_add.csv
#sync=s no yield
./lab2_add --threads=1 --iterations=10 --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=10 --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=10 --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=10 --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=10 --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=20 --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=20 --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=20 --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=20 --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=20 --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=40 --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=40 --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=40 --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=40 --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=40 --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=80 --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=80 --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=80 --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=80 --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=80 --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=100 --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=100 --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=100 --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=100 --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=100 --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=1000 --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=1000 --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=1000 --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=1000 --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=1000 --sync=s >> lab2_add.csv
./lab2_add --threads=1 --iterations=10000 --sync=s >> lab2_add.csv
./lab2_add --threads=2 --iterations=10000 --sync=s >> lab2_add.csv
./lab2_add --threads=4 --iterations=10000 --sync=s >> lab2_add.csv
./lab2_add --threads=8 --iterations=10000 --sync=s >> lab2_add.csv
./lab2_add --threads=12 --iterations=10000 --sync=s >> lab2_add.csv
#list
./lab2_list --threads=1 --iterations=10 >> lab2_list.csv
./lab2_list --threads=1 --iterations=100 >> lab2_list.csv
./lab2_list --threads=1 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=1 --iterations=10000 >> lab2_list.csv
./lab2_list --threads=1 --iterations=20000 >> lab2_list.csv
./lab2_list --threads=2 --iterations=10 >> lab2_list.csv
./lab2_list --threads=4 --iterations=10 >> lab2_list.csv
./lab2_list --threads=8 --iterations=10 >> lab2_list.csv
./lab2_list --threads=12 --iterations=10 >> lab2_list.csv
./lab2_list --threads=2 --iterations=100 >> lab2_list.csv
./lab2_list --threads=4 --iterations=100 >> lab2_list.csv
./lab2_list --threads=8 --iterations=100 >> lab2_list.csv
./lab2_list --threads=12 --iterations=100 >> lab2_list.csv
./lab2_list --threads=2 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=4 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=8 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=12 --iterations=1000 >> lab2_list.csv
#yield=i
./lab2_list --threads=2 --iterations=2 --yield=i >> lab2_list.csv
./lab2_list --threads=2 --iterations=4 --yield=i >> lab2_list.csv
./lab2_list --threads=2 --iterations=8 --yield=i >> lab2_list.csv
./lab2_list --threads=2 --iterations=16 --yield=i >> lab2_list.csv
./lab2_list --threads=2 --iterations=32 --yield=i >> lab2_list.csv
./lab2_list --threads=4 --iterations=2 --yield=i >> lab2_list.csv
./lab2_list --threads=4 --iterations=4 --yield=i >> lab2_list.csv
./lab2_list --threads=4 --iterations=8 --yield=i >> lab2_list.csv
./lab2_list --threads=4 --iterations=16 --yield=i >> lab2_list.csv
./lab2_list --threads=4 --iterations=32 --yield=i >> lab2_list.csv
./lab2_list --threads=8 --iterations=2 --yield=i >> lab2_list.csv
./lab2_list --threads=8 --iterations=4 --yield=i >> lab2_list.csv
./lab2_list --threads=8 --iterations=8 --yield=i >> lab2_list.csv
./lab2_list --threads=8 --iterations=16 --yield=i >> lab2_list.csv
./lab2_list --threads=8 --iterations=32 --yield=i >> lab2_list.csv
./lab2_list --threads=12 --iterations=2 --yield=i >> lab2_list.csv
./lab2_list --threads=12 --iterations=4 --yield=i >> lab2_list.csv
./lab2_list --threads=12 --iterations=8 --yield=i >> lab2_list.csv
./lab2_list --threads=12 --iterations=16 --yield=i >> lab2_list.csv
./lab2_list --threads=12 --iterations=32 --yield=i >> lab2_list.csv
#yield=d
./lab2_list --threads=2 --iterations=2 --yield=d >> lab2_list.csv
./lab2_list --threads=2 --iterations=4 --yield=d >> lab2_list.csv
./lab2_list --threads=2 --iterations=8 --yield=d >> lab2_list.csv
./lab2_list --threads=2 --iterations=16 --yield=d >> lab2_list.csv
./lab2_list --threads=2 --iterations=32 --yield=d >> lab2_list.csv
./lab2_list --threads=4 --iterations=2 --yield=d >> lab2_list.csv
./lab2_list --threads=4 --iterations=4 --yield=d >> lab2_list.csv
./lab2_list --threads=4 --iterations=8 --yield=d >> lab2_list.csv
./lab2_list --threads=4 --iterations=16 --yield=d >> lab2_list.csv
./lab2_list --threads=4 --iterations=32 --yield=d >> lab2_list.csv
./lab2_list --threads=8 --iterations=2 --yield=d >> lab2_list.csv
./lab2_list --threads=8 --iterations=4 --yield=d >> lab2_list.csv
./lab2_list --threads=8 --iterations=8 --yield=d >> lab2_list.csv
./lab2_list --threads=8 --iterations=16 --yield=d >> lab2_list.csv
./lab2_list --threads=8 --iterations=32 --yield=d >> lab2_list.csv
./lab2_list --threads=12 --iterations=2 --yield=d >> lab2_list.csv
./lab2_list --threads=12 --iterations=4 --yield=d >> lab2_list.csv
./lab2_list --threads=12 --iterations=8 --yield=d >> lab2_list.csv
./lab2_list --threads=12 --iterations=16 --yield=d >> lab2_list.csv
./lab2_list --threads=12 --iterations=32 --yield=d >> lab2_list.csv
#yield=il
./lab2_list --threads=2 --iterations=2 --yield=il >> lab2_list.csv
./lab2_list --threads=2 --iterations=4 --yield=il >> lab2_list.csv
./lab2_list --threads=2 --iterations=8 --yield=il >> lab2_list.csv
./lab2_list --threads=2 --iterations=16 --yield=il >> lab2_list.csv
./lab2_list --threads=2 --iterations=32 --yield=il >> lab2_list.csv
./lab2_list --threads=4 --iterations=2 --yield=il >> lab2_list.csv
./lab2_list --threads=4 --iterations=4 --yield=il >> lab2_list.csv
./lab2_list --threads=4 --iterations=8 --yield=il >> lab2_list.csv
./lab2_list --threads=4 --iterations=16 --yield=il >> lab2_list.csv
./lab2_list --threads=4 --iterations=32 --yield=il >> lab2_list.csv
./lab2_list --threads=8 --iterations=2 --yield=il >> lab2_list.csv
./lab2_list --threads=8 --iterations=4 --yield=il >> lab2_list.csv
./lab2_list --threads=8 --iterations=8 --yield=il >> lab2_list.csv
./lab2_list --threads=8 --iterations=16 --yield=il >> lab2_list.csv
./lab2_list --threads=8 --iterations=32 --yield=il >> lab2_list.csv
./lab2_list --threads=12 --iterations=2 --yield=il >> lab2_list.csv
./lab2_list --threads=12 --iterations=4 --yield=il >> lab2_list.csv
./lab2_list --threads=12 --iterations=8 --yield=il >> lab2_list.csv
./lab2_list --threads=12 --iterations=16 --yield=il >> lab2_list.csv
./lab2_list --threads=12 --iterations=32 --yield=il >> lab2_list.csv
#yield=dl
./lab2_list --threads=2 --iterations=2 --yield=dl >> lab2_list.csv
./lab2_list --threads=2 --iterations=4 --yield=dl >> lab2_list.csv
./lab2_list --threads=2 --iterations=8 --yield=dl >> lab2_list.csv
./lab2_list --threads=2 --iterations=16 --yield=dl >> lab2_list.csv
./lab2_list --threads=2 --iterations=32 --yield=dl >> lab2_list.csv
./lab2_list --threads=4 --iterations=2 --yield=dl >> lab2_list.csv
./lab2_list --threads=4 --iterations=4 --yield=dl >> lab2_list.csv
./lab2_list --threads=4 --iterations=8 --yield=dl >> lab2_list.csv
./lab2_list --threads=4 --iterations=16 --yield=dl >> lab2_list.csv
./lab2_list --threads=4 --iterations=32 --yield=dl >> lab2_list.csv
./lab2_list --threads=8 --iterations=2 --yield=dl >> lab2_list.csv
./lab2_list --threads=8 --iterations=4 --yield=dl >> lab2_list.csv
./lab2_list --threads=8 --iterations=8 --yield=dl >> lab2_list.csv
./lab2_list --threads=8 --iterations=16 --yield=dl >> lab2_list.csv
./lab2_list --threads=8 --iterations=32 --yield=dl >> lab2_list.csv
./lab2_list --threads=12 --iterations=2 --yield=dl >> lab2_list.csv
./lab2_list --threads=12 --iterations=4 --yield=dl >> lab2_list.csv
./lab2_list --threads=12 --iterations=8 --yield=dl >> lab2_list.csv
./lab2_list --threads=12 --iterations=16 --yield=dl >> lab2_list.csv
./lab2_list --threads=12 --iterations=32 --yield=dl >> lab2_list.csv
#sync=m
./lab2_list --threads=2 --iterations=2 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=2 --iterations=4 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=2 --iterations=8 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=2 --iterations=16 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=2 --iterations=32 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=4 --iterations=2 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=4 --iterations=4 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=4 --iterations=8 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=4 --iterations=16 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=4 --iterations=32 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=8 --iterations=2 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=8 --iterations=4 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=8 --iterations=8 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=8 --iterations=16 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=8 --iterations=32 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=12 --iterations=2 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=12 --iterations=4 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=12 --iterations=8 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=12 --iterations=16 --yield=dl --sync=m >> lab2_list.csv
./lab2_list --threads=12 --iterations=32 --yield=dl --sync=m >> lab2_list.csv
#sync=s
./lab2_list --threads=2 --iterations=2 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=2 --iterations=4 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=2 --iterations=8 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=2 --iterations=16 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=2 --iterations=32 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=4 --iterations=2 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=4 --iterations=4 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=4 --iterations=8 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=4 --iterations=16 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=4 --iterations=32 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=8 --iterations=2 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=8 --iterations=4 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=8 --iterations=8 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=8 --iterations=16 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=8 --iterations=32 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=12 --iterations=2 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=12 --iterations=4 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=12 --iterations=8 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=12 --iterations=16 --yield=dl --sync=s >> lab2_list.csv
./lab2_list --threads=12 --iterations=32 --yield=dl --sync=s >> lab2_list.csv
#many iterations
./lab2_list --threads=1 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=2 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=4 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=8 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=12 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=16 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=24 --iterations=1000 >> lab2_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=s >> lab2_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=s >> lab2_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=s >> lab2_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=s >> lab2_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=s >> lab2_list.csv
./lab2_list --threads=16 --iterations=1000 --sync=s >> lab2_list.csv
./lab2_list --threads=24 --iterations=1000 --sync=s >> lab2_list.csv
./lab2_list --threads=1 --iterations=1000 --sync=m >> lab2_list.csv
./lab2_list --threads=2 --iterations=1000 --sync=m >> lab2_list.csv
./lab2_list --threads=4 --iterations=1000 --sync=m >> lab2_list.csv
./lab2_list --threads=8 --iterations=1000 --sync=m >> lab2_list.csv
./lab2_list --threads=12 --iterations=1000 --sync=m >> lab2_list.csv
./lab2_list --threads=16 --iterations=1000 --sync=m >> lab2_list.csv
./lab2_list --threads=24 --iterations=1000 --sync=m >> lab2_list.csv
