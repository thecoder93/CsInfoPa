package uni.mat.generics;

public class SwapGenerics {

	public static <T> void swap(T a, T b) {
		System.out.println("a:"+a+"-"+"b:"+b);
		T c = a;
		a = b;
		b = c;
		System.out.println("a:"+a+"-"+"b:"+b);
	}
	
	public static void swap(int a,int b)
	{
		int c = a;
		a = b;
		b = c;
	}
	
	public static void main(String[] args)
	{
		String s1="av";
		String s2="bb";
		System.out.println("S1:"+s1+"-"+"S2:"+s2);
		SwapGenerics.swap(s1,s2);
		System.out.println("S1:"+s1+"-"+"S2:"+s2);
		int a1=1;
		int a2=2;
		System.out.println("A1:"+a1+"-"+"A2:"+a2);
		SwapGenerics.swap(a1,a2);
		System.out.println("A1:"+a1+"-"+"A2:"+a2);	
	}
}
