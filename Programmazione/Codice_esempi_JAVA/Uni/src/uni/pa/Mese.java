package uni.pa;

public enum Mese {
	gennaio(31) {
		public void prova()
		{}
		
	},febbraio(28) {
		public void prova()
		{}
		
	};
	
	private final int giorni;
	
	Mese(int giorni)
	{
		this.giorni=giorni;
	}
	
	public int getGiorni()
	{
		return this.giorni;
	}
	
	public abstract void prova();
}
