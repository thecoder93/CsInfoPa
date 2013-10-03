/*
 * Created on 6-mag-2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package uni.mat.directory;

import java.io.File;

/**
 * @author studente
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Directory {
	
	public static void directory(String path)
	{
		File f=new File(path);
		File[] dir=f.listFiles();
		for (File d:dir)
		{
			System.out.println(d);
			if (d.isDirectory()) directory(d.getAbsolutePath());
		}
		
	}

	public static void main(String[] args) {
		directory("C:/");
	}
}
