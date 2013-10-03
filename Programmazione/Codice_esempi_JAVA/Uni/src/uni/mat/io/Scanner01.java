package uni.mat.io;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;

import javax.swing.JFileChooser;

public class Scanner01 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JFileChooser dialog=new JFileChooser();
		int result=dialog.showOpenDialog(null);
		if (result==JFileChooser.APPROVE_OPTION)
		{
			Scanner s;
			try {
				s = new Scanner(new FileInputStream(dialog.getSelectedFile())).useDelimiter("[' '\t\n]");
				int i=0;
				while (s.hasNext())
						System.out.println(++i+") "+s.next());
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
