package uni.mat.thread;

public class Grafico {
	private int[][] matrice;
	private int tempo;
	private int numThread;
	
	public Grafico(int campioni,int numThread)
	{
		this.tempo=0;
		this.matrice=new int[campioni*numThread][numThread];
		this.numThread=numThread;
	}
	
	public synchronized void mark(int thread)
	{
		if (tempo>0)
		{
			for (int i=0;i<this.numThread;i++)
				this.matrice[tempo][i]=this.matrice[tempo-1][i];
			this.matrice[tempo][thread]=this.matrice[tempo][thread]+1;
		} else
		{
			for (int i=0;i<this.numThread;i++)
				this.matrice[tempo][i]=0;
			this.matrice[tempo][thread]=1;
		}
		for (int j=0;j<numThread;j++)
    		System.out.print(matrice[tempo][j]+"\t");
		System.out.println();
		tempo++;
	}

}
