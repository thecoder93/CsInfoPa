import java.util.Comparator;

/*
 * Created on 1-gen-2002
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */

/**
 * @author studente
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class PersonaComparatorTotale implements Comparator<Persona> {

	/* (non-Javadoc)
	 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
	 */
	public int compare(Persona arg0, Persona arg1) {
		if (arg0.getNome().compareTo(arg1.getNome())==0)
			return arg0.getEta()-arg1.getEta();
		return arg0.getNome().compareTo(arg1.getNome());
	}

}
