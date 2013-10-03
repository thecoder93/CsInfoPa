import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;


public class Pippo {
	
	public static void leggi() throws FileNotFoundException
	{
		InputStream i=new FileInputStream("pp.txt");
	}

}
