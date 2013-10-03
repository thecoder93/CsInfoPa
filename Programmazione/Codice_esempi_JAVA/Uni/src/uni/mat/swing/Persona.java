package uni.mat.swing;

public class Persona {
	private String nome;
	private String cognome;
	
	public Persona(String nome, String cognome) {
		super();
		// TODO Auto-generated constructor stub
		this.nome = nome;
		this.cognome = cognome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String toString()
	{
		return this.cognome+" "+this.nome;
	}
	
	
}
