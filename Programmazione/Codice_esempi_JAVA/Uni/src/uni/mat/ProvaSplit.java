package uni.mat;

//import java.util.Arrays;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
//import java.util.List;
import java.util.Set;

public class ProvaSplit {
	/**
	 * @param args
	 */
	public double distanzaTanimoto(String s1,String s2)
	{
		String[] p1=s1.split(" ");
		String[] p2=s2.split(" ");
		
		List<String> c1=Arrays.asList(p1);
		List<String> c2=Arrays.asList(p2);
		Set<String> ins1=new HashSet<String>(c1);
		Set<String> ins2=new HashSet<String>(c2);
		Set<String> intersezione=new HashSet<String>(ins1);
		intersezione.retainAll(ins2);
		Set<String> unione=new HashSet<String>(ins1);
		unione.addAll(ins2);
		
		
		return 1-((double) intersezione.size()/unione.size());
	}
	
	public static void main(String[] args) {
		String s1="questa è una prova prova";
		String s2="ciao io sono prova";
		ProvaSplit p=new ProvaSplit();
		System.out.println(p.distanzaTanimoto(s1,s2));
	}
}
