package uni.mat.io;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class LeggiFileTesto2 {
	public static void main(String args[]) {
		FileReader r = null;
		try {
			r = new FileReader(args[0]);
		} catch (FileNotFoundException e) {
			System.out.println("File non trovato");
			System.exit(1);
		}
		try {
			while (r.ready()) {
				char ch = (char) r.read();
				System.out.print(ch); // echo
			}
			System.out.println("");
		} catch (IOException ex) {
			System.out.println("Errore di input");
			System.exit(1);
		}
	}
}