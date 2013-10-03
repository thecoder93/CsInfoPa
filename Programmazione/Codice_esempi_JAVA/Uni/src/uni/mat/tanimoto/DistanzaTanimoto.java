/*
 * Created on 6-mag-2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package uni.mat.tanimoto;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author studente
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class DistanzaTanimoto {

	public static double calcolaDistanza(String s1,String s2)
	{
		Set<String> ss1=new HashSet<String>(Arrays.asList(s1.split(" ")));
		Set<String> ss2=new HashSet<String>(Arrays.asList(s2.split(" ")));
		Set<String> intersezione=new HashSet<String>(ss1);
		Set<String> unione=new HashSet<String>(ss1);
		intersezione.retainAll(ss2);
		unione.addAll(ss2);
		double ratio=(double) intersezione.size()/unione.size();
		return 1-ratio;
	}
}
