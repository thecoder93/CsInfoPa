
public class Data {
	private int giorno;
	private int mese;
	private int anno;
	
	
	
	public Data(int giorno, int mese, int anno) throws DataNonValidaException {
		super();
		this.controlla(giorno,mese,anno);
		this.giorno = giorno;
		this.mese = mese;
		this.anno = anno;
		
	}
	public int getAnno() {
		return anno;
	}
	public void setAnno(int anno) throws DataNonValidaException {
		this.controlla(giorno,mese,anno);
		this.anno = anno;
		
	}
	public int getGiorno() {
		return giorno;
	}
	public void setGiorno(int giorno) {
		this.giorno = giorno;
	}
	public int getMese() {
		return mese;
	}
	public void setMese(int mese) {
		this.mese = mese;
	}
	public void setData(int giorno,int mese,int anno) throws DataNonValidaException
	{
		this.controlla(giorno,mese,anno);
		this.giorno = giorno;
		this.mese = mese;
		this.anno = anno;
	}
	
	private void controlla(int giorno,int mese,int anno) throws DataNonValidaException
	{
		if (giorno>31)
			throw new DataNonValidaException();
	}
	
	@Override
	public String toString() {
		return this.giorno+"/"+this.mese+"/"+this.anno;
	}
	
	
	

}
