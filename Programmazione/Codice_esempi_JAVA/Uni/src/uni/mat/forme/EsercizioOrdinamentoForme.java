package uni.mat.forme;

import java.util.Arrays;

public class EsercizioOrdinamentoForme {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//Forma f=new Forma();
		// TODO Auto-generated method stub
		Forma[] forme = new Forma[5];
		forme[0] = new Triangolo(10, 2);
		
		
		forme[1] = new Triangolo(10, 21);
		forme[2] = new Rettangolo(10, 6);
		forme[3] = new Rettangolo(30, 8);
		forme[4] = new Rettangolo(10, 2);

		for (int i = 0; i < 5; i++)
			System.out.println(forme[i]);

		Arrays.sort(forme);

		// Collections.sort()

		System.out.println("Ordinati");
		for (int i = 0; i < 5; i++)
			System.out.println(forme[i]);

	}

}
