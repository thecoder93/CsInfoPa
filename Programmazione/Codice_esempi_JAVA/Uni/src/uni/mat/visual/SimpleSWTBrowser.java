package uni.mat.visual;

/*******************************************************************************
 * Copyright (c) 2003, 2004 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *******************************************************************************/

import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.ProgressBar;
import org.eclipse.swt.widgets.Text;

public class SimpleSWTBrowser {

	public static final String APP_TITLE = "Simple SWT Browser";

	public static final String HOME_URL = "http://www.eclipse.org/vep/";

	private org.eclipse.swt.widgets.Shell sShell = null; // @jve:decl-index=0:visual-constraint="10,10"

	private Button backButton = null;

	private Button forwardButton = null;

	private Button stopButton = null;

	private Text locationText = null;

	private Button goButton = null;

	private Browser browser = null;

	private Button homeButton = null;

	private Label statusText = null;

	private ProgressBar progressBar = null;

	private Button refreshButton = null;

	/**
	 * This method initializes browser
	 */
	private void createBrowser() {
		org.eclipse.swt.layout.GridData gridData3 = new org.eclipse.swt.layout.GridData();
		browser = new Browser(sShell, SWT.BORDER);
		gridData3.horizontalSpan = 7;
		gridData3.horizontalAlignment = org.eclipse.swt.layout.GridData.FILL;
		gridData3.verticalAlignment = org.eclipse.swt.layout.GridData.FILL;
		gridData3.grabExcessVerticalSpace = true;
		browser.setLayoutData(gridData3);
		browser.addTitleListener(new org.eclipse.swt.browser.TitleListener() {
			public void changed(org.eclipse.swt.browser.TitleEvent e) {
				sShell.setText(APP_TITLE + " - " + e.title);
			}
		});
		browser
				.addLocationListener(new org.eclipse.swt.browser.LocationListener() {
					public void changing(org.eclipse.swt.browser.LocationEvent e) {
						locationText.setText(e.location);
					}

					public void changed(org.eclipse.swt.browser.LocationEvent e) {
					}
				});
		browser
				.addProgressListener(new org.eclipse.swt.browser.ProgressListener() {
					public void changed(org.eclipse.swt.browser.ProgressEvent e) {
						if (!stopButton.isEnabled() && e.total != e.current) {
							stopButton.setEnabled(true);
						}
						progressBar.setMaximum(e.total);
						progressBar.setSelection(e.current);
					}

					public void completed(
							org.eclipse.swt.browser.ProgressEvent e) {
						stopButton.setEnabled(false);
						backButton.setEnabled(browser.isBackEnabled());
						forwardButton.setEnabled(browser.isForwardEnabled());
						progressBar.setSelection(0);
					}
				});
		browser
				.addStatusTextListener(new org.eclipse.swt.browser.StatusTextListener() {
					public void changed(
							org.eclipse.swt.browser.StatusTextEvent e) {
						statusText.setText(e.text);
					}
				});
		browser.setUrl(HOME_URL);
	}

