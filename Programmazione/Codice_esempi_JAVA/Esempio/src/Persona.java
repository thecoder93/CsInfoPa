import java.util.Comparator;

/*
 * Created on 1-gen-2002
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */

/**
 * @author studente
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Persona implements Comparable<Persona> {
	private String nome;
	private int eta;
	
	
	
	
	public Persona(String nome, int eta) {
		super();
		this.nome = nome;
		this.eta = eta;
	}
	
	




	public int getEta() {
		return eta;
	}
	public void setEta(int eta) {
		this.eta = eta;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(Persona arg0) {
		
		return this.nome.compareTo(arg0.nome);
	}
	
	
	
	public String toString() {
		
		return this.nome+" " + this.eta;
	}
	
	public static Comparator<Persona> comp1= new Comparator<Persona>() {

		/* (non-Javadoc)
		 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
		 */
		public int compare(Persona arg0, Persona arg1) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		
	};
	
}
