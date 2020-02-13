package entities.more;

import java.util.Date;

public class Nguoi {
    private String hoTen;
    private boolean gioiTinh;
    private String diaChi;
    private Date ngaySinh;
    private String email;
    private String dienThoai;
    private String hinh;

    public Nguoi() {

    }

    public Nguoi(String hoTen, boolean gioiTinh, String diaChi, Date ngaySinh, String email, String dienThoai, String hinh) {
	super();
	this.hoTen = hoTen;
	this.gioiTinh = gioiTinh;
	this.diaChi = diaChi;
	this.ngaySinh = ngaySinh;
	this.email = email;
	this.dienThoai = dienThoai;
	this.hinh = hinh;
    }

    public String getHoTen() {
	return hoTen;
    }

    public void setHoTen(String hoTen) {
	this.hoTen = hoTen;
    }

    public boolean isGioiTinh() {
	return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
	this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
	return diaChi;
    }

    public void setDiaChi(String diaChi) {
	this.diaChi = diaChi;
    }

    public Date getNgaySinh() {
	return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
	this.ngaySinh = ngaySinh;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getDienThoai() {
	return dienThoai;
    }

    public void setDienThoai(String dienThoai) {
	this.dienThoai = dienThoai;
    }

    public String getHinh() {
	return hinh;
    }

    public void setHinh(String hinh) {
	this.hinh = hinh;
    }
}
