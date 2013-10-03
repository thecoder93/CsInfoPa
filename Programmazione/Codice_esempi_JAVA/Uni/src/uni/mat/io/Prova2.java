package uni.mat.io;

import java.io.Serializable;

public class Prova2 implements Serializable {
	String n;
	String a;
	Prova1 aa;
	
	public Prova2()
	{
		n="dd";
		a="ff";
		aa=new Prova1();
	}

}
