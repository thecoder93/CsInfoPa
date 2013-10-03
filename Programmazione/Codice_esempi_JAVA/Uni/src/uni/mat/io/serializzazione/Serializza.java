package uni.mat.io.serializzazione;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

import uni.mat.io.Prova2;

public class Serializza {
	public static void main(String[] args) {
		OutputStream f = null;
		try {
			f = new FileOutputStream("C:\\xy.bin");
		} catch (IOException e) {
			System.exit(1);
		}
		
		
		Punto p = new Punto(5.1F, 1.5F);
		Prova2 aa=new Prova2();
		ObjectOutputStream os = null;
		try {
			os = new ObjectOutputStream(f);
			os.writeObject(aa);
			os.flush();
			os.close();
		} catch (IOException e) {
			
		
			System.exit(1);
		}
	}
}