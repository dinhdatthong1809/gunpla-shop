package entities;

import java.util.Date;

import entities.more.Nguoi;

public class KhachHang extends Nguoi {
    private String tenTaiKhoan;
    private String matKhau;

    public KhachHang() {

    }

    public KhachHang(String tenTaiKhoan, String matKhau) {
	super();
	this.tenTaiKhoan = tenTaiKhoan;
	this.matKhau = matKhau;
    }

    public KhachHang(String tenTaiKhoan, String matKhau, String hoTen, boolean gioiTinh, String diaChi, Date ngaySinh, String email, String dienThoai, String hinh) {
	super(hoTen, gioiTinh, diaChi, ngaySinh, email, dienThoai, hinh);
	this.tenTaiKhoan = tenTaiKhoan;
	this.matKhau = matKhau;
    }

    public String getTenTaiKhoan() {
	return tenTaiKhoan;
    }

    public void setTenTaiKhoan(String tenTaiKhoan) {
	this.tenTaiKhoan = tenTaiKhoan;
    }

    public String getMatKhau() {
	return matKhau;
    }

    public void setMatKhau(String matKhau) {
	this.matKhau = matKhau;
    }
}
