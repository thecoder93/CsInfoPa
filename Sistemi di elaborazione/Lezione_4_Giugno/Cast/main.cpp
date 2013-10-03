#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Priority_Queue.h"

struct statistic1{
	float mem,
	      cpu;	
};

struct statistic2{
	float mem,
	      cpu,
		  data_sent,
		  data_recv;		
};

struct processo{
	int livello,
		pid,
		min_mem,
		p_data_size;
	void *p_data;
};

void read_data(binary_heap *heap)
{
	int i, k, livello, pid;
	FILE *f;
	struct heap_node n;

	if((f = fopen("proc_table.txt", "r")) == NULL)
		return;

	fscanf(f, "%d", &k);
	heap_initalize(heap, k, 1);

	for(i=0;i<k;i++) {
		fscanf(f, "%d", &livello);
		fscanf(f, "%d", &pid);

		n.key = pid;
		n.priority = (float)(livello);
		n.sat_data_size = sizeof(processo);
		n.sat_data = (processo *)malloc(sizeof(processo));

		((processo *)(n.sat_data))->pid = pid;
		((processo *)(n.sat_data))->livello = livello;
		((processo *)(n.sat_data))->p_data_size = sizeof(statistic1);
		((processo *)(n.sat_data))->p_data = (statistic1 *)malloc(sizeof(statistic1));

		((statistic1 *)(((processo *)(n.sat_data))->p_data))->cpu = (float)(i*2);
		((statistic1 *)(((processo *)(n.sat_data))->p_data))->mem = (float)(i*4);

		heap_insert(heap, n);
	}
}

void print_heap(binary_heap *heap)
{
	int i, livello;
	float mem, cpu;

	printf("Printing heap...\n");
	printf("****************\n");

	for(i=1;i<=heap->heap_size;i++){
		printf("Node %d\n-priority = %f\n-key = %d\n", i, heap->elements[i].priority, heap->elements[i].key);
		
		livello = ((processo *)(heap->elements[i].sat_data))->livello;
		cpu =((statistic1 *)(((processo *)(heap->elements[i].sat_data))->p_data))->cpu;
		mem = ((statistic1 *)(((processo *)(heap->elements[i].sat_data))->p_data))->mem;
		printf("Processo: \n-livello = %d\n-cpu = %f\n-mem = %f\n", livello, cpu, mem);

		printf("---------------------------------------------\n\n");
		}
}

void main(int *argc, char *argv[])
{
	binary_heap heap;

	read_data(&heap);

	print_heap(&heap);
}