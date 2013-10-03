import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.Vector;


public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Persona p1=new Persona("mario",23);
		Persona p2=new Persona("antonio",33);
		Persona p3=new Persona("giovanni",13);
		
		List<Persona> persone=new Vector<Persona>();
		
		persone.add(p1);
		persone.add(p2);
		persone.add(p3);
		
		for (Persona o:persone)
			System.out.println(o);
		Collections.sort(persone,Persona.comp1);
		for (Persona o:persone)
			System.out.println(o);
		
		/*
		
		
		Punto a=new Punto(22,3);
		Punto b=new Punto(2,3);
		Punto c=new Punto(11,3);
		
		List<Punto> punti=new ArrayList<Punto>();
		
		
		//punti.add("cdddd");
		punti.add(a);
		punti.add(b);
		punti.add(c);
		
		for (Punto o:punti)
			System.out.println(o);
		//Arrays.sort();
		Collections.sort(punti);
		for (Punto o:punti)
			System.out.println(o);
		
		/*
		Iterator i=punti.iterator();
		while (i.hasNext())
		{
			System.out.println(i.next());
		}*/
		
		
		
		/*
		
		
		for (int i=0;i<punti.size();i++)
			System.out.println(punti.get(i));
		
		/*
		System.out.println(a==b);
		System.out.println(a.equals(b));
		System.out.println(a.hashCode());
		System.out.println(b.hashCode());
		
		String s1=new String("aaa");
		String s2=new String("bbb");

		System.out.println(s1==s2);
		System.out.println(s1.equals(s2));

		System.out.println(s1.hashCode());
		System.out.println(s2.hashCode());
		*/
	}

}
