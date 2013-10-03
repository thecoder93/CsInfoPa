package uni.mat.forme;

public class Quadrato extends Rettangolo {

	public Quadrato(int lato) {
		super(lato, lato);
	}

	@Override
	public String toString() {
		return "Quadrato di lato :"+this.altezza;
	}
	
	
}
