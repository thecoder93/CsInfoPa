package uni.mat.generics;

import java.util.ArrayList;

public class Printer {
	//sbagliata
	//public static void print(ArrayList<Animal> animals) {}
	//esatta
	public static <T extends Animal> void print(ArrayList<T> animals) {
	}
	
	public static void main(String[] args)
	{
		ArrayList<Dog> dogs = new ArrayList<Dog>();
		Printer.print(dogs);
	}
}
