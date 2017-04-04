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
int num_list = 1;
char sync = 'n';
pthread_mutex_t lock;
pthread_mutex_t *mutex_array;
int *spin_array;
SortedList_t *list;
SortedListElement_t *elements;
long *thread_times;

unsigned long hash(const char *str)
{
  unsigned long hash = 5381;
  int c;
  
  while (c = *str++)
    hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
  
  return hash;
}
void* thread_todo(void* thread_num)
{
  long mutex_time = 0;
  struct timespec mutex_s, mutex_e;
  
  for(int i = *(int*)thread_num; i < total_runs; i += num_threads)
    {
      int index = hash(elements[i].key) % num_list;
      switch(sync)
	{
	case 'm':
	  clock_gettime(CLOCK_MONOTONIC, &mutex_s);
	  pthread_mutex_lock(&mutex_array[index]);
	  clock_gettime(CLOCK_MONOTONIC, &mutex_e);
	  SortedList_insert(&list[index], &elements[i]); 
	  pthread_mutex_unlock(&mutex_array[index]);
	  mutex_time += 1000000000 * (mutex_e.tv_sec - mutex_s.tv_sec) + (mutex_e.tv_nsec - mutex_s.tv_nsec);
	  break;
	case 's':
	  while(__sync_lock_test_and_set(&spin_array[index], 1));
	  SortedList_insert(&list[index], &elements[i]);
	  __sync_lock_release(&spin_array[index]);
	  break;
	default:
	  SortedList_insert(&list[index], &elements[i]);
	  break;
	}
    }

  //length of lists
  int length = 0;
  for (int k = 0; k < num_list; k++)
    {
      switch(sync)
	{
	case 'm':
	  clock_gettime(CLOCK_MONOTONIC, &mutex_s);
	  pthread_mutex_lock(&mutex_array[k]);
	  clock_gettime(CLOCK_MONOTONIC, &mutex_e);
	  length = SortedList_length(&list[k]);
	  pthread_mutex_unlock(&mutex_array[k]);
	  mutex_time += 1000000000 * (mutex_e.tv_sec - mutex_s.tv_sec) + (mutex_e.tv_nsec - mutex_s.tv_nsec);
	  break;
	case 's':
	  while(__sync_lock_test_and_set(&spin_array[k], 1));
	  length = SortedList_length(&list[k]);
	  __sync_lock_release(&spin_array[k]);
	  break;
	default:
	  length = SortedList_length(&list[k]);
	  break;
	}
    }
   
      //len = SortedList_length(list);

      //lookup and delete
  SortedListElement_t *temp;

  for(int j = *(int*)thread_num; j < total_runs; j += num_threads)
    {
      int index = hash(elements[j].key) % num_list;
      switch(sync)
	{
	case 'm':
	  clock_gettime(CLOCK_MONOTONIC, &mutex_s);
	  pthread_mutex_lock(&mutex_array[index]);
	  clock_gettime(CLOCK_MONOTONIC, &mutex_e);
	  temp = SortedList_lookup(&list[index], elements[j].key);
	  SortedList_delete(temp);
	  pthread_mutex_unlock(&mutex_array[index]);
	  mutex_time += 1000000000 * (mutex_e.tv_sec - mutex_s.tv_sec) + (mutex_e.tv_nsec - mutex_s.tv_nsec);
	  break;
	case 's':
	  while(__sync_lock_test_and_set(&spin_array[index], 1));
	  temp = SortedList_lookup(&list[index], elements[j].key);
	  SortedList_delete(temp);
	  __sync_lock_release(&spin_array[index]);
	  break;
	default:
	  temp = SortedList_lookup(&list[index], elements[j].key);
	  SortedList_delete(temp);
	  break;
	}
    }
  thread_times[*(int*)thread_num] = mutex_time;
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
      {"lists", required_argument, 0, 'l'},
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
		{
		  fprintf(stderr, "Error: bad argument for yield\n");
		  exit(1);
		}
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
	      fprintf(stderr, "Error: bad argument for sync\n");
	      exit(1);
	    }
	  break;
	case 'l':
	  num_list = atoi(optarg);
	  break;
	default:
      
	  exit(1);
	}
    }
  //malloc mutex locks
  if(sync == 'm')
    {
      mutex_array = malloc(sizeof(pthread_mutex_t) * num_list);
      //pthread_mutex_init(&lock, NULL);
    }
  //malloc spin locks
  else if(sync == 's')
    {
      spin_array = malloc(sizeof(int) * num_list);
    }
  
  total_runs = num_threads * num_iters;
  
  //split the list
  
  list = malloc(sizeof(SortedList_t) * num_list);
  for (int y = 0; y < num_list; y++)
    {
      if (sync == 'm')
	pthread_mutex_init(&mutex_array[y], NULL);
      else if(sync == 's')
	spin_array[y] = 0;
      list[y].key = NULL;
      list[y].next = NULL;
      list[y].prev = NULL;
    }
  /*
  list->key = NULL;
  list->next = NULL;
  list->prev = NULL;
  */

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
  thread_times = malloc(num_threads * sizeof(long));
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
  long tot_mutex_time = 0;
  for (int l = 0; l < num_threads; l++)
    {
      tot_mutex_time += thread_times[l];
    }
  tot_mutex_time = tot_mutex_time / 3;
  long avg_time = tot_time / tot_ops;

  for (int p = 0; p < num_list; p++)
    {
      len += SortedList_length(&list[p]);
    }
  if(len != 0)
    {
      fprintf(stderr, "Final list length not 0\n");
      exit(1);
    }
  
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
  
  fprintf(stdout, "%d,%d,%d,%d,%d,%d,%d\n", num_threads, num_iters, num_list, tot_ops, tot_time, avg_time, tot_mutex_time);

  free(thread_times);
  free(thread_ids);
  free(elements);
  free(threads);
  exit(exit_status);
}
