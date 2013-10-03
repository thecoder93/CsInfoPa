package uni.mat.applet;

import java.awt.BorderLayout;
import javax.swing.JPanel;
import javax.swing.JApplet;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTree;
import javax.swing.JEditorPane;

public class ProvaApplet extends JApplet {

	private JPanel jContentPane = null;
	private JTextField jTextField = null;
	private JButton jButton = null;
	private JScrollPane jScrollPane = null;
	private JTree jTree = null;
	private JEditorPane jEditorPane = null;

	/**
	 * This is the default constructor
	 */
	public ProvaApplet() {
		super();
		init();
	}

	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	public void init() {
		this.setSize(400, 200);
		this.setContentPane(getJContentPane());
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
			jContentPane.add(getJEditorPane(), null);
			jContentPane.add(getJScrollPane(), null);
			jContentPane.add(getJButton(), null);
			jContentPane.add(getJTextField(), null);
		}
		return jContentPane;
	}

	/**
	 * This method initializes jTextField	
	 * 	
	 * @return javax.swing.JTextField	
	 */    
	private JTextField getJTextField() {
		if (jTextField == null) {
			jTextField = new JTextField();
			jTextField.setBounds(154, 31, 172, 24);
		}
		return jTextField;
	}

	/**
	 * This method initializes jButton	
	 * 	
	 * @return javax.swing.JButton	
	 */    
	private JButton getJButton() {
		if (jButton == null) {
			jButton = new JButton();
			jButton.setBounds(216, 94, 50, 20);
		}
		return jButton;
	}

	/**
	 * This method initializes jScrollPane	
	 * 	
	 * @return javax.swing.JScrollPane	
	 */    
	private JScrollPane getJScrollPane() {
		if (jScrollPane == null) {
			jScrollPane = new JScrollPane();
			jScrollPane.setBounds(15, 14, 133, 125);
			jScrollPane.setViewportView(getJTree());
		}
		return jScrollPane;
	}

	/**
	 * This method initializes jTree	
	 * 	
	 * @return javax.swing.JTree	
	 */    
	private JTree getJTree() {
		if (jTree == null) {
			jTree = new JTree();
			jTree.setShowsRootHandles(true);
			jTree.setEditable(true);
			jTree.setComponentOrientation(java.awt.ComponentOrientation.LEFT_TO_RIGHT);
		}
		return jTree;
	}

	/**
	 * This method initializes jEditorPane	
	 * 	
	 * @return javax.swing.JEditorPane	
	 */    
	private JEditorPane getJEditorPane() {
		if (jEditorPane == null) {
			jEditorPane = new JEditorPane();
			jEditorPane.setBounds(174, 134, 94, 42);
		}
		return jEditorPane;
	}

}  //  @jve:decl-index=0:visual-constraint="10,10"
