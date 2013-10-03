package uni.mat.jfc;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
/**
 * Questa classe bla bla bla
 * 
 * @author Manuel
 */

public class Persona {
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

	@Override
	public int hashCode() {
		HashCodeBuilder r = new HashCodeBuilder(17, 37);
		r.append(nominativo);
		r.append(indirizzo);
		return r.toHashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Persona)) {
			return false;
		}
		Persona b = (Persona) obj;
		EqualsBuilder eq=new EqualsBuilder();
		eq.append(nominativo, b.nominativo);
		eq.append(indirizzo, b.indirizzo);
		return eq.isEquals();
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

}
