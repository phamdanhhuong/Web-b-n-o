package beans;

public class chiTietHoaDon {
	int id;
	int idHoaDon;
	int idShirt;
	int quantity;
	String size;
	int gia;
	shirt shirt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdHoaDon() {
		return idHoaDon;
	}
	public void setIdHoaDon(int idHoaDon) {
		this.idHoaDon = idHoaDon;
	}
	public int getIdShirt() {
		return idShirt;
	}
	public void setIdShirt(int idShirt) {
		this.idShirt = idShirt;
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
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public shirt getShirt() {
		return shirt;
	}
	public void setShirt(shirt shirt) {
		this.shirt = shirt;
	}
	public chiTietHoaDon(int id, int idHoaDon, int idShirt, int quantity, String size, int gia, beans.shirt shirt) {
		this.id = id;
		this.idHoaDon = idHoaDon;
		this.idShirt = idShirt;
		this.quantity = quantity;
		this.size = size;
		this.gia = gia;
		this.shirt = shirt;
	}
	
	
}
