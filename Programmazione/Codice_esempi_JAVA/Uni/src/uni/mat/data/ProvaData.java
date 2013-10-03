package uni.mat.data;

public class ProvaData {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		boolean errore=false;
		do {
		Data d=new Data();
		try {
			d.setGiorno(34);
		} catch (DateInvalidException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errore=true;
		}
		} while (errore);

	}

}
