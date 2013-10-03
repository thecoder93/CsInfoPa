package uni.mat.albero;

public class Complesso implements Comparable<Complesso> {
	public double real;
	public double img;
	
	public Complesso(double real, double img) {
		super();
		// TODO Auto-generated constructor stub
		this.real = real;
		this.img = img;
	}
	
	public void add(Complesso c)
	{
		this.real+=c.real;
		this.img+=c.img;
	}

	public double modulo()
	{
		return Math.sqrt (real*real + img*img);
	}
	
	public int compareTo(Complesso arg0) {
		if (this.modulo()<arg0.modulo()) return -1;
		else if (this.modulo()>arg0.modulo()) return 1;
		else return 0;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		if (img<0)
			return real+"-i "+Math.abs(img);//+ "           --"+this.modulo();
		else
			return real+"+i "+Math.abs(img);//+"           --"+this.modulo();
	}

	
	
	
	
}
