package uni.mat.punto;

import java.util.Arrays;

public class OrdinamentoPunti {

	public static void main(String[] args) {
		Punto[] punti=new Punto[10];
		for (int i=0;i<10;i++)
			punti[i]=new Punto(Math.random()*10,Math.random()*10);	
		for (int i=0;i<10;i++)
			System.out.println("("+punti[i].x+","+punti[i].y+")");
		System.out.println("Ordinati");	
		Arrays.sort(punti);	
		for (int i=0;i<10;i++)
			System.out.println("("+punti[i].x+","+punti[i].y+")");
	}

}
