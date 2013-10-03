package uni.mat.eccezioni;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Principale {
	private Scanner s;

	public Principale() {
		super();
		this.s = new Scanner(System.in);
	}

	public int leggiIntero() {
		int a = -1;
		do {
			try {
				a = s.nextInt();
				break;
			} catch (InputMismatchException e) {
				s.next();
				System.out.println("Errore nell'inserimento, riprova!");
				continue;
			}
		} while (true);
		return a;
	}

	public int leggiIntero2() {
		int a = -1;
		try {
			a = s.nextInt();
		} catch (InputMismatchException e) {
			s.next();
			System.out.println("Errore nell'inserimento, riprova!");
			return leggiIntero2();
		}
		return a;
	}

	public int leggiIntero3() throws Exception {
		try {
			return s.nextInt();
		} catch (InputMismatchException e) {
			s.next();
			throw (Exception) e;
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Principale p = new Principale();
		p.leggiIntero2();

		/*
		 * // TODO Auto-generated method stub Principale p = new Principale(); //
		 * p.leggiIntero2(); do try { p.leggiIntero3(); break; } catch
		 * (Exception e) { System.out.println("Errore nell'inserimento,
		 * riprova!"); continue; } while (true);
		 */

		/*
		 * Scanner p=new Scanner(System.in); int a=-1; try { a = p.nextInt();
		 * System.out.println(a); } catch (InputMismatchException e) { // TODO
		 * Auto-generated catch block System.out.println("Non è un numero"); }
		 */

	}
}
