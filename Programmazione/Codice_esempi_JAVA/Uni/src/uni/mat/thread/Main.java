package uni.mat.thread;


public class Main {
	public static int campioni=10;
	public static int thread=6;
	public static Grafico grafico=new Grafico(campioni,thread);

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Thread[] threads=new Thread[thread];
		for (int i=0;i<thread;i++)
			threads[i]=new SimpleThread("THREAD"+i,campioni,i);
		
		for (int i=0;i<thread;i++)
			threads[i].start();
	    
	}

}
