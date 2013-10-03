package uni.mat.prove;

public class Persona implements Comparable<Persona> {
	String nome;

	String indirizzo;

	public Persona(String nome, String indirizzo) {
		this.nome = nome;
		this.indirizzo = indirizzo;
	}

	public String getNome() {
		return nome;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public boolean omonimo(Persona p) {
		return nome.equalsIgnoreCase(p.nome);
	}

	public int compareTo(Persona o) {
		if (this.nome.compareTo(o.nome) < 0)
			return -1;
		else if (this.nome.compareTo(o.nome) > 0)
			return 1;
		else
			return 0;
	}

	public String toString() {
		return nome+ " " + indirizzo;
	}

}
