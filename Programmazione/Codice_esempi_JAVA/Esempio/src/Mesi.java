
public enum Mesi {
	gennaio(31), febbraio(28), marzo(30), aprile(30), dsds_dsdsd(20) {
		
		public String toString()
		{
			return "dsd dsdsd";
		}
		
	};

	private final int giorni;
	

	Mesi(int giorni) {
		this.giorni=giorni;
	}
	public int getGiorni()
	{
		return this.giorni;
	}
}
