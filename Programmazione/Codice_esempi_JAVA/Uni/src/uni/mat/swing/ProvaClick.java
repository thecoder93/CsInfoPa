package uni.mat.swing;

import java.awt.BorderLayout;
import java.awt.Point;

import javax.swing.JPanel;
import javax.swing.JFrame;

public class ProvaClick extends JFrame {

	private JPanel jContentPane = null;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ProvaClick p=new ProvaClick();
	}

	/**
	 * This is the default constructor
	 */
	public ProvaClick() {
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
			jContentPane.addMouseListener(new java.awt.event.MouseAdapter() { 
				public void mouseClicked(java.awt.event.MouseEvent e) {    
					System.out.println("mouseClicked() "+e.getPoint());
					Point p=e.getPoint();
					jContentPane.getGraphics().drawOval(p.x,p.y,5,5);
					Seconda s=new Seconda();
				}
			});
			
		}
		return jContentPane;
	}

}
