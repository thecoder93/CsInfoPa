package uni.mat.io.serializzazione;

public class Punto implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3257852094999312697L;

	float x, y;

	public Punto(float x, float y) {
		this.x = x;
		this.y = y;
	}

	public Punto() {
		x = y = 0;
	}

	public float ascissa() {
		return x;
	}

	public float ordinata() {
		return y;
	}
}
