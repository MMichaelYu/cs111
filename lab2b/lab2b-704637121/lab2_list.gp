#! /usr/local/cs/bin/gnuplot
#
# purpose:
#	 generate data reduction graphs for the multi-threaded list project
#
# input: lab_2b_list.csv
#	1. test name
#	2. # threads
#	3. # iterations per thread
#	4. # lists
#	5. # operations performed (threads x iterations x (ins + lookup + delete))
#	6. run time (ns)
#	7. run time per operation (ns)
#
# output:
#	lab2b_1.png ... cost per operation vs threads and iterations
#	lab2_list-2.png ... threads and iterations that run (un-protected) w/o failure
#	lab2_list-3.png ... threads and iterations that run (protected) w/o failure
#	lab2_list-4.png ... cost per operation vs number of threads
#
# Note:
#	Managing data is simplified by keeping all of the results in a single
#	file.  But this means that the individual graphing commands have to
#	grep to select only the data they want.
#

# general plot parameters
set terminal png
set datafile separator ","

# how many threads/iterations we can run without failure (w/o yielding)
set title "Throughput of spin-locked synchronized list operations"
set xlabel "Threads"
set logscale x 2
set ylabel "Throughput"
set logscale y 10
set output 'lab2b_1.png'

# grep out only any threaded, 10000 iteration, results from add and list
plot \
     "< grep 'list-none-s,.*,1000,1,' lab_2b_list.csv" using ($2):(1000000000/($7)) \
	title 'Spin-lock list ops' with linespoints lc rgb 'red', \
     "< grep 'list-none-m,.*,1000,1,' lab_2b_list.csv" using ($2):(1000000000/($7)) \
	title 'Mutex list ops' with linespoints lc rgb 'green', \
     "< grep 'add-s,.*,10000,' lab_2b_list.csv" using ($2):(1000000000/($6)) \
     	title 'Spin-lock add ops' with linespoints lc rgb 'orange', \
     "< grep 'add-m,.*,10000,' lab_2b_list.csv" using ($2):(1000000000/($6)) \
     	title 'Mutex add ops' with linespoints lc rgb 'blue'


set title "Mean Time per Mutex Wait and Mean Time per Operation for Mutex-Synchronized List Operations"
set xlabel "Threads"
set logscale x 2
# set xrange [0.75:]
set ylabel "Time(ns)"
set logscale y 10
set output 'lab2b_2.png'
# note that unsuccessful runs should have produced no output
plot \
     "< grep 'list-none-m,.*,1000,1,' lab_2b_list.csv" using ($2):($8) \
	title 'wait-for-lock time' with linespoints lc rgb 'green', \
     "< grep 'list-none-m,.*,1000,1,' lab_2b_list.csv" using ($2):($7) \
	title 'average time per operation' with linespoints lc rgb 'red' 
     
set title "Number of Successful Iterations for Each Synchronization"
# unset logscale x
# set xrange [0:5]
set xlabel "Threads"
# set xtics("" 0, "yield=i" 1, "yield=d" 2, "yield=il" 3, "yield=dl" 4, "" 5)
set ylabel "Successful Iterations"
set logscale y 10
set output 'lab2b_3.png'
plot \
    "< grep 'list-id-s,' lab_2b_list.csv" using ($2):($3) \
	with points lc rgb "blue" title "spin-lock", \
    "< grep 'list-id-m,' lab_2b_list.csv" using ($2):($3) \
	with points lc rgb "violet" title "mutex", \
    "< grep 'list-id-none,' lab_2b_list.csv" using ($2):($3) \
	with points lc rgb "red" title "yield=id"
  
# unset the kinky x axis
unset xtics
set xtics

set title "Throughput vs Number of Threads for Mutexes with Partitioned Lists"
set xlabel "Threads"
set logscale x 2
unset xrange
set xrange [0.75:]
set ylabel "Throughput"
set logscale y 10
set output 'lab2b_4.png'
set key left top
plot \
     "< grep 'list-none-m,.*,1000,1,' lab_2b_list.csv" using ($2):(1000000000/($7)) \
	title 'Lists=1' with linespoints lc rgb 'red', \
     "< grep 'list-none-m,.*,1000,4' lab_2b_list.csv" using ($2):(1000000000/($7)) \
	title 'Lists=4' with linespoints lc rgb 'green', \
     "< grep 'list-none-m,.*,1000,8' lab_2b_list.csv" using ($2):(1000000000/($7)) \
	title 'Lists=8' with linespoints lc rgb 'blue', \
     "< grep 'list-none-m,.*,1000,16' lab_2b_list.csv" using ($2):(1000000000/($7)) \
     	title 'Lists=16' with linespoints lc rgb 'violet'

set title "Throughput vs Number of Threads for Spin-Lock with Partitioned Lists"
set xlabel "Threads"
set logscale x 2
unset xrange
set xrange [0.75:]
set ylabel "Throughput"
set logscale y 10
set output 'lab2b_5.png'
set key left top
plot \
     "< grep 'list-none-s,.*,1000,1,' lab_2b_list.csv" using ($2):(1000000000/($7)) \
	title 'Lists=1' with linespoints lc rgb 'red', \
     "< grep 'list-none-s,.*,1000,4' lab_2b_list.csv" using ($2):(1000000000/($7)) \
	title 'Lists=4' with linespoints lc rgb 'green', \
     "< grep 'list-none-s,.*,1000,8' lab_2b_list.csv" using ($2):(1000000000/($7)) \
	title 'Lists=8' with linespoints lc rgb 'blue', \
     "< grep 'list-none-s,.*,1000,16' lab_2b_list.csv" using ($2):(1000000000/($7)) \
     	title 'Lists=16' with linespoints lc rgb 'violet'