/*
 * Created on 6-mag-2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package uni.mat.tanimoto;

import java.util.Scanner;

/**
 * @author studente
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ProvaTanimoto {

	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		System.out.println("Inserisci due frasi:");
		String s1=s.nextLine();
		String s2=s.nextLine();
		
		System.out.println("La distanza di tanimoto fra le due stringhe è :");
		System.out.println(DistanzaTanimoto.calcolaDistanza(s1,s2));
	}
}
