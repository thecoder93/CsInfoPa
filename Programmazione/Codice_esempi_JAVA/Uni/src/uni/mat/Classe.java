package uni.mat;

import java.util.HashSet;
import java.util.Set;

public class Classe {
	private  Set<Persona> alunni;

	public Classe()
	{
		this.alunni=new HashSet<Persona>();
	}
	
	public void aggiungiAlunno(Persona p)
	{
		this.alunni.add(p);
	}
	
	public int numeroAlunni()
	{
		return this.alunni.size();
	}
	
	
	

}
