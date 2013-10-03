package uni.mat.swing;

import java.awt.BorderLayout;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JTable;
import javax.swing.JScrollPane;
import javax.swing.table.DefaultTableModel;

public class EsercizioTable extends JFrame {

	private JPanel jContentPane = null;
	private JTable jTable = null;
	private JScrollPane jScrollPane = null;
	private DefaultTableModel defaultTableModel = null;  //  @jve:decl-index=0:visual-constraint=""

	/**
	 * This method initializes jTable	
	 * 	
	 * @return javax.swing.JTable	
	 */    
	private JTable getJTable() {
		if (jTable == null) {
			jTable = new JTable();
			jTable.setModel(getDefaultTableModel());
		}
		return jTable;
	}

	/**
	 * This method initializes jScrollPane	
	 * 	
	 * @return javax.swing.JScrollPane	
	 */    
	private JScrollPane getJScrollPane() {
		if (jScrollPane == null) {
			jScrollPane = new JScrollPane();
			jScrollPane.setViewportView(getJTable());
		}
		return jScrollPane;
	}

	/**
	 * This method initializes defaultTableModel	
	 * 	
	 * @return javax.swing.table.DefaultTableModel	
	 */    
	private DefaultTableModel getDefaultTableModel() {
		if (defaultTableModel == null) {
			defaultTableModel = new DefaultTableModel();
			defaultTableModel.setColumnCount(2);
			defaultTableModel.setNumRows(4);
			defaultTableModel.setColumnIdentifiers(new String[]{"aa","ccdcd"});
		}
		return defaultTableModel;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EsercizioTable p=new EsercizioTable();
	}

	/**
	 * This is the default constructor
	 */
	public EsercizioTable() {
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
			jContentPane.setLayout(new BorderLayout());
			jContentPane.add(getJScrollPane(), java.awt.BorderLayout.CENTER);
		}
		return jContentPane;
	}

}
