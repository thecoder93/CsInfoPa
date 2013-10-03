package uni.mat.io;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Esempio2 {
	public static void main(String args[]) {
		FileInputStream fin = null;
		try {
			fin = new FileInputStream("Prova.dat");
		} catch (FileNotFoundException e) {
			System.out.println("File non trovato");
			System.exit(5);
		}
		DataInputStream is = new DataInputStream(fin);
		float f1;
		char c1;
		boolean b1;
		double d1;
		int i1;
		try {
			f1 = is.readFloat();
			b1 = is.readBoolean();
			d1 = is.readDouble();
			c1 = is.readChar();
			i1 = is.readInt();
			is.close();
			System.out.println(f1 + ", " + b1 + ", " + d1 + ", " + c1 + ", "
					+ i1);
		} catch (IOException e) {
			System.out.println("Errore di input");
			System.exit(4);
		}
	}
}