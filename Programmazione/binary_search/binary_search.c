int binary(int *v,int inf,int sup,int a)
{
	int m;
	if (inf<sup){
		m=(sup+inf)/2;	
		if (v[m] == a)
			return m;
		else{
			if (v[m]<a)
				return binary(v,m+1,sup,a);
			else
				return binary(v,inf,m-1,a);
		}
	}
	else   //inf > sup
		return -1;
}


void main ()
{
	int n,i,a,trovato;	
	printf("Inserisci la taglia del vettore\n");
	scanf("%d",&n);
	int v[n];
	printf("vettore generato di %d elementi\n",n);
	for (i=0;i<n;i++){
		v[i]=i;
	    printf("V[%d]=%d\n",i,v[i]);
	}
	printf("inserisci elemento da cercare\n");
	scanf("%d",&a);
	trovato=binary(v,0,n-1,a);
	if (trovato==-1)
		printf("elemento non trovato\n");
	else
		printf("elemento trovato in posizione %d\n",trovato);
	
}
