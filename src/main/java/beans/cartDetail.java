package beans;

public class cartDetail {
	cart cart;
	shirt shirt;
	public cart getCart() {
		return cart;
	}
	public void setCart(cart cart) {
		this.cart = cart;
	}
	public shirt getShirt() {
		return shirt;
	}
	public void setShirt(shirt shirt) {
		this.shirt = shirt;
	}
	public cartDetail(beans.cart cart, beans.shirt shirt) {
		this.cart = cart;
		this.shirt = shirt;
	}
	
}
