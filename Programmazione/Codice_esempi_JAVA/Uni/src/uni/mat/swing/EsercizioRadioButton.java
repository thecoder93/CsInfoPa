package uni.mat.swing;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JRadioButton;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import java.awt.GridLayout;

public class EsercizioRadioButton extends JFrame implements ActionListener {

	private JPanel jContentPane = null;

	private JRadioButton fish1Button = null;

	private JRadioButton fish2Button = null;

	private ButtonGroup group = new ButtonGroup();

	private JLabel immagine = null;

	private JRadioButton fish3Button = null;

	private JPanel jPanel = null;

	/**
	 * This method initializes jRadioButton
	 * 
	 * @return javax.swing.JRadioButton
	 */
	private JRadioButton getFish1Button() {
		if (fish1Button == null) {
			fish1Button = new JRadioButton();
			fish1Button.setText("fish1");
			fish1Button.addActionListener(this);

			this.group.add(fish1Button);
		}
		return fish1Button;
	}

	/**
	 * This method initializes jRadioButton1
	 * 
	 * @return javax.swing.JRadioButton
	 */
	private JRadioButton getFish2Button() {
		if (fish2Button == null) {
			fish2Button = new JRadioButton();
			fish2Button.setText("fish2");
			fish2Button.addActionListener(this);
			this.group.add(fish2Button);

		}
		return fish2Button;
	}

	/**
	 * This method initializes jRadioButton2
	 * 
	 * @return javax.swing.JRadioButton
	 */
	private JRadioButton getFish3Button() {
		if (fish3Button == null) {
			fish3Button = new JRadioButton();
			fish3Button.setText("fish3");
			fish3Button.addActionListener(this);
			this.group.add(fish3Button);

		}
		return fish3Button;
	}

	/**
	 * This method initializes jPanel	
	 * 	
	 * @return javax.swing.JPanel	
	 */    
	private JPanel getJPanel() {
		if (jPanel == null) {
			GridLayout gridLayout1 = new GridLayout();
			gridLayout1.setRows(3);
			jPanel = new JPanel();
			jPanel.setLayout(gridLayout1);
			jPanel.add(getFish1Button(), null);
			jPanel.add(getFish2Button(), null);
			jPanel.add(getFish3Button(), null);
		}
		return jPanel;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EsercizioRadioButton c = new EsercizioRadioButton();
	}

	/**
	 * This is the default constructor
	 */
	public EsercizioRadioButton() {
		super();
		initialize();
	}

	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	private void initialize() {
		this.setSize(401, 200);
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
			immagine = new JLabel();
			jContentPane = new JPanel();
			jContentPane.setLayout(new BorderLayout());
			jContentPane.add(getJPanel(), java.awt.BorderLayout.WEST);
			jContentPane.add(immagine, java.awt.BorderLayout.CENTER);
		}
		return jContentPane;
	}

	public void actionPerformed(ActionEvent e) {
		this.immagine.setIcon(new ImageIcon(EsercizioRadioButton.class
				.getResource("img/" + e.getActionCommand()
						+ ".gif")));
		System.out.println(e.getActionCommand());

	}

} // @jve:decl-index=0:visual-constraint="10,10"
