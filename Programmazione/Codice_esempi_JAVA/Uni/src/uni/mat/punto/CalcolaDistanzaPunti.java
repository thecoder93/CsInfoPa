package uni.mat.punto;


public class CalcolaDistanzaPunti {

	public static void main(String[] args) {
		
				
		Punto[] punti=new Punto[10];
		for (int i=0;i<10;i++)
			punti[i]=new Punto(Math.random()*10,Math.random()*10);
		double[][] dist=new double[10][10];
		for (int i=0;i<10;i++)
		{
			for (int j=0;j<10;j++)
			{
				dist[i][j]=punti[i].distanza(punti[j]);
				System.out.printf("%5.3f  ",dist[i][j]);
			}
			System.out.println();		
		}
	}

}
