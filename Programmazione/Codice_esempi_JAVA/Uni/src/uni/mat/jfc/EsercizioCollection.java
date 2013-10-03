package uni.mat.jfc;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;


public class EsercizioCollection {
	/**
	 * @param args
	 */

	public static boolean contieneDuplicati(Object[] vet) {
		Set s = new HashSet(Arrays.asList(vet));
		return !(s.size() == vet.length);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Persona[] p = new Persona[2];
		p[0] = new Persona("Antonio", "Roma", "");
		p[1] = new Persona("Antonio", "Roma", "");
		System.out.println(contieneDuplicati(p));
		System.out.println(p[0].equals(p[1]));
		System.out.println(p[0].hashCode());
		System.out.println(p[1].hashCode());

	}
}
