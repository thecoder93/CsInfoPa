package uni.mat.thread;

public class SimpleThread extends Thread {
	 // private static Test monitor = new Test();
	  private int countDown;
	  private int numero;
	  
	  public SimpleThread(String name,int tempo,int numero) {
	    super(name); 
	    this.countDown=tempo;
	    this.numero=numero;
	  }
	  public String toString() {
	    return "#" + getName() + ": " + countDown;
	  }
	  public void run() {
	    while(true) {
	      //System.out.println(this);
	      Main.grafico.mark(this.numero);
	      if(--countDown == 0) return;
	    }
	  }
	  
} 