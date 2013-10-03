package uni.mat;
import java.util.Scanner;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Persona p=new Persona("mario","rossi");
		
		Classe c=new Classe();
		c.aggiungiAlunno(p); 
		
		
		
		
		/*
		Scanner s=new Scanner(System.in);
		while (s.hasNext())
			System.out.println("Hai inserito : "+s.next());
		*/
		
		

	}

}
