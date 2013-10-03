package uni.mat.io;

import java.io.FileReader;
import java.io.IOException;
import java.io.StreamTokenizer;

public class Esempio3 {
	public static void main(String args[]) {
		FileReader f = null;
		StreamTokenizer t = new StreamTokenizer(f);
		t.whitespaceChars(0, (int) ' ');
		int res = -1;
		do {
			try {
				res = t.nextToken();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (res == StreamTokenizer.TT_WORD) {
				String s = new String(t.sval);
				System.out.println("stringa: " + s);
			} else if (res == StreamTokenizer.TT_NUMBER) {
				double d = t.nval;
				System.out.println("double: " + d);
			}
		} while (res != StreamTokenizer.TT_EOL && res != StreamTokenizer.TT_EOF);
	}
}
