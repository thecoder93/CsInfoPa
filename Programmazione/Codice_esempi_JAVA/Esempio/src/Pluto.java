import java.io.FileNotFoundException;


public class Pluto {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			Pippo.leggi();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
