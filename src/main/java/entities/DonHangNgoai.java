package entities;

import java.util.Date;

public class DonHangNgoai {
    private int maDonHangNgoai;
    private String tenKhachHangNgoai;
    private boolean gioiTinh;
    private String diaChi;
    private String email;
    private String dienThoai;
    private Date ngayDatHang;

    public DonHangNgoai() {

    }

    public DonHangNgoai(String tenKhachHangNgoai, boolean gioiTinh, String diaChi, String email, String dienThoai, Date ngayDatHang) {
	super();
	this.tenKhachHangNgoai = tenKhachHangNgoai;
	this.gioiTinh = gioiTinh;
	this.diaChi = diaChi;
	this.email = email;
	this.dienThoai = dienThoai;
	this.ngayDatHang = ngayDatHang;
    }

    public DonHangNgoai(int maDonHangNgoai, String tenKhachHangNgoai, boolean gioiTinh, String diaChi, String email, String dienThoai, Date ngayDatHang) {
	super();
	this.maDonHangNgoai = maDonHangNgoai;
	this.tenKhachHangNgoai = tenKhachHangNgoai;
	this.gioiTinh = gioiTinh;
	this.diaChi = diaChi;
	this.email = email;
	this.dienThoai = dienThoai;
	this.ngayDatHang = ngayDatHang;
    }

    public int getMaDonHangNgoai() {
	return maDonHangNgoai;
    }

    public void setMaDonHangNgoai(int maDonHangNgoai) {
	this.maDonHangNgoai = maDonHangNgoai;
    }

    public String getTenKhachHangNgoai() {
	return tenKhachHangNgoai;
    }

    public void setTenKhachHangNgoai(String tenKhachHangNgoai) {
	this.tenKhachHangNgoai = tenKhachHangNgoai;
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

    public Date getNgayDatHang() {
	return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
	this.ngayDatHang = ngayDatHang;
    }
}
