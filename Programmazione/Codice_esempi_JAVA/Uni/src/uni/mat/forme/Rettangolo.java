package uni.mat.forme;

public class Rettangolo extends Poligono {
	protected  int base, altezza;

	public Rettangolo(int base, int altezza) {
		super();
		// TODO Auto-generated constructor stub
		this.base = base;
		this.altezza = altezza;
	}

	@Override
	public double getArea() {
		// TODO Auto-generated method stub
		return base * altezza;
	}

	@Override
	public String toString() {
		return "Rettangolo base:" + base + " altezza:" + altezza + " area:"
				+ this.getArea();
	}
}
