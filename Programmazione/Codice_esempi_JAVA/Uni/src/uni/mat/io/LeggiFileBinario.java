package uni.mat.io;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public class LeggiFileBinario {
	public static void main(String args[]) {
		InputStream f = null;
		try {
			f = new FileInputStream(args[0]);
			
		} catch (FileNotFoundException e) {
			System.out.println("File non trovato");
			System.exit(1);
		}
		try {
			int x = f.read();
			int n = 0;
			while (x >= 0) {
				System.out.print(" " + x);
				n++;
				if (n % 15 == 0)
					System.out.println();
				x = f.read();
			}
			System.out.println("\nTotale byte: " + n);
		} catch (IOException ex) {
			System.out.println("Errore di input");
			System.exit(1);
		}
	}
}