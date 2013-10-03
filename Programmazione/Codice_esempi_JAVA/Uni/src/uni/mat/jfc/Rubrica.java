package uni.mat.jfc;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import uni.mat.polimorfismo.Persona;


public class Rubrica {
	Map<String, Persona> elenco = new HashMap<String, Persona>();

	Scanner s = new Scanner(System.in);

	public void leggiPersona() {
		// Scanner s = new Scanner(System.in);
		System.out.print("Inserisci il nome: ");
		String nominativo = s.next();
		System.out.print("Inserisci l'indirizzo: ");
		String indirizzo = s.next();
		System.out.print("Inserisci il numero di telefono: ");
		String telefono = s.next();
		Persona p = new Persona(nominativo, indirizzo, telefono);
		this.elenco.put(p.getTelefono(), p);
	}

	public boolean leggiSiNo(String testo) {
		String risposta = "";
		do {
			System.out.print(testo + " (si/no): ");
			risposta = s.next();
		} while (!(risposta.equalsIgnoreCase("si") || risposta
				.equalsIgnoreCase("no")));
		return risposta.equalsIgnoreCase("si");
	}

	public Persona cercaPersona() {
		System.out.print("Inserisci il numero di telefono: ");
		String telefono = s.next();
		return this.elenco.get(telefono);
	}

	/**
	 * @param args
	 */
	public static void main(String[] fffff) {
		// TODO Auto-generated method stub
		Rubrica r = new Rubrica();
		do {
			r.leggiPersona();
		} while (r.leggiSiNo("Vuoi inserire altre persone?"));
		do {
			Persona p = r.cercaPersona();
			System.out.println(p);
		} while (!r.leggiSiNo("Vuoi uscire?"));
	}
}
