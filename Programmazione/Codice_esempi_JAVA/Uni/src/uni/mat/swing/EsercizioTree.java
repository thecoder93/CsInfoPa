package uni.mat.swing;

import java.awt.BorderLayout;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;

public class EsercizioTree extends JFrame {

	private JPanel jContentPane = null;
	private JTree jTree = null;

	/**
	 * This method initializes jTree	
	 * 	
	 * @return javax.swing.JTree	
	 */    
	private JTree getJTree() {
		if (jTree == null) {
			jTree = new JTree();
			DefaultMutableTreeNode root=new DefaultMutableTreeNode("dds");
			root.add(new DefaultMutableTreeNode("ddsdsds"));
			DefaultTreeModel p=new DefaultTreeModel(root);
			jTree.setModel(p);
		}
		return jTree;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EsercizioTree p=new EsercizioTree();
	}

	/**
	 * This is the default constructor
	 */
	public EsercizioTree() {
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
			jContentPane.add(getJTree(), java.awt.BorderLayout.CENTER);
		}
		return jContentPane;
	}

}
