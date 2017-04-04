lab2_add.c
	A C program that adds and subtracts from a shared variable using the
	command line. With multiple threads, this can cause errors.
SortedList.h
	A header file for linked list operations.
SortedList.c
	Implements insert, delete, lookup, and length for a linked list.
lab2_list.c
	A C program that modifies a linked list and capable of multiple
	threads. It is prone to errors as a result.
Makefile
	build: compile programs
	tests: runs test.sh and can run lab2a_sample_script.sh
	graphs: uses gnuplot to create graphs based on .csv files
	tarball: create a deliverable tarball
	clean: delete all files created by the Makefile
lab2_add.csv
	Contains results from Part-1
lab2_list.csv
	Contains results from Part-2
graphs
	.png files graphing data from runs logged in the .csv files

Limitations
	It is hard for me to tell if the graphs I created are aligned with the
	expected results. So I do not know if I implemented everything
	correctly, especially in the list variation.

Question 2.1.1
Why does it take many iterations before errors are seen?
    Larger iterations increases the number of times the add function is
    called. This results in more errors because the threads now have more
    chances to start the add function while another thread is changing the
    counter variable, which causes errors.
Why does a significantly smaller number of iterations so seldom fail?
    With smaller iterations the number of times the add function is called is
    relatively small. The add function is where errors are made when multiple
    threads want to modify the counter variable at the same time. If number of
    times add is called is minimized, the opportunity for error also minimizes.

Question 2.1.2
Why are the --yield runs so much slower? Where is the additional time going? Is
it possible to get valid per-operation timings if we are using the --yield
option? If so, explain how. If not, explain why not.
	The sched_yield function makes the calling thread relinquish the
	CPU. This causes a context switch to another thread which has
	overhead. The additional time is then going to the expensive
	overhead. It is not possible to get a valid per-operation timing when
	using the --yield option because the sched_yield occurs in the add
	function, and the time it takes to yield is considerably larger than
	the time it takes to update counter.  
    
Question 2.1.3
Why does the average cost per operation drop with increasing iterations? If the
cost per iteration is a function of the number of iterations, how do we know how
many iterations to run (or what the "correct" cost is)?
     At low iterations, the overhead of creating threads is a larger proportion
     of the overall cost of the program. With increasing iterations, the cost of
     creating threads becomes relatively small and matters less when calculating
     the average cost per iteration. The "correct" cost is when in the graph of
     average cost per iteration vs # of iterations levels out. This is around
     10000 iterations. 

Question 2.1.4
Why do all of the options perform similarly for low number of threads?
    With a low # of theads, conflicts between threads when trying to modify the
    counter variable is very low. The performance is most affected by just the
    testing of the various sync options.
Why do the three protected operations slow down as the number of threads rises?
    With increased threads, the number and chance for conflict between threads
    increases. When there is conflict between threads, there is waiting time
    which slows down the operations.
Why are spin-locks so expensive for large numbers of threads?
    Spin locks get more expensive when they fail and constantly retry or
    spin and use up CPU. 

Question 2.2.1
Compare the variation in time per protected operation vs the number of threads
for mutex-protected operations) in Part-1 and Part-2, commenting on
similarities/differences and offering explanations for them.
	They are lower in the linked list because synchronization cost is
	divided by the length of the list. The cost of mutexes increases faster
	for list than for add. This is due to a longer wait time for locks
	because of the list functions. Increased wait times increase the chance
	for conflict.
Question 2.2.2
Compare the variation in time per protected operation vs the number of threads
for Mutex vs Spin locks, commenting on similarities/differences and offering
explanations for them.
	     Spin locks are at first lower when compared to mutexes. However
	     cycles get wasted more when there are more conflicts making spin
	     locks more expensive at this point.
