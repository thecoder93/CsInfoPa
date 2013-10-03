#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Priority_Queue.h"

static int order = 1;

void swap_node(heap_node *elements, int n1, int n2)
{
	heap_node temp;

	temp = elements[n1];
	elements[n1] = elements[n2];
	elements[n2] = temp;
}

int compare_priority(heap_node *i, heap_node *j)
{
	float t = i->priority - j->priority;

	if(t>0)
		return 1*order;

	if(t<0)
		return -1*order;

	return 0;
}

void heap_init_node(heap_node *node, int key, float prior, void *sat_data, int data_size)
{
	node->key = key;
	node->priority = prior;
	node->sat_data_size = data_size;

	if(sat_data != NULL)
	{
		node->sat_data = (void *)malloc(data_size);
		memcpy(node->sat_data, sat_data, data_size);
	}
}

/* Function which takes a heap rooted at the given index and make sure
 * that is confroms to the heap critera. Adapted from Introduction to
 * Algorithms (Cormen, Leiserson, Rivest 1990) page 143 */

void heapify(binary_heap *a, int i) 
{
	register int l, r, largest = i;

	l = LEFT(i);
	r = RIGHT(i);

	/* check the left child */
	if((l <= a->heap_size && (compare_priority(&a->elements[l], &a->elements[i]) > 0)))
		largest = l;

	/* check the right child */
	if(r <= a->heap_size && (compare_priority(&a->elements[r], &a->elements[largest]) > 0))
	  largest = r;

	if(largest != i) 
	{ 
		/* swap nodes largest and i, then heapify */
		swap_node(a->elements, i, largest);
		heapify(a, largest);
	}
}

/* Function to return the max (first) node of a heap */

heap_node *heap_max(binary_heap *a)
{ 
	return ((a->heap_size <= 0) ? NULL : &(a->elements[1])); 
}

/* Function to remove the max node from the heap and return it.  The
 * running time is O(lg(n)) since it performs only a costant amount of
 * work on top of the O(lg(n)) of heapify(). Adapted from Introduction
 * to Algorithms (Cormen, Leiserson, Rivest 1990) page 150 
*/

heap_node heap_extract_max(binary_heap *a)
{
	heap_node max;

	//max.sentinel = 1;

	/* if there are elements in the heap, make the last item in the heap
	* the first one, shorten the heap by one and call heapify(). 
	*/

	if (a->heap_size >= 1) 
	{
		max = a->elements[1];
		a->elements[1] = a->elements[(a->heap_size)--];
		heapify(a,1);
	}

	return max;
}

/* Function to insert an element into the heap, worst case running
 * time is O(lg(n)) on an n element heap, since the path traced from
 * the new leaf to the root has at most length lg(n). This occurs when
 * the new leaf should be the root node.  Adapted from Introduction to
 * Algorithms (Cormen, Leiserson, Rivest 1990) page 150 */

void heap_insert(binary_heap *a, heap_node  key)
{
  int i;

  if(a->heap_size + 1 >= a->heap_cap) 
  {
	a->heap_cap += 100;
    a->elements = (heap_node *)realloc(a->elements, a->heap_cap * sizeof(heap_node));
  }

  /* increase the heap size to accomidate the new node, and set the
   * inital position of this node to be the last node in the heap */
  i = ++(a->heap_size);

  /* traverse the parth from the leaf to the root to find the a proper
   * place for the new element */
  while(i > 1 && compare_priority(&key, &a->elements[PARENT(i)]) > 0)
  {
    a->elements[i] = a->elements[PARENT(i)];
    i = PARENT(i);
  }

  /* insert the element at the position that was determined */
  a->elements[i] = key;

}

/* Function to delete a node from the heap. Adapted from Introduction
 * to Algorithms (Cormen, Leiserson, Rivest 1990) page 151 Exercise
 * 7.5-5 */

