package uni.mat.forme;

public class Triangolo extends Poligono {
	private int base, altezza;

	public Triangolo(int base, int altezza) {
		super();
		// TODO Auto-generated constructor stub
		this.base = base;
		this.altezza = altezza;
	}

	@Override
	public double getArea() {
		// TODO Auto-generated method stub
		return base * altezza / 2;
	}

	public String toString() {
		return "Triangolo base:" + base + " altezza:" + altezza + " area:"
				+ this.getArea();
	}

}
