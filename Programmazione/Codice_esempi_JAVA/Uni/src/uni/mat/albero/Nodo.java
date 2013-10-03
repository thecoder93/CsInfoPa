package uni.mat.albero;

public class Nodo {
	private Nodo sinistro,destro;
	private Comparable valore;
	
	
	public void inserimento(Comparable c)
	{
		if (this.valore==null)
			this.valore=c;
		else
		{
			if (this.valore.compareTo(c)<0)
			{
				if (this.sinistro==null) this.sinistro=new Nodo();
				this.sinistro.inserimento(c);
			} else
			{
				if (this.destro==null) this.destro=new Nodo();
				this.destro.inserimento(c);
			}
		}
	}
	
	public void visitaInOrdine()
	{
		
		
	}
	
	

}
