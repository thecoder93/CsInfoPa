
#ifndef PRIORITY_QUEUE
#define PRIORITY_QUEUE

// macros for accessing the children elements and parent 
// element of the node at index x in the array.

#define LEFT(x)  (2*x)                         /* left child of a node */
#define RIGHT(x) ((2*x)+1)                     /* right child of a node */
#define PARENT(x) (x/2)                        /* parent of a node */

// free and swap macros

#define FREE(x)  free(x) ; x = NULL            /* core if free'ed pointer is used */
//#define SWAP(t,x,y) t = x ; x = y ; y = t  /* swap to variables */


typedef struct heap_node
{
	float priority;
	int key,
		sat_data_size;

	void *sat_data;

};

typedef struct binary_heap
{
  int heap_size,
	  heap_cap;
  struct heap_node *elements;

}binary_heap; 

// heap managment functions

static void swap_node(heap_node *elements, int n1, int n2);

static int compare_priority(heap_node *i, heap_node *j);

void heap_init_node(heap_node *node, int key, float prior, void *sat_data, int data_size);

static void heapify(binary_heap *a, int i);

heap_node *heap_max(binary_heap *a);
heap_node heap_extract_max(binary_heap *a);

void heap_insert(binary_heap *a, heap_node key);
void heap_delete(binary_heap *a, int i);

int heap_node_find(binary_heap *a, heap_node node, int start_indx);
int heap_node_find(binary_heap *a, int node_key);

int heap_propagate_up(binary_heap *a, int node_indx); 
void heap_update_priority(binary_heap *a, int node_indx, float new_prior);

void heap_initalize(binary_heap *a, int nodes, int order);
void heap_finalize(binary_heap *a);

void heap_print(binary_heap *a);




#endif //PRIORITY_QUEUE