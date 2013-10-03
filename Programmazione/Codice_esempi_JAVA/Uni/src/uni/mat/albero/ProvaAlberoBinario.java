package uni.mat.albero;

public class ProvaAlberoBinario {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		double[] numeri=new double[50];
		for (int i=0;i<numeri.length;i++)
			numeri[i]=Math.random()*100;
		
		AlberoBinario albero=new AlberoBinario();
		for (int i=0;i<numeri.length;i++)
			albero.insert(numeri[i]);

		albero.visitaInOrdine();
		
		Double f=numeri[7];
		
		
		Complesso[] complessi=new Complesso[50];
		for (int i=0;i<complessi.length;i++)
			complessi[i]=new Complesso(-50+Math.random()*100,-50+Math.random()*100);
		
		AlberoBinario albero2=new AlberoBinario();
		for (int i=0;i<complessi.length;i++)
			albero2.insert(complessi[i]);

		albero2.visitaInOrdine();
		
	}

}
