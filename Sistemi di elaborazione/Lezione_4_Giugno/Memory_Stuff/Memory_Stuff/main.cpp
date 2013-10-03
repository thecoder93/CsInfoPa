#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void array_scale(float *a, int a_size, float s)
{
	int i;

	for(i=0;i<a_size;i++)
		a[i] *= s;
}

// sbagliato
void array_define(float *a, int *a_size, int opt)
{
	int i;
	/* qui il parametro opt verrà usato 
	   per scegliere le routine opportune
	*/
	switch(opt)
	{
		case 1: 
			*a_size = 10;
			a = (float *)malloc(*a_size*sizeof(float));
			for(i=0;i<*a_size;i++)
				a[i] = (float)(i);

			break;

		case 2:
			*a_size = 20;
			a = (float *)malloc(*a_size*sizeof(float));
			for(i=0;i<*a_size;i++)
				a[i] = i * 0.5f;

			break;

		default:
			a = NULL;
			a_size = 0;

			break;
	}
}
void array_define(float **a, int *a_size, int opt)
{
	int i;
	/* qui il parametro opt verrà usato 
	   per scegliere le routine opportune
	*/
	switch(opt)
	{
		case 1: 
			*a_size = 10;
			*a = (float *)malloc(*a_size*sizeof(float));
			for(i=0;i<*a_size;i++)
				(*a)[i] = (float)(i);

			break;

		case 2:
			*a_size = 20;
			*a = (float *)malloc(*a_size*sizeof(float));
			for(i=0;i<*a_size;i++)
				(*a)[i] = i * 0.5f;

			break;

		default:
			*a = NULL;
			a_size = 0;

			break;
	}
}

void array_merge(float *a, int size_a, float *b, int size_b, float **c, int *c_size)
{
	*c_size = size_a+size_b;
	*c = (float *)malloc(*c_size*sizeof(float));

	memcpy(*c, a, size_a*sizeof(float));
	memcpy(&((*c)[size_a]), b, size_b*sizeof(float));
}

void print_array(float *a, int a_size)
{
	int i;

	if(a == NULL) {
		printf("Array is empty: \n");
		return;
	}

	printf("Array: \n");
	for(i=0;i<a_size;i++)
		printf("%f\n", a[i]);
}

void main(int *argc, char *argv[])
{
	int a_size = 5, c_size, i;
	float a[] = {1.0, 2.0, 3.0, 4.0, 5.0};
	float *c = NULL;

	// esempio 1
	/*float *b = (float *)malloc(a_size*sizeof(float));
	for(i=0;i<a_size;i++)
		b[i] = a[i];
	
	array_scale(a, a_size, 2.0);
	array_scale(b, a_size, 2.0);

	print_array(a, a_size);
	print_array(b, a_size);

	free(b);*/

	//// esempio 2 con errore
	//c_size = a_size;
	//array_define(c, &a_size, 1);
	//print_array(c, c_size);

	//// esempio 2 corretto
	//array_define(&c, &c_size, 1);
	//print_array(c, c_size);

	//free(c);

	// esempio 3, memcpy
	int b_size = 10;
	float k;
	
	k = a[a_size-1] + 1.0f;
	float *b = (float *)malloc(b_size*sizeof(float));
	for(i=0;i<b_size;i++)
		b[i] = k+i;

	array_merge(a, a_size, b, b_size, &c, &c_size);
	print_array(c, c_size);
	free(c);

	// crossover
	int a_cut1 = 2, a_cut2 = 4, b_cut1 = 6, b_cut2 = 8; // posizione taglio

	print_array(a, a_size);
	print_array(b, b_size);

	array_merge(&a[a_cut1-1], a_cut2-a_cut1+1,
				&b[b_cut1-1], b_cut2-b_cut1+1,
				&c, &c_size);

	//array_merge(&b[b_cut1-1], b_cut2-b_cut1+1,
	//			&a[a_cut1-1], a_cut2-a_cut1+1,
	//			&c, &c_size);

	//print_array(c, c_size);	
}