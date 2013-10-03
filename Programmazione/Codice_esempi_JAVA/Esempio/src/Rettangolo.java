
public class Rettangolo extends Object {
	private double base,altezza;
	
	public Rettangolo(double base, double altezza) {
		super();
		this.base = base;
		this.altezza = altezza;
	}

	public double getArea()
	{
		return base*altezza;
	}

}
