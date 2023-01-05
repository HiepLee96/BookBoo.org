package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Books> items;

	public Cart() {
		items = new ArrayList<>();
	}
	
	//TIm cach tao ra cach dem cac item trong gio hang
	//Them book vao gio hang
	public void add(Books ci) {
		for(Books x : items) {
			if(ci.getID().equalsIgnoreCase(x.getID())) {
				x.setNumberInCart(x.getNumberInCart() + 1);
				return;
			}
		}
		items.add(ci);
	}
	
	//Xoa item ra khoi gio hang
	public void remove(String ID) {
		for(Books x : items) {
			if(x.getID().equalsIgnoreCase(ID)) {
				if(x.getNumberInCart() > 1) {
					x.setNumberInCart(x.getNumberInCart() - 1);
					return;
				}
				items.remove(x);
				return;
			}
		}
	}
	
	//Return total amount of cart
	public double getAmount() {
		double s = 0;
		for(Books x : items) {
			s += x.getPromo_price() * x.getNumberInCart();
		}
		
		return Math.round(s * 100.0) / 100.0;
	}
	
	//return list of books in cart
	public List<Books> getItems(){
		return items;
	}
}
