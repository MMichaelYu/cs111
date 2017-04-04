#include <stdio.h>
#include <getopt.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include <time.h>

#include "SortedList.h"

int num_iters = 1, num_threads = 1, len = 0, total_runs = 0;
int foo = 0;
int yield_i = 0, yield_d = 0, yield_l = 0;
int opt_yield = 0;
int yield_check = 0;
char sync = 'n';
pthread_mutex_t lock;
SortedList_t *list;
SortedListElement_t* elements;

void* thread_todo(void* thread_num)
{
  for(int i = *(int*)thread_num; i < total_runs; i += num_threads)
    {
      switch(sync)
	{
	case 'm':
	  pthread_mutex_lock(&lock);
	  SortedList_insert(list, &elements[i]); 
	  pthread_mutex_unlock(&lock);
	  break;
	case 's':
	  while(__sync_lock_test_and_set(&foo, 1));
	  SortedList_insert(list, &elements[i]);
	  __sync_lock_release(&foo);
	  break;
	default:
	  SortedList_insert(list, &elements[i]);
	  break;
	}
    }
  
  len = SortedList_length(list);
  SortedListElement_t *temp;
  
  for(int j = *(int*)thread_num; j < total_runs; j += num_threads)
    {
      switch(sync)
	{
	case 'm':
	  pthread_mutex_lock(&lock);
	  temp = SortedList_lookup(list, elements[j].key);
	  SortedList_delete(temp);
	  pthread_mutex_unlock(&lock);
	  break;
	case 's':
	  while(__sync_lock_test_and_set(&foo, 1));
	  temp = SortedList_lookup(list, elements[j].key);
	  SortedList_delete(temp);
	  __sync_lock_release(&foo);
	  break;
	default:
	  temp = SortedList_lookup(list, elements[j].key);
	  SortedList_delete(temp);
	  break;
	}
    }
  return NULL;
}

int main(int argc, char **argv)
{
  int opt = 0;
  int exit_status = 0;
  struct timespec time1, time2;
  static struct option long_opts[] = 
    {
      {"threads", required_argument, 0, 't'},
      {"yield", required_argument, 0, 'y'},
      {"sync", required_argument, 0, 's'},
      {"iterations", required_argument, 0, 'i'},
      {0, 0, 0, 0,}
    };
  
  while((opt = getopt_long(argc, argv, "t:i:s:y:", long_opts, NULL)) != -1)
    {
      switch(opt)
	{
	  //Threads
	case 't':
	  num_threads = atoi(optarg);
	  break;
	  //Iterations
	case 'i':
	  num_iters = atoi(optarg);
	  break;
	  //Yielding
	case 'y':
	  yield_check = 1;
	  for(int i = 0; *(optarg+i) != '\0'; i++)
	    {
	      if(*(optarg+i) == 'i')
		{
		  opt_yield |= INSERT_YIELD;
		  yield_i = 1;
		}
	      else if(*(optarg+i) == 'd')
		{
		  opt_yield |= DELETE_YIELD;
		  yield_d = 1;
		}
	      else if(*(optarg+i) == 'l')
		{
		  opt_yield |= LOOKUP_YIELD;
		  yield_l = 1;
		}
	      else
		  exit(1);
	    }
	  break;
	  //Syncing
	case 's':
	  if(strlen(optarg) == 1 && optarg[0] == 'm')
	    sync = 'm';
	  else if(strlen(optarg) == 1 && optarg[0] == 's')
	    sync = 's'; 
	  else
	    {
	      fprintf(stderr, "Bad argument for sync\n");
	      exit(1);
	    }
	  break;
	default:
      
	  exit(1);
	}
    }
  if(sync == 'm') { pthread_mutex_init(&lock, NULL); }
  
  total_runs = num_threads * num_iters;
  
  list = malloc(sizeof(SortedList_t));
  list->key = NULL;
  list->next = list;
  list->prev = list;

  elements = malloc(total_runs * sizeof(SortedListElement_t));
  
  int key_length = 8;
  for(int t = 0; t < total_runs; t++)
    {
      int rand_letter = rand() % 26;
      char* rand_key = malloc((key_length+1) * sizeof(char));
      for(int i = 0; i < key_length; i++)
	{
	  rand_key[i] = 'a' + rand_letter;
	  rand_letter = rand() % 26;
	}
      rand_key[key_length] = '\0';	
      elements[t].key = rand_key;
    }	
  
  pthread_t *threads = malloc(num_threads * sizeof(pthread_t));
  
  int* thread_ids = malloc(num_threads * sizeof(int));
  
  clock_gettime(CLOCK_MONOTONIC, &time1);
  for(int t = 0; t < num_threads; t++)
    {
      thread_ids[t] = t;
      int check = pthread_create(threads + t, NULL, thread_todo, &thread_ids[t]);
      if(check)
	{
	  fprintf(stderr, "Error creating threads");
	  exit(1);
	} 
    }
  
  for(int t = 0; t < num_threads; t++)
    {
      int check = pthread_join(threads[t], NULL);
      if(check)
	{
	  fprintf(stderr, "Error joining threads");
	  exit(1);
	} 
    }
  clock_gettime(CLOCK_MONOTONIC, &time2);
  
  long tot_time = 1000000000 * (time2.tv_sec - time1.tv_sec) + (time2.tv_nsec - time1.tv_nsec);
  int tot_ops = total_runs * 3;
  
  long avg_time = tot_time / tot_ops;
  fprintf(stdout, "list-");
  
  if (yield_i)
    fprintf(stdout, "i");
  if (yield_d)
    fprintf(stdout, "d");
  if (yield_l)
    fprintf(stdout, "l");
  if (yield_check == 0)
    fprintf(stdout, "none");
  
  if (sync != 'n')
    fprintf(stdout, "-%c,", sync);
  else
    fprintf(stdout, "-none,");
  
  fprintf(stdout, "%d,%d,1,%d,%d,%d\n", num_threads, num_iters, tot_ops, tot_time, avg_time);
  
  len = SortedList_length(list);
  if(len != 0)
    {
      fprintf(stderr, "Final list length not 0\n");
      exit(1);
    }
  free(thread_ids);
  free(elements);
  free(threads);
  exit(exit_status);
}
