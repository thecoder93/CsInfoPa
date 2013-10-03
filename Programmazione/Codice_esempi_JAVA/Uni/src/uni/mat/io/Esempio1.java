package uni.mat.io;

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class Esempio1 {
	public static void main(String args[]) {
		OutputStream f = null;
		try {
			f = new FileOutputStream(args[0]);
		} catch (IOException e) {
			System.out.println("Apertura fallita");
			e.printStackTrace();
			//System.exit(1);
		}
		
		
		String a="grgregre";

		DataOutputStream df = new DataOutputStream(f);
		
		float f1 = 5.1415F;
		char c1 = 'X';
		boolean b1 = true;
		double d1 = 1.4141;
		try {
			
			df.writeFloat(f1);
			df.writeBoolean(b1);
			df.writeDouble(d1);
			df.writeChar(c1);
			df.writeInt(11);
			df.close();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Scrittura fallita");
			
			//System.exit(1);
		}
	}
}