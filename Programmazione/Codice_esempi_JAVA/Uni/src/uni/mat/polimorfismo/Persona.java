package uni.mat.polimorfismo;

import java.io.Serializable;

/**
 * Questa classe bla bla bla
 * 
 * @author Manuel
 */

public class Persona implements Comparable,Serializable {
	String nominativo;

	String indirizzo;

	String telefono;

	public Persona(String nome, String indirizzo, String telefono) {
		this.nominativo = nome;
		this.indirizzo = indirizzo;
		this.telefono = telefono;
	}

	public String getNome() {
		return nominativo;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void visualizza() {
		System.out.println("Nome: " + nominativo + "\nIndirizzo: " + indirizzo);
	}

	public boolean omonimo(Persona p) {
		return nominativo.equalsIgnoreCase(p.nominativo);
	}

	public int compareTo(Object obj) {
		if (obj instanceof Persona) {
			Persona b = (Persona) obj;
			if (this.nominativo.compareTo(b.nominativo) < 0) {
				return -1;
			} else if (this.nominativo.compareTo(b.nominativo) > 0) {
				return 1;
			} else {
				if (this.indirizzo.compareTo(b.indirizzo) < 0) {
					return -1;
				} else if (this.indirizzo.compareTo(b.indirizzo) > 0) {
					return 1;
				} else
					return 0;
			}
		}
		return 0;
	}

	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((indirizzo == null) ? 0 : indirizzo.hashCode());
		result = PRIME * result + ((nominativo == null) ? 0 : nominativo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		final Persona other = (Persona) obj;
		if (indirizzo == null) {
			if (other.indirizzo != null)
				return false;
		} else if (!indirizzo.equals(other.indirizzo))
			return false;
		if (nominativo == null) {
			if (other.nominativo != null)
				return false;
		} else if (!nominativo.equals(other.nominativo))
			return false;
		return true;
	}
	
	
/*
	@Override
	public int hashCode() {
		int i=0;
		i+=7*this.nominativo.hashCode();
		i+=13*this.indirizzo.hashCode();
		
		return i;
		
	}*/
	
	
	

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	@Override
	public String toString()
	{
		return this.nominativo+","+this.indirizzo+" "+this.telefono;
	}

}
