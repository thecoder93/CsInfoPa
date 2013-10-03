package uni.mat.io.serializzazione;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;

public class Deserializza {
	public static void main(String[] args) {
		InputStream f = null;
		ObjectInputStream is = null;
		try {
			f = new FileInputStream("C:\\xy.bin");
			is = new ObjectInputStream(f);
		} catch (IOException e) {
			System.exit(1);
		}
		Punto p = null;
		try {
			p = (Punto) is.readObject();
			is.close();
		} catch (IOException e1) {
			System.exit(1);
		} catch (ClassNotFoundException e1) {
			System.exit(5);
		}
		System.out.println("x,y = " + p.ascissa() + ", " + p.ordinata());
	}
}
