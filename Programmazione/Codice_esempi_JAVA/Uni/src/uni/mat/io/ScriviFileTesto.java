package uni.mat.io;

import java.io.FileWriter;
import java.io.IOException;

public class ScriviFileTesto {
	public static void main(String args[]) {
		FileWriter fout = null;
		try {
			fout = new FileWriter("Prova.txt");
		} catch (IOException e) {
			System.out.println("Apertura fallita");
			System.exit(1);
		}
		float f1 = 5.1415F;
		char c1 = 'X';
		boolean b1 = true;
		double d1 = 1.4141;
		try {
			String buffer = null;
			buffer = Float.toString(f1);
			fout.write(buffer, 0, buffer.length());
			buffer = new Boolean(b1).toString();
			fout.write(buffer, 0, buffer.length());
			buffer = Double.toString(d1);
			fout.write(buffer, 0, buffer.length());
			fout.write(c1); // singolo carattere
			buffer = Integer.toString(11);
			fout.write(buffer, 0, buffer.length());
			fout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}