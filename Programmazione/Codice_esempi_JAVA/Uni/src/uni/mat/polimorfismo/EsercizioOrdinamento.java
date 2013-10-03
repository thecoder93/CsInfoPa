package uni.mat.polimorfismo;

import java.util.Arrays;

//import cnr.itd.ordinamento.Ordinamento;

public class EsercizioOrdinamento {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Persona[] persone = new Persona[3];

		persone[0] = new Persona("Mario Rossi", "Milano", "");
		persone[1] = new Persona("Giuseppe Bianchi", "Milano", "");
		persone[2] = new Persona("Giuseppe Bianchi", "Aosta", "");

		Arrays.sort(persone);

		for (int i = 0; i < 3; i++) {
			System.out.println(persone[i]);

		}

	}

}
