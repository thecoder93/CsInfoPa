package uni.mat.forme;

public abstract class Forma implements Comparable<Forma> {

	public abstract double getArea();

	public int compareTo(Forma b) {
		if (this.getArea() < b.getArea()) {
			return -1;
		} else if (this.getArea() == b.getArea()) {
			return 0;
		} else
			return 1;
	}
}
