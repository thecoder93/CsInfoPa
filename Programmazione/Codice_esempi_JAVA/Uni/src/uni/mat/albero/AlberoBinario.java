package uni.mat.albero;

public class AlberoBinario {
	private Comparable value;
	private AlberoBinario left,right;
	
	public AlberoBinario(Comparable value) {
		super();
		this.value = value;
	}

	public AlberoBinario() {
		
	}

	public Comparable getValue() {
		return value;
	}

	public void setValue(Comparable value) {
		this.value = value;
	}

	public AlberoBinario getLeft() {
		return left;
	}

	public void setLeft(AlberoBinario left) {
		this.left = left;
	}

	public AlberoBinario getRight() {
		return right;
	}

	public void setRight(AlberoBinario right) {
		this.right = right;
	}
	
	public void insert(Comparable value)
	{
		if (this.value==null)
			this.value=value;
		else
		{
			if (value.compareTo(this.value)<0)
			{
				if (this.getLeft()==null)
					this.setLeft(new AlberoBinario());
				this.getLeft().insert(value);
			} else
			{
				if (this.getRight()==null)
					this.setRight(new AlberoBinario());
				this.getRight().insert(value);
			}
		}
		
	}
	
	public void visitaInOrdine()
	{
		if (this.getLeft()!=null)
			this.getLeft().visitaInOrdine();
		if (this.value!=null)
			System.out.println(this.value);
		if (this.getRight()!=null)
			this.getRight().visitaInOrdine();
	}
	
	
	
}
