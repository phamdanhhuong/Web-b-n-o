package beans;

public class cart {
	int id;
	int uid;
	int shirtId;
	int quantity;
	String size;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getShirtId() {
		return shirtId;
	}
	public void setShirtId(int shirtId) {
		this.shirtId = shirtId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public cart(int id, int uid, int shirtId, int quantity, String size) {
		this.id = id;
		this.uid = uid;
		this.shirtId = shirtId;
		this.quantity = quantity;
		this.size = size;
	}
	
}
