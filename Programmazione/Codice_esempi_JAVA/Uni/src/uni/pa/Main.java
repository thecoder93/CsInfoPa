package uni.pa;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.*;

public class Main {

	public static void main(String[] args) {
		try {
			Scanner s=new Scanner(new FileInputStream("C:\\prova.txt"));
			Set<String> a=new TreeSet<String>();
			
			while (s.hasNext())
				a.add(s.next());
			
			for (String t:a)
				System.out.println(t);
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
