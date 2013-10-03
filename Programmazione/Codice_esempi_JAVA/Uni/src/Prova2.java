import java.util.Arrays;

import uni.mat.polimorfismo.Persona;
import uni.mat.polimorfismo.Studente;


public class Prova2 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String s1="ciao";
		String s2="ciao";
		String s3=new String("ciao");
		String s4=s3.intern();
		
		System.out.println(s1.equals(s2));
		System.out.println(s1==s2);
		System.out.println(s1.equals(s3));
		System.out.println(s1==s3);
		System.out.println(s1.equals(s2));
		System.out.println(s1==s2);
		System.out.println(s1.equals(s4));
		System.out.println(s1==s4);
		
		
		/*
		Persona p1=new Persona("mario","via roma","5454");
		
		
		Persona p2=new Studente("via roma","mario");
		

		p1.visualizza();
		p2.visualizza();
		
		Comparable c=new Persona("","","");
		
		//Arrays.sort();
		Object o=p1;
		
		//Compa
		//
		
		
		
		*/
		
		/*
		if (p2 instanceof Studente)
		{
			Studente s=(Studente) p2;
			
			s.modificaPdS(nuovoPdS);
			
		}*/


		
		//System.out.println(p1);
		

	}

}
