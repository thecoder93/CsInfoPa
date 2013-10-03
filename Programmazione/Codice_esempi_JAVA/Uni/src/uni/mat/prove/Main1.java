package uni.mat.prove;

public class Main1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Persona p1 = new Persona("Mario Rossi", "Milano");
		Persona p2 = new Persona("Giuseppe Bianchi", "Milano");
		System.out.println(p1);
		Studente s1 = new Studente("Antonio", "Milano");
		Studente s2 = new Studente("Giuseppe", "Milano");
		Studente s3 = new Studente("Giuseppe2", "Milano");
		Studente s4 = new Studente("Giuseppe3", "Milano");
		System.out.println(s1);
		System.out.println(s2);
		System.out.println(s3);
		System.out.println(s4);
		
		s1.aggiungiMateria(new Materia("Chimica","C001"));
		System.out.println(s1.getPianoDiStudi());
		s1.setVotoMateria(new Materia("Chimica","C001"),20);
		System.out.println(s1.getPianoDiStudi());
		

	}

}
