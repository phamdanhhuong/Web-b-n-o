package beans;

import java.sql.Date;
import java.util.List;

public class hoaDon {
	int id;
	int userId;
	int tongTien;
	Date ngayThanhToan;
	String phuongThuc;
	String diaChi;
	List<chiTietHoaDon> listDetail;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getTongTien() {
		return tongTien;
	}
	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}
	public Date getNgayThanhToan() {
		return ngayThanhToan;
	}
	public void setNgayThanhToan(Date ngayThanhToan) {
		this.ngayThanhToan = ngayThanhToan;
	}
	public String getPhuongThuc() {
		return phuongThuc;
	}
	public void setPhuongThuc(String phuongThuc) {
		this.phuongThuc = phuongThuc;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public List<chiTietHoaDon> getListDetail() {
		return listDetail;
	}
	public void setListDetail(List<chiTietHoaDon> listDetail) {
		this.listDetail = listDetail;
	}
	public hoaDon(int id, int userId, int tongTien, Date ngayThanhToan, String phuongThuc, String diaChi,
			List<chiTietHoaDon> listDetail) {
		this.id = id;
		this.userId = userId;
		this.tongTien = tongTien;
		this.ngayThanhToan = ngayThanhToan;
		this.phuongThuc = phuongThuc;
		this.diaChi = diaChi;
		this.listDetail = listDetail;
	}
	
}