void heap_delete(binary_heap *a, int i)
{
  /* return with an error if the input is invalid, ie trying to delete
   * elements that are outside of the heap bounds, 1 to heap_size */
  if (i > a->heap_size || i < 1) 
  {    
    printf("heap_delete(): %d, index out of bounds",i);
    return;
  }

  /* switch the item to be deleted with the last item, and then
   * shorten the heap by one */
  a->elements[i] = a->elements[(a->heap_size)--];
  heapify(a,i);
}

int heap_node_find(binary_heap *a, heap_node node, int start_indx)
{
	int res;
	
	if(start_indx > a->heap_size)
		return -1;

	if(a->elements[start_indx].key != node.key)
		if(compare_priority(&a->elements[start_indx], &node) < 0)
			return -1;
		
	if(a->elements[start_indx].key == node.key)
		return start_indx;

	if(a->elements[start_indx].key != node.key)
		if(compare_priority(&a->elements[start_indx], &node) >= 0)
			res = heap_node_find(a, node, 2*start_indx);

	if(res == -1)
		res = heap_node_find(a, node, 2*start_indx + 1);

	return res;
}

int heap_node_find(binary_heap *a, int node_key)
{
	int i;

	for(i=1;i<a->heap_size;i++)
		if(a->elements[i].key == node_key)
			return i;

	return -1;
}

int heap_propagate_up(binary_heap *a, int node_indx)
{
	int i = node_indx, k = PARENT(i);
	while(i > 1 && compare_priority(&a->elements[i], &a->elements[k]) >= 0)
	{
		swap_node(a->elements, i, k);
		//a->elements[i] = a->elements[PARENT(i)];
		i = PARENT(i);
		k = PARENT(i);
	}

	return i;
}

void heap_update_priority(binary_heap *a, int node_indx, float new_prior)
{
	/* return with an error if the input is invalid, ie trying to
	* increase elements that are outside of the heap bounds, 1 to
	* heap_size */

	if(node_indx > a->heap_size || node_indx < 1) 
	{
	printf("heap_increase_key(): %d, node index out of bound",node_indx);
	return;
	}

	/* change and propagate */
	float t = a->elements[node_indx].priority;
	a->elements[node_indx].priority = new_prior;

	if(order == 1)
	{
		if(new_prior > t)
			heap_propagate_up(a, node_indx);
		else
			heapify(a,node_indx);
	}
	else
	{
		if(new_prior < t)
			heap_propagate_up(a, node_indx);
		else
			heapify(a,node_indx);
	}
}


/* function to initalize a given binary heap */

void heap_initalize(binary_heap *a, int nodes, int ord) { 

	/* We initalize heap_size to zero, since a newly created heap
	* contains no elements. */

	if(!((ord == 1) | (ord == -1)))
		return;

	order = ord;

	a->heap_size = 0; 
	a->heap_cap = nodes;

	/* we set the max elems to the requested number of nodes, and the
	* allocate enough space for this + 1 number of nodes, since the
	* heap is always numbered from 1, but array/pointer accesses are
	* always from 0. */

	a->elements = (heap_node *)malloc(nodes * sizeof(heap_node));
}

/* function to clean up after we are done with the heap */

void heap_finalize(binary_heap *a)
{
	FREE(a->elements);
}

void heap_print(binary_heap *a)
{
	printf("Printing heap...\n");
	printf("****************\n");
	int i, t;

	for(i=1;i<=a->heap_size;i++)
		if(a->elements[i].priority != 1000000)
		{
			printf("Node %d\n-priority = %f\n-key = %d\n", i, a->elements[i].priority, a->elements[i].key);
			
			t = LEFT(i);
			if(t<=a->heap_size)
				printf("<- left child node %d\n  priority = %f\n  key = %d\n", t, a->elements[t].priority, a->elements[t].key);

			t = RIGHT(i);
			if(t<=a->heap_size)
				printf("-> right child node %d\n  priority = %f\n  key = %d\n\n", t, a->elements[t].priority, a->elements[t].key);

			printf("---------------------------------------------\n\n");
		}
}