	public static void main(String[] args) {
		/*
		 * Before this is run, be sure to set up the following in the launch
		 * configuration (Arguments->VM Arguments) for the correct SWT library
		 * path. The following is a windows example:
		 * -Djava.library.path="installation_directory\plugins\org.eclipse.swt.win32_3.0.0\os\win32\x86"
		 */
		org.eclipse.swt.widgets.Display display = org.eclipse.swt.widgets.Display
				.getDefault();
		SimpleSWTBrowser thisClass = new SimpleSWTBrowser();
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
		org.eclipse.swt.layout.GridLayout gridLayout1 = new GridLayout();
		org.eclipse.swt.layout.GridData gridData2 = new org.eclipse.swt.layout.GridData();
		org.eclipse.swt.layout.GridData gridData4 = new org.eclipse.swt.layout.GridData();
		org.eclipse.swt.layout.GridData gridData5 = new org.eclipse.swt.layout.GridData();
		org.eclipse.swt.layout.GridData gridData6 = new org.eclipse.swt.layout.GridData();
		org.eclipse.swt.layout.GridData gridData7 = new org.eclipse.swt.layout.GridData();
		org.eclipse.swt.layout.GridData gridData8 = new org.eclipse.swt.layout.GridData();
		backButton = new Button(sShell, SWT.ARROW | SWT.LEFT);
		forwardButton = new Button(sShell, SWT.ARROW | SWT.RIGHT);
		stopButton = new Button(sShell, SWT.NONE);
		refreshButton = new Button(sShell, SWT.NONE);
		homeButton = new Button(sShell, SWT.NONE);
		locationText = new Text(sShell, SWT.BORDER);
		goButton = new Button(sShell, SWT.NONE);
		createBrowser();
		progressBar = new ProgressBar(sShell, SWT.BORDER);
		statusText = new Label(sShell, SWT.NONE);
		sShell.setText(APP_TITLE);
		sShell.setLayout(gridLayout1);
		gridLayout1.numColumns = 7;
		backButton.setEnabled(false);
		backButton.setToolTipText("Navigate back to the previous page");
		backButton.setLayoutData(gridData6);
		forwardButton.setEnabled(false);
		forwardButton.setToolTipText("Navigate forward to the next page");
		forwardButton.setLayoutData(gridData5);
		stopButton.setText("Stop");
		stopButton.setEnabled(false);
		stopButton.setToolTipText("Stop the loading of the current page");
		goButton.setText("Go!");
		goButton.setLayoutData(gridData8);
		goButton.setToolTipText("Navigate to the selected web address");
		gridData2.grabExcessHorizontalSpace = true;
		gridData2.horizontalAlignment = org.eclipse.swt.layout.GridData.FILL;
		gridData2.verticalAlignment = org.eclipse.swt.layout.GridData.CENTER;
		locationText.setLayoutData(gridData2);
		locationText.setText(HOME_URL);
		locationText.setToolTipText("Enter a web address");
		homeButton.setText("Home");
		homeButton.setToolTipText("Return to home page");
		statusText.setText("Done");
		statusText.setLayoutData(gridData7);
		gridData4.horizontalSpan = 5;
		progressBar.setLayoutData(gridData4);
		progressBar.setEnabled(false);
		progressBar.setSelection(0);
		gridData5.horizontalAlignment = org.eclipse.swt.layout.GridData.FILL;
		gridData5.verticalAlignment = org.eclipse.swt.layout.GridData.FILL;
		gridData6.horizontalAlignment = org.eclipse.swt.layout.GridData.FILL;
		gridData6.verticalAlignment = org.eclipse.swt.layout.GridData.FILL;
		gridData7.horizontalSpan = 1;
		gridData7.grabExcessHorizontalSpace = true;
		gridData7.horizontalAlignment = org.eclipse.swt.layout.GridData.FILL;
		gridData7.verticalAlignment = org.eclipse.swt.layout.GridData.CENTER;
		gridData8.horizontalAlignment = org.eclipse.swt.layout.GridData.END;
		gridData8.verticalAlignment = org.eclipse.swt.layout.GridData.CENTER;
		refreshButton.setText("Refresh");
		refreshButton.setToolTipText("Refresh the current page");
		sShell.setSize(new org.eclipse.swt.graphics.Point(553, 367));
		locationText
				.addMouseListener(new org.eclipse.swt.events.MouseAdapter() {
					public void mouseUp(org.eclipse.swt.events.MouseEvent e) {
						locationText.selectAll();
					}
				});
		locationText.addKeyListener(new org.eclipse.swt.events.KeyAdapter() {
			public void keyPressed(org.eclipse.swt.events.KeyEvent e) {
				// Handle the press of the Enter key in the locationText.
				// This will browse to the entered text.
				if (e.character == SWT.LF || e.character == SWT.CR) {
					e.doit = false;
					browser.setUrl(locationText.getText());
				}
			}
		});
		refreshButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						browser.refresh();
					}
				});
		locationText
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						browser.setUrl(locationText.getText());
					}
				});
		stopButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						browser.stop();
					}
				});
		backButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						browser.back();
					}
				});
		forwardButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						browser.forward();
					}
				});
		homeButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						browser.setUrl(HOME_URL);
					}
				});
		goButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						browser.setUrl(locationText.getText());
					}
				});
	}
}
