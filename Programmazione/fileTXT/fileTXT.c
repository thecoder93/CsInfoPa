#include "MyLibrary.h"

int main(){
	char *buff,						/* n buffer di 255 caratteri			*/
		 **sp;						/* puntatore agli n buffer				*/
	int n,							/* numero di righe del file				*/
		m,i;
	FILE *f;
	
	/* === LETTURA DA FILE CON BUFFER N*255 =============================== */	
	f=fopen("input.txt","rt");
	fscanf(f,"%d",&n);
	buff = (char *) malloc (n*255*sizeof(char));
	sp = (char **) malloc (n*sizeof(char));
	m=0;
	i=0;
	/* legge una riga e la memorizza nel buffer buff[m] */
	while ( fscanf(f,"%s",&buff[m])!=EOF ){
		sp[i++] = &buff[m];			/* s[i] punta alla parola i				*/
		m += strlen(&buff[m])+1;	/* m indica la posizione lenght[parola(i)]+1*/
	}
	fclose(f);
	/* =========================================== FINE LETTURA DA FILE === */

	m=0;
	/* le n parole nell'ordine iniziale */
	for(i=0;i<n;i++){
		printf("%s ",&buff[m]);
		m+=strlen(&buff[m])+1;
	}
	printf("\n");
	/* ordinamento */
	quicksort(sp,0,n-1);
	/* le n parole ordinate */
	for(i=0;i<n;i++)
		printf("%s ",sp[i]);
	printf("\n");
	return 0;
}
