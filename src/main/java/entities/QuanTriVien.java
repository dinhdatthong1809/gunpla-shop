package entities;

public class QuanTriVien {
    private String tenTaiKhoan;
    private String matKhau;
    private String hoTen;

    public QuanTriVien() {

    }

    public QuanTriVien(String tenTaiKhoan, String matKhau) {
	this.tenTaiKhoan = tenTaiKhoan;
	this.matKhau = matKhau;
    }

    public QuanTriVien(String tenTaiKhoan, String matKhau, String hoTen) {
	this.tenTaiKhoan = tenTaiKhoan;
	this.matKhau = matKhau;
	this.hoTen = hoTen;
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

    public String getHoTen() {
	return hoTen;
    }

    public void setHoTen(String hoTen) {
	this.hoTen = hoTen;
    }
}