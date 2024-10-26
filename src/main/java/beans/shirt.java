package beans;

public class shirt {
	int id;
	String ten;
	String link;
	String mota;
	int gia;
	String Loai;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getLoai() {
		return Loai;
	}
	public void setLoai(String loai) {
		Loai = loai;
	}
	public shirt(int id, String ten, String link, String mota, int gia, String loai) {
		this.id = id;
		this.ten = ten;
		this.link = link;
		this.mota = mota;
		this.gia = gia;
		Loai = loai;
	}
	
}
