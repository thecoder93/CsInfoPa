package uni.mat.ordinamento;

public class Persona implements Ordinabile {
	private String nome;

	public Persona(String nome) {
		super();
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	
	public int confronta(Object o) {
		if (o instanceof Persona)
			return this.nome.compareTo(((Persona) o).nome);
		return 0;
	}
	

	@Override
	public String toString() {
		return this.nome;
	}

		
	
	
	
}
