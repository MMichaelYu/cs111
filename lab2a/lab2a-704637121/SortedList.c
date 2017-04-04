#include "SortedList.h"
#include <string.h>
#include <sched.h>

void SortedList_insert(SortedList_t *list, SortedListElement_t *element)
{
	if(list == NULL || element == NULL)
	  return;
	SortedListElement_t *now = list->next;
	while(now != list)
	{
		if(strcmp(element->key, now->key) <= 0)
			break;
		now = now->next;
	}
	if(opt_yield & INSERT_YIELD)
		sched_yield();

	element->next = now;
	element->prev = now->prev;
	now->prev->next = element;
	now->prev = element;
}

int SortedList_delete(SortedListElement_t *element)
{
	if(element == NULL)
	  return 1;

	if(element->next->prev == element->prev->next)
	{
		if(opt_yield & DELETE_YIELD)
			sched_yield();

		element->prev->next = element->next;
		element->next->prev = element->prev;
		return 0;
	}
	return 1;
}

SortedListElement_t *SortedList_lookup(SortedList_t *list, const char *key)
{
	if(list == NULL || key == NULL)
	  return NULL;
	SortedListElement_t *now = list->next;
	while(now != list)
	{
		//Element found
		if(strcmp(now->key, key) == 0)
			return now;
		if(opt_yield & LOOKUP_YIELD)
			sched_yield();
		now = now->next;
	}
	return NULL;
}

int SortedList_length(SortedList_t *list)
{
	int counter = 0;
	if(list == NULL)
	  return -1;
	SortedListElement_t *now = list->next;
	while(now != list)
	{
		counter++;
		if(opt_yield & LOOKUP_YIELD)
			sched_yield();
		now = now->next;
	}
	return counter;
}
