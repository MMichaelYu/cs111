SortedList.h
	A header file for linked list operations.
SortedList.c
	Implements insert, delete, lookup, and length for a linked list.
lab2_list.c
	A C program that modifies a linked list and capable of multiple
	threads. Without locks, it is prone to errors as a result.
Makefile
	build: compile programs
	tests: runs test.sh and can run lab2a_sample_script.sh
	graphs: uses gnuplot to create graphs based on .csv files
	tarball: create a deliverable tarball
	clean: delete all files created by the Makefile
	profile: uses pprof to detail how time is spent in lab2_list in profile.gperf
lab2_list.csv
	Contains results from running make test and used to create graphs
graphs
	.png files graphing data from runs logged in the .csv files
profile.gperf
	Profile report created with pprof
Limitations
	It is hard for me to tell if the graphs I created are aligned with the
	expected results. So I do not know if I implemented everything
	correctly.

2.3.1 - Cycles in the basic implementation:
Where do you believe most of the cycles are spent in the 1 and 2-thread tests
(for both add and list)? Why do you believe these to be the most expensive parts
of the code?
   They are being spent doing the actual adding and list manipulation that
   utilizes function calls. The other part of the code involves the locking
   mechanisms but those should not have a lot of down time with only 1 or 2
   threads because at most they just have to wait for 1 other thread to complete
   the critical section.
Where do you believe most of the time/cycles are being spent in the high-thread
spin-lock tests?
   In high-thread spin-lock tests, most of the time is being spent on spinning
   and waiting for a thread to finish a critical section. This is because only 1
   thread can access a critical section at a time and there are many more
   threads waiting to access.
Where do you believe most of the time/cycles are being spent in the high-thread
mutex tests?
   In high-thread mutex tests, most of the time is being spent on waiting for
   locks to be unlocked by a thread. This is because only 1 thread can access a
   critical section at a time and there are many more threads waiting to access.

2.3.2 - Execution Profiling:
Where (what lines of code) are consuming most of the cycles when the spin-lock
version of the list exerciser is run with a large number of threads?
   Most of the time spent is on lines of code that wait for the spin-lock. The
   line in question is "while(__sync_lock_test_and_set(&foo, 1));". 
Why does this operation become so expensive with large numbers of threads?
   This operation is so expensive with large numbers of threads because every
   thread wants to access that critical section and be allowed past the
   spin-lock. But only 1 thread can go through it at a time while all the other
   threads have to continue spinning until it is their turn. With a lot of
   threads the queue for the thread to finally have its turn to run the critical
   section increases a lot and so does the wait time. 

2.3.3 - Mutex Wait Time:
Why does the average lock-wait time rise so dramatically with the number of
contending threads?
   Lock-wait time increases dramatically with a large number of contending
   threads because there is only 1 lock that is shared and must be obtained by a
   thread in order to run the critical section. With more threads, there is a
   longer wait for the thread to access the lock and increases the chance that
   the lock is already being used by a different thread.
Why does the completion time per operation rise (less dramatically) with the
number of contending threads?
   There is an increase in time due to the mutex being locked and unlocked for a
   greater possible amount of threads that want to access a critical section. It
   is a less dramatic increase because during the time an operation completes,
   there can be n-1 threads waiting for that amount of time, which we add up
   together.
How is it possible for the wait time per operation to go up faster (or higher)
than the completion time per operation?
   When 1 operation completes, there can be n-1 threads waiting for it to
   complete. Since we calculate the total wait time by adding each individual
   threads' wait times together versus calculating completion time by how long
   the entire program and all threads together takes to finish, wait time will
   increase faster.

2.3.4 - Performance of Partitioned Lists
Explain the change in performance of the synchronized methods as a function of
the number of lists. 
   As list number increases, performance increases. This is because with a
   higher number of lists, there will be less threads trying to access the same
   list and decrease conflicts and wait times, speeding up the whole process.
Should the throughput continue increasing as the number of lists is further
increased? If not, explain why not. 
   Throughput should not continue increasing because performance only increases
   when the chance for conflict decreases. Once the number of lists reaches a
   point where it is unlikely for two or more threads to access the same list at
   once, performance should stagnate.
It seems reasonable to suggest the throughput of an N-way partitioned list
should be equivalent to the throughput of a single list with fewer (1/N)
threads. Does this appear to be true in the above curves? If not, explain why
not.
   It is not true because when the list is partitioned, it becomes shorter and
   list operations like delete, include, etc take less time due to it being a
   shorter list. This is not the same effect with fewer threads, where the list
   is still the original size.
   
