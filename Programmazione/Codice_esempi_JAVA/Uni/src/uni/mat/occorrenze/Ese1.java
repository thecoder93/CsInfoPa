package uni.mat.occorrenze;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

/*
 * Created on 6-mag-2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */

/**
 * @author studente
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Ese1 {

	public static void main(String[] args) {
		Reader r=null;
		try {
			r=new FileReader(args[0]);
		} catch (FileNotFoundException e) {
			System.out.println("File non trovato!");
			System.exit(1);
		}

		Scanner s=new Scanner(r);
		SortedSet<String> cont=new TreeSet<String>();
		while (s.hasNext())
			cont.add(s.next());
		
		try {
			Writer w=new FileWriter(args[0]+".ord");
			for (String parola:cont)
				w.write(parola+"\n");
			w.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
