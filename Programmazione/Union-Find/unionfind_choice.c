#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 100

/* FORWARD DECLARATIONS */
int randint();

/* MAIN */
int main()
{
	int choice,				/* option choice index						*/
		p,q,				/* inserted couple values					*/
		p_old,q_old,		/* couple values backup						*/
		i,					/* array index								*/
		r,					/* temp variable to store  the group index	*/
		v[N][2];			/* array of integer 0..N					*/
	int new_couples=0;		/* new_couples counter						*/
	int inserted_couples=0;  /* inserted_couples counter					*/

	for (i=0;i<N;i++)
	{
		v[i][1]=i;
		v[i][2]=1;
	}
	srand((unsigned)time(0));
	/* MENU */
	printf("\n\tVALUTAZIONE EMPIRICA\n\n 1.\tUnion Find\n 2.\tQuickUnion\n 3.\tQuickUnion Pesata\n\n...Inserire la scelta: ");
	scanf("%d",&choice);

	switch (choice){
	case 1: while ((inserted_couples<(N*2))&&(new_couples<(N-1)))
			{
				p=randint();
				q=randint();
				inserted_couples++;
				//find
				if (v[p][1]==v[q][1])
					continue;
				//printf("\n %d e %d costituiscono una nuova coppia",p,q);
				new_couples++;
				// union
				for(r=v[p][1],i=0;i<N;i++)
				{
					if (v[i][1]==r) 
						v[i][1]=v[q][1];
				//	printf(" %d ",v[i][1]);
				}
				//printf("\n Coppie Inserite: %d\n Coppie Nuove: %d\n",inserted_couples,new_couples);
			}
		break;
	case 2: while ((inserted_couples<(N*2))&&(new_couples<(N-1)))
			{
				p=randint();
				q=randint();
				inserted_couples++;
				//FIND p
				while(v[p][1]!=p)
					p=v[p][1];
				//FIND q
				while(v[q][1]!=q)
					q=v[q][1];
				//UNION
				if(p==q)
					continue;
				//printf("\n %d e %d costituiscono una nuova coppia",p,q);
				new_couples++;
				v[p][1]=q;				
				/*for(r=v[p][1],i=0;i<N;i++)
					printf(" %d ",v[i][1]);
				printf("\n Coppie Inserite: %d\n Coppie Nuove: %d\n",inserted_couples,new_couples);*/
			}
		break;
	case 3: while ((inserted_couples<(N*2))&&(new_couples<(N-1)))
			{
				p=randint();
				q=randint();
				//p_old=p;
				//q_old=q;
				inserted_couples++;
				//FIND p
				while(v[p][1]!=p)
					p=v[p][1];
				//FIND q
				while(v[q][1]!=q)
					q=v[q][1];
				//UNION PESATA
				if(p==q)
					continue;
				new_couples++;
				//printf("\n %d e %d costituiscono coppia nuova\n",p_old,q_old);
				if(v[p][2]<=v[q][2])
				{
					v[p][1]=q;
					v[q][2]+=v[p][2];
				}
				else
				{
					v[q][1]=p;
					v[p][2]+=v[q][2];
				}
			}
		break;
	default:
		{
			fprintf(stderr,"\nError: wrong selection choice!\n");
			return 1;
		}
		break;
	}
	printf("\n Coppie Inserite: %d\n Coppie Nuove: %d\n",inserted_couples,new_couples);
	return 0;
}

/* FUNCTIONS */
int randint(){
	int random_number=(int)(N*((double)rand()/RAND_MAX));
	return random_number;
}