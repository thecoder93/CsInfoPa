/**
 * hzxgz<x<z xuyz<g x<zuyg z< yugx<zx<z
 * xz<ixz< ixz<xz<
 * 
 * @author studente
 *
 */
public class Punto implements Comparable<Punto> {
	public int x;

	public int y;

	public Punto(int a, int b) {
		super();
		
		this.x = a;
		this.y = b;
		 
	}

	public double distanza(Punto p2) {
		double dx = this.x - p2.x;
		double dy = this.y - p2.y;
		return Math.sqrt(dx * dx + dy * dy);
	}
	
	public double distanzaOrigine() {
		double dx = this.x;
		double dy = this.y;
		return Math.sqrt(dx * dx + dy * dy);
	}
	

	

	public boolean equals(Object arg0) {
		if (!(arg0 instanceof Punto)) return false;
		Punto p=(Punto) arg0;
		return ((this.x==p.x) && (this.y==p.y));
	}
	
	
	
	
	public int hashCode() {
		return x+13*y;
	}
	
	public String toString() {
		// TODO Auto-generated method stub
		return "("+x+","+y+")";
	}


	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(Punto arg0) {
		if (this.distanzaOrigine()<arg0.distanzaOrigine())
			return -1;
		else
			if (this.distanzaOrigine()>arg0.distanzaOrigine())
				return 1;
			else return 0;
	}
}
