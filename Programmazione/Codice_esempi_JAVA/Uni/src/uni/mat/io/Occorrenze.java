package uni.mat.io;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Occorrenze {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<String,Integer> m=new HashMap<String,Integer>();
		Scanner s=new Scanner(System.in);
		while (s.hasNext())
		{
			String parola=s.next();
			if (parola.equals("exit")) break;
			if (!m.containsKey(parola))
				m.put(parola,1);
			else
				m.put(parola,m.get(parola)+1);
		}	
		for (String p:m.keySet())
		{
			System.out.println("Parola:"+p+" "+m.get(p));
		}
	}

}
