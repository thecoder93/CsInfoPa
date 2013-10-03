package uni.mat.prove;

public class Materia {
	private String nome;
	private String codice;
	private int voto;
	
	public Materia(String nome, String codice) {
		super();
		this.nome = nome;
		this.codice = codice;
	}
	public String getCodice() {
		return codice;
	}
	public String getNome() {
		return nome;
	}
	public int getVoto() {
		return voto;
	}
	public void setVoto(int voto) {
		this.voto = voto;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return codice.hashCode();
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return codice+" "+nome+" \t\t\t"+voto;
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Materia)
			return (this.codice.equals(((Materia)obj).codice));
		else return super.equals(obj);
	}
	
	
	
	
	
	
}
