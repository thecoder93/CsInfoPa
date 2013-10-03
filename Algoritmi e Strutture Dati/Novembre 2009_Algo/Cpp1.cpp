#include<stdio.h>
#include<stdlib.h>
struct Albero
{
	int Ele;
	Albero *Sx,*Dx;
};

Albero* Intersezione(Albero *A,Albero *B);
Albero* Unione(Albero *A,Albero *B);
void Visita(Albero *A);
void Copia(Albero **A,Albero **B);
void Fusione(Albero **A,Albero *B);
void Inter(Albero *A,Albero *B,Albero **I);
void Inserimento(Albero **A,int X);
int Trova(Albero *A,int X);

void main()
{
	Albero *A,*B,*Uni,*Int;
	A=NULL;
	B=NULL;
	int x;

//  Carico in memoria l'albero A
	printf("\nCreazione del primo albero:\n");
	do
	{
		printf("\nInserisci un elemento (-1 per terminare):");
		scanf("%d",&x);
		if (x!=-1)
			Inserimento(&A,x);
	}while (x!=-1);

//  Carico in memoria l'albero B	
	printf("\nCreazione del secondo albero:\n");
	do
	{
		printf("\nInserisci un elemento (-1 per terminare):");
		scanf("%d",&x);
		if (x!=-1)
			Inserimento(&B,x);
	}while (x!=-1);

//  Eseguo la visita in ordine degli alberi 
	printf("\nVisita in ordine dell'albero A\n");
	Visita(A);
	printf("\nVisita in ordine dell'albero B\n");
	Visita(B);

//  Chiedo la ricerca di un elemento sull'albero A
	printf("\nInserisci un elemento da cercare su A:");
	scanf("%d",&x);
	if (Trova(A,x)==1)
		printf("\nL'elemento e' stato trovato!!!\n");
	else
		printf("\nElemento non trovato\n");

//	Calcolo l'unione di A e B su Uni
	Uni=Unione(A,B);
	printf("\nUnione:");
	Visita(Uni);

//	Calcolo l'intersezione di A e B su Int
	Int=Intersezione(A,B);
	printf("\nIntersezione:");
	Visita(Int);
	printf("\n\n");

}

/*
Eseguo l'intersezione tra i due alberi binari A e B
con complessita' O(N*Log(n1)*Log(n2)) dove con N indiciamo il numero di 
elementi di A, con n1 indico il numero di nodi di B e con n2 indico il numero di nodi di I
*/

Albero* Intersezione(Albero *A,Albero *B)
{
	Albero *I;  //Albero contenente l'intersezione tra A e B
	I=NULL;
	Inter(A,B,&I);  //Eseguo l'intersezione
	return I;
}

void Inter(Albero *A,Albero *B,Albero **I)
{
	if (A!=NULL)
	{
	/*
		Controllo se l'elemento di A esiste in B, e se esiste 
		lo inserisco in I
	*/
		if (Trova(B,A->Ele)==1)  
			Inserimento(I,A->Ele);
    //  Eseguo la procedura in modo ricorsivo su tutti gli elementi di A
		Inter(A->Sx,B,I);
		Inter(A->Dx,B,I);
	}
}

/*
Eseguo l'unione tra i due alberi binari A e B
con complessita' O(N+M*Log(N)) dove con N indiciamo il numero di 
elementi di A, con M indico il numero di elementi di B
*/
Albero* Unione(Albero *A,Albero *B)
{
	Albero *U;	//Albero contenente l'unione di A e B
	U=NULL;
	Copia(&A,&U); //Copio l'albero A in U
	Fusione(&U,B);//Unisco l'insieme B in U
	return U;

}

//Questa procedura unisce i due insiemi, in O(M*Log(n)) tempo dove con M 
//indichiamo il numero di elementi di B e con n indichiamo il numero di nodi di A
//A e' l'albero che conterra' l'unione con B
void Fusione(Albero **A,Albero *B)
{
	if (B!=NULL)
	{
/*
	Inserisco l'elemento di B in A
	Se l'elemento e' già stato inserito 
	non viene creato un doppione
*/
		Inserimento(A,B->Ele);  
//  Riscorsivamente visito il sotto albero sinistro e destro di B
		Fusione(A,B->Sx);
		Fusione(A,B->Dx);
	}
		

}

//Creo una copia dell'albero A nell'albero B in O(N) tempo dove N
//corrisponde al numero di elementi di A
void Copia(Albero **A,Albero **B)
{
	Albero *M;
	if (*A==NULL)
		*B=NULL;
	else
	{
		M=(Albero*)malloc(sizeof(Albero));
		M->Ele=(*A)->Ele;
		M->Dx=NULL;
		M->Sx=NULL;
		*B=M;
		Copia(&(*A)->Sx,&(*B)->Sx);
		Copia(&(*A)->Dx,&(*B)->Dx);
	}
}

//Questa procedura controlla all'interno dell'albero A se esiste l'elemento X
//in O(Log(h)) tempo, dove h corrisponde al numero di nodi di A
int Trova(Albero *A,int X)
{
	if (A!=NULL)
	{
		if (A->Ele==X)
			return 1;
		else
		{
			if (A->Ele>X)
				return Trova(A->Sx,X);
			else
				return Trova(A->Dx,X);
		}
	}
	return 0;
}

//Visita in ordine dell'albero A
void Visita(Albero *A)
{
	if (A!=NULL)
	{
		Visita(A->Sx);
		printf("%d,",A->Ele);
		Visita(A->Dx);
	}
}

//Questa procedura inserisce un elemento X all'interno di A
//in O(Log(h)) tempo, dove h corrisponde al numero di nodi di A
void Inserimento(Albero **A,int X)
{
	Albero *M;
	if (*A==NULL)
	{
		M=(Albero*)malloc(sizeof(Albero));
		M->Ele=X;
		M->Dx=NULL;
		M->Sx=NULL;
		*A=M;
	}
	else
	{	//Verifico che l'elemento da inserire non sia un doppione
		if((*A)->Ele==X)
			printf("\nElemento gia' esistente!");
		else
		{
			if ((*A)->Ele<X)
				Inserimento(&(*A)->Dx,X);
			else
				Inserimento(&(*A)->Sx,X);
		}
	}
}