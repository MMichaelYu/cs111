#include <stdio.h>
#include <getopt.h>
#include <stdlib.h>
#include <time.h>
#include <pthread.h>

int num_threads, num_iter;
int opt_yield = 0;
pthread_mutex_t lock;
int foo = 0;
long long counter = 0;
char sync = 'n';
void add(long long *pointer, long long value)
{
  long long sum = *pointer + value;
  if (opt_yield)
    sched_yield();
  *pointer = sum;
}
void *thread_todo(void *ctr)
{
  int i;
  for (i = 0; i < num_iter; i++)
    {
      if (sync == 'm')
	{
	  pthread_mutex_lock(&lock);
	  add((long long *)ctr, 1);
	  pthread_mutex_unlock(&lock);
	}
      else if (sync == 's')
	{
	  while (__sync_lock_test_and_set(&foo, 1));
	  add((long long *) ctr, 1);
	  __sync_lock_release(&foo);
	}
      else if (sync == 'c')
	{
	  long long before;
	  long long after;
	  do
	    {
	      before = counter;
	      after = before + 1;
	      if (opt_yield)
		sched_yield();
	    } while(__sync_val_compare_and_swap(&counter, before, after)!= before);
	}
      else
	{
	  add((long long *)ctr, 1);
	}
    }
  
  for (i = 0; i < num_iter; i++)
    {
      if (sync == 'm')
	{
	  pthread_mutex_lock(&lock);
	  add((long long *)ctr, -1);
	  pthread_mutex_unlock(&lock);
	}
      else if (sync == 's')
	{
	  while (__sync_lock_test_and_set(&foo, 1));
	  add((long long *)ctr, -1);
	  __sync_lock_release(&foo);
	}
      else if (sync == 'c')
	{
	  long long before;
	  long long after;
	  do
	    {
	      before = counter;
	      after = before - 1;
	      if (opt_yield)
		sched_yield();
	    } while(__sync_val_compare_and_swap(&counter, before, after) != before);
	}
      else
	{
	  add((long long *)ctr, -1);
	}
		    
    }
  
  return NULL;
}
int main(int argc, char* argv[])
{
  struct timespec time1, time2;
  int c;

  static struct option long_options[]=
    {
      {"yield", no_argument, &opt_yield, 1},
      {"threads", optional_argument, 0, 'a'},
      {"iterations", optional_argument, 0, 'b'},
      {"sync", required_argument, 0, 'c'},
      {0, 0, 0, 0}
    };
  while (1)
    {
      int option_index = 0;
      c = getopt_long(argc, argv, "a::b::", long_options, &option_index);

      if (c == -1)
	break;

      switch (c)
	{
	case 0: 
	  break;
	  //--threads
	case 'a':
	  if (optarg)
	    num_threads = strtol(optarg, NULL, 10);
	  else
	    num_threads = 1;
	  break;
	  //--iterations
	case 'b':
	  if (optarg)
	    num_iter = strtol(optarg, NULL, 10);
	  else
	    num_iter = 1;
	  break;
	  //--sync
	case 'c':
	  sync = optarg[0];
	  break;
	case '?':
	  fprintf(stderr, "Unknown option\n");
	  return 1;
	  break;
	}
    }
  clock_gettime(CLOCK_MONOTONIC, &time1);
  pthread_t *ptr = malloc(sizeof(pthread_t)*num_threads);
  if (sync == 'm')
    {
      if (pthread_mutex_init(&lock, NULL) != 0)
	{
	  fprintf(stderr, "Error initializing mutex\n");
	  return 1;
	}
    }
  for (int i = 0; i < num_threads; i++)
    {
      int check = pthread_create(&ptr[i], NULL, thread_todo, &counter);
      if (check)
	{
	  fprintf(stderr, "Error creating threads\n");
	  return 1;
	}
    }
  for (int j = 0; j < num_threads; j++)
    {
      int check = pthread_join(ptr[j], NULL);
      if (check)
	{
	  fprintf(stderr, "Error joining threads\n");
	  return 1;
	}
    }
  clock_gettime(CLOCK_MONOTONIC, &time2);
  long total_time = 1000000000 * (time2.tv_sec - time1.tv_sec) + (time2.tv_nsec - time1.tv_nsec);
  int total_ops = num_threads * num_iter * 2;
  long avg_runtime = total_time / total_ops;
  if (opt_yield)
      fprintf(stdout, "add-yield-");
  else
    fprintf(stdout, "add-");
  if (sync != 'n')
    fprintf(stdout, "%c,", sync);
  else
    fprintf(stdout, "none,");
  fprintf(stdout, "%d,%d,%d,%d,%d,%d\n", num_threads, num_iter, total_ops, total_time, avg_runtime, counter);

  if (sync == 'm')
      pthread_mutex_destroy(&lock);
  free(ptr);
  return 0;
  
}
