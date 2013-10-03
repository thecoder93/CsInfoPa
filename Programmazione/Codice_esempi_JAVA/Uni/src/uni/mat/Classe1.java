package uni.mat;

public class Classe1 {
	
	static {
		System.out.println("f");
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("g");
		Classe2 c=new Classe2();
	}

}
