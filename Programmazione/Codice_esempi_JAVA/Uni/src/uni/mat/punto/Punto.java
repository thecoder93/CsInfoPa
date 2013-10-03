package uni.mat.punto;

public class Punto implements Comparable {
	public double x,y;
	
	public Punto(double x, double y) {
		this.x = x;
		this.y = y;
	}

	public double distanza(Punto p)
	{
		double dx=x-p.x;
		double dy=y-p.y;
		return Math.sqrt(dx*dx+dy*dy);
	}
	
	public static double distanza(Punto a,Punto b)
	{
		return a.distanza(b);
	}

	public int compareTo(Object o) {
		if (o instanceof Punto)
		{
			Punto nuovo=(Punto) o;
			Punto origine=new Punto(0,0);
			double d1=this.distanza(origine);
			double d2=nuovo.distanza(origine);
			if (d1<d2) return -1;
			else if (d1>d2) return 1;
			else return 0;
		}
		return 0;
		
	}
		
}
