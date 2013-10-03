package uni.mat.data;

public class Data {
	private int giorno;
	private int mese;
	private int anno;
	
	public int getAnno() {
		return anno;
	}
	public void setAnno(int anno) {
		this.anno = anno;
	}
	public int getGiorno() {
		return giorno;
	}
	public void setGiorno(int giorno) throws DateInvalidException {
		if (giorno>31)
			throw new DateInvalidException("giorno non valido");
		this.giorno = giorno;
	}
	public int getMese() {
		return mese;
	}
	public void setMese(int mese) throws DateInvalidException {
		if (mese>12)
			throw new DateInvalidException("mese non valido");
		this.mese = mese;
	}
	
	

}
