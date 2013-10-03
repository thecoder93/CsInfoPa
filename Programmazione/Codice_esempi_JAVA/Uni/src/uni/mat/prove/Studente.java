package uni.mat.prove;

import java.util.HashSet;
import java.util.Set;

public class Studente extends Persona {
	int matricola;
	Set<Materia> pianoDiStudio;
	//String pianoDiStudio;

	static int nextMatricola = 0;

	public Studente(String nome, String indirizzo) {
		super(nome, indirizzo);
		this.matricola = nextMatricola++;
		this.pianoDiStudio = new HashSet<Materia>();
	}

	public Set<Materia> getPdS() {
		return pianoDiStudio;
	}

	public void aggiungiMateria(Materia m) {
		pianoDiStudio.add(m);
	}
	
	public void setVotoMateria(Materia m,int voto) {
		pianoDiStudio.remove(m);
		m.setVoto(voto);
		pianoDiStudio.add(m);	
	}
	
	public String getPianoDiStudi()
	{
		StringBuilder s = new StringBuilder();
		for (Materia m:this.pianoDiStudio)
		{
			s.append(m+"\n");
		}
		return s.toString();
	}
	
	

	public String toString() {
		return super.toString() + " Matricola: " + matricola
				+ "\nPianodiStudio: " + pianoDiStudio;
	}

}
