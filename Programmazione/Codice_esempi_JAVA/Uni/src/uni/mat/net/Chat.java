package uni.mat.net;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;


public class Chat {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int serverPort=Integer.parseInt(args[0]);
		int connectPort=Integer.parseInt(args[1]);
		try {
			ServerSocket s1=new ServerSocket(serverPort);
			Socket output=new Socket("127.0.0.1",serverPort);
			Socket input=new Socket("127.0.0.1",connectPort);
			DataOutputStream doutput=new DataOutputStream(output.getOutputStream());
			
			//Socket output=new Socket(s1.getInetAddress());
			Scanner scanner=new Scanner(System.in);
			String str=null;
			do {
				str=scanner.nextLine();
				if (str.equalsIgnoreCase("exit"))
					break;
				else
				{
					doutput.writeBytes(str);
				}
			} while (!str.equals("exit"));
				
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
