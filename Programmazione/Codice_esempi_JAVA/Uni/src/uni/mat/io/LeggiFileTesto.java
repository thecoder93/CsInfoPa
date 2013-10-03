package uni.mat.io;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class LeggiFileTesto {
	public static void main(String args[]) {
		FileReader r = null;
		try {
			r = new FileReader(args[0]);
		} catch (FileNotFoundException e) {
			System.out.println("File non trovato");
			System.exit(1);
		}
		try {
			int n = 0, x = r.read();
			while (x >= 0) {
				char ch = (char) x;
				System.out.print(" " + ch);
				n++;
				x = r.read();
			}
			System.out.println("\nTotale caratteri: " + n);
		} catch (IOException ex) {
			System.out.println("Errore di input");
			System.exit(1);
		}
	}
}