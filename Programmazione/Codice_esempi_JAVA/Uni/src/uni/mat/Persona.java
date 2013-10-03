package uni.mat;


public class Persona {
	private String nome;
	private String cognome;
	private String codiceFiscale;
	
	public Persona(String cognome,String nome)
	{
		this.cognome=cognome;
		this.nome=nome;
		this.calcollaCodiceFiscale();
	}
	
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
		this.calcollaCodiceFiscale();
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
		this.calcollaCodiceFiscale();
	}
	
	private void calcollaCodiceFiscale()
	{
	
		this.codiceFiscale="";
	}
	
	
	
	
}
