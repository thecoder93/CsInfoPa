package uni.mat.awt;

import java.awt.Component;
import java.awt.Graphics;

public class ProvaComponente extends Component {

	@Override
	public void paint(Graphics g) {
		// TODO Auto-generated method stub
		super.paint(g);
		g.drawLine(10,10,50,50);
	}
	
	

}
