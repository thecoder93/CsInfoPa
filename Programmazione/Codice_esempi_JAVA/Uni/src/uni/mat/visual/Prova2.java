package uni.mat.visual;

import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Scale;
import org.eclipse.swt.widgets.Text;

public class Prova2 extends Composite {

	private Scale scale = null;

	private Label label = null;

	private Combo combo = null;

	private Text text = null;

	private Browser browser = null;

	/**
	 * This method initializes combo
	 */
	private void createCombo() {
		combo = new Combo(this, SWT.NONE);
		combo
				.setBounds(new org.eclipse.swt.graphics.Rectangle(143, 72, 95,
						22));
	}

	/**
	 * This method initializes browser
	 */
	private void createBrowser() {
		browser = new Browser(this, SWT.NONE);
		browser
				.setBounds(new org.eclipse.swt.graphics.Rectangle(36, 64, 34,
						33));
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * Before this is run, be sure to set up the following in the launch
		 * configuration (Arguments->VM Arguments) for the correct SWT library
		 * path. The following is a windows example:
		 * -Djava.library.path="installation_directory\plugins\org.eclipse.swt.win32_3.0.0\os\win32\x86"
		 */
		org.eclipse.swt.widgets.Display display = org.eclipse.swt.widgets.Display
				.getDefault();
		org.eclipse.swt.widgets.Shell shell = new org.eclipse.swt.widgets.Shell(
				display);
		shell.setLayout(new org.eclipse.swt.layout.FillLayout());
		shell.setSize(new org.eclipse.swt.graphics.Point(300, 200));
		Prova2 thisClass = new Prova2(shell, org.eclipse.swt.SWT.NONE);
		shell.open();

		while (!shell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
		display.dispose();
	}

	public Prova2(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		scale = new Scale(this, SWT.NONE);
		label = new Label(this, SWT.CENTER);
		createCombo();
		text = new Text(this, SWT.BORDER);
		createBrowser();
		scale.setBounds(new org.eclipse.swt.graphics.Rectangle(100, 140, 190,
				45));
		label
				.setBounds(new org.eclipse.swt.graphics.Rectangle(34, 151, 58,
						14));
		label.setText("Label");
		label.setEnabled(true);
		text
				.setBounds(new org.eclipse.swt.graphics.Rectangle(105, 34, 143,
						20));
		setSize(new org.eclipse.swt.graphics.Point(429, 241));
	}

} // @jve:decl-index=0:visual-constraint="10,10"
