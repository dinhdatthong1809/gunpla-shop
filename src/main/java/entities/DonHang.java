package entities;

import java.util.Date;

public class DonHang {
    private int maDonHang;
    private Date ngayDatHang;
    private String tenTaiKhoanKhachHang;

    public DonHang() {

    }

    public DonHang(Date ngayDatHang, String tenTaiKhoanKhachHang) {
	super();
	this.ngayDatHang = ngayDatHang;
	this.tenTaiKhoanKhachHang = tenTaiKhoanKhachHang;
    }

    public DonHang(int maDonHang, Date ngayDatHang, String tenTaiKhoanKhachHang) {
	super();
	this.maDonHang = maDonHang;
	this.ngayDatHang = ngayDatHang;
	this.tenTaiKhoanKhachHang = tenTaiKhoanKhachHang;
    }

    public int getMaDonHang() {
	return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
	this.maDonHang = maDonHang;
    }

    public Date getNgayDatHang() {
	return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
	this.ngayDatHang = ngayDatHang;
    }

    public String getTenTaiKhoanKhachHang() {
	return tenTaiKhoanKhachHang;
    }

    public void setTenTaiKhoanKhachHang(String tenTaiKhoanKhachHang) {
	this.tenTaiKhoanKhachHang = tenTaiKhoanKhachHang;
    }
}
