package uni.mat.ordinamento;

public class ProvaOrdinamento {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Object[] persone={new Persona("mario"),new Persona("giovanni"),new Persona("antonio"),new Object()};
		//for (Persona p:persone)
			//System.out.println(p);
		try {
			AlgoritmoOrdinamento.ordina(persone);
			
			//for (Persona p:persone)
				//System.out.println(p);
		} catch (NonOrdinabileException e) {
			// TODO Auto-generated catch block
			System.out.println("Errore");
			//e.printStackTrace();
		}
	}

}
