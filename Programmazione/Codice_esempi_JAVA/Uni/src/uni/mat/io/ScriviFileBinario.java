package uni.mat.io;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class ScriviFileBinario {
	public static void main(String args[]) {
		FileOutputStream f = null;
		try {
			f = new FileOutputStream(args[0]);
		} catch (FileNotFoundException e) {
			System.out.println("Impossibile aprire il File ");
			System.exit(1);
		}
		try {
			for (int x = 0; x < 30; x += 5) {
				System.out.println("Scrittura di " + x);
				f.write(x);
			}
		} catch (IOException ex) {
			System.out.println("Errore di input");
			System.exit(1);
		}
		try {
			f.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
