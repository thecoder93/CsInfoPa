package uni.mat.ordinamento;

public class AlgoritmoOrdinamento {

	public static void ordina(Object[] oggetti) throws NonOrdinabileException
	{
		for (int i=0;i<oggetti.length;i++)
			if (!(oggetti[i] instanceof Ordinabile)) throw new NonOrdinabileException();
		
		Object[] aux=(Object[]) oggetti.clone();
		
		for (int i=0;i<aux.length-1;i++)
			for (int j=i+1;j<aux.length;j++)
			{
				if 	(((Ordinabile) aux[i]).confronta(aux[j])>0)
				{
					Object o=aux[i];
					aux[i]=aux[j];
					aux[j]=o;
					
				}
			}
		System.arraycopy(aux,0,oggetti,0,oggetti.length);
	}
	

	
}
