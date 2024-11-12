package beans;

public class shirt {
	int id;
	String ten;
	String link;
	String mota;
	int gia;
	String loai;
	String thuongHieu;
	String xuatXu;
	String chatLieu;
	String mau;
	int tonKho;
	public String getThuongHieu() {
		return thuongHieu;
	}
	public void setThuongHieu(String thuongHieu) {
		this.thuongHieu = thuongHieu;
	}
	public String getXuatXu() {
		return xuatXu;
	}
	public void setXuatXu(String xuatXu) {
		this.xuatXu = xuatXu;
	}
	public String getChatLieu() {
		return chatLieu;
	}
	public void setChatLieu(String chatLieu) {
		this.chatLieu = chatLieu;
	}
	public String getMau() {
		return mau;
	}
	public void setMau(String mau) {
		this.mau = mau;
	}
	public int getTonKho() {
		return tonKho;
	}
	public void setTonKho(int tonKho) {
		this.tonKho = tonKho;
	}
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
		return loai;
	}
	public void setLoai(String loai) {
		this.loai = loai;
	}
	public shirt(int id, String ten, String link, String mota, int gia, String loai, String thuongHieu,String xuatXu,String chatLieu, String mau,int tonKho) {
		this.id = id;
		this.ten = ten;
		this.link = link;
		this.mota = mota;
		this.gia = gia;
		this.loai = loai;
		this.thuongHieu = thuongHieu;
		this.xuatXu = xuatXu;
		this.chatLieu = chatLieu;
		this.mau = mau;
		this.tonKho = tonKho;
	}
	
}
