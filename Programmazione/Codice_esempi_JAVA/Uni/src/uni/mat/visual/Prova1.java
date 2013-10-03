package uni.mat.visual;

import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.widgets.Button;

public class Prova1 {

	private org.eclipse.swt.widgets.Shell sShell = null; // @jve:decl-index=0:visual-constraint="10,10"

	private Browser browser = null;

	private Button button = null;

	/**
	 * This method initializes browser
	 */
	private void createBrowser() {
		browser = new Browser(sShell, SWT.NONE);
		browser.setUrl("http://localhost:8080/jforum");
		browser.setBounds(new org.eclipse.swt.graphics.Rectangle(-1, -1, 305,
				190));
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
		Prova1 thisClass = new Prova1();
		thisClass.createSShell();
		thisClass.sShell.open();

		while (!thisClass.sShell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
		display.dispose();
	}

	/**
	 * This method initializes sShell
	 */
	private void createSShell() {
		sShell = new org.eclipse.swt.widgets.Shell();
		sShell.setText("Shell");
		sShell.setSize(new org.eclipse.swt.graphics.Point(473, 235));
		button = new Button(sShell, SWT.NONE);
		button.setBounds(new org.eclipse.swt.graphics.Rectangle(321, 31, 109,
				28));
		button.setText("Click");
		createBrowser();
	}

}
