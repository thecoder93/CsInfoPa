package uni.mat.polimorfismo;

public class Studente extends Persona {
	int matricola;

	String pianoDiStudio;

	static int nextMatricola = 0;

	public Studente(String nome, String indirizzo) {
		super(nome, indirizzo, "");
		this.matricola = nextMatricola++;
		this.pianoDiStudio = "";
	}

	public String getPdS() {
		return pianoDiStudio;
	}

	public void modificaPdS(String nuovoPdS) {
		pianoDiStudio += nuovoPdS + "\n";
	}

	public void visualizza() {
		super.visualizza();
		System.out.println("Matricola: " + matricola + "\nPianodiStudio: "
				+ pianoDiStudio);
	}

}
