package uni.mat.swing;

import java.awt.GraphicsConfiguration;
import java.util.Vector;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JComboBox;

public class EsercizioComboBox extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3905800890022834736L;
	private JPanel jContentPane = null;
	private JComboBox jComboBox = null;
	private static Vector<Persona> persone= null;

	/**
	 * This method initializes jComboBox	
	 * 	
	 * @return javax.swing.JComboBox	
	 */    
	private JComboBox getJComboBox() {
		if (jComboBox == null) {
			jComboBox = new JComboBox();
			jComboBox.setBounds(98, 42, 150, 26);
			jComboBox.setModel(new DefaultComboBoxModel(persone));
		}
		return jComboBox;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		persone=new Vector<Persona>();
		persone.add(new Persona("mario","rossi"));
		persone.add(new Persona("mario","bianchi"));
		persone.add(new Persona("luigi","verdi"));
		EsercizioComboBox p=new EsercizioComboBox();

	}

	/**
	 * This is the default constructor
	 */
	public EsercizioComboBox() {
		super();
		initialize();
	}

	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	private void initialize() {
		this.setSize(300, 200);
		this.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
		this.setContentPane(getJContentPane());
		this.setTitle("JFrame");
		this.setVisible(true);
	}

	/**
	 * This method initializes jContentPane
	 * 
	 * @return javax.swing.JPanel
	 */
	private JPanel getJContentPane() {
		if (jContentPane == null) {
			jContentPane = new JPanel();
			jContentPane.setLayout(null);
			jContentPane.add(getJComboBox(), null);
		}
		return jContentPane;
	}

}
