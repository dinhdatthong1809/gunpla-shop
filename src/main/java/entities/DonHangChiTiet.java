package entities;

public class DonHangChiTiet {
    private int maDonHang;
    private int maSanPham;
    private double donGia;
    private int soLuong;

    public DonHangChiTiet() {

    }

    public DonHangChiTiet(int maDonHang, int maSanPham, double donGia, int soLuong) {
	super();
	this.maDonHang = maDonHang;
	this.maSanPham = maSanPham;
	this.donGia = donGia;
	this.soLuong = soLuong;
    }

    public int getMaDonHang() {
	return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
	this.maDonHang = maDonHang;
    }

    public int getMaSanPham() {
	return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
	this.maSanPham = maSanPham;
    }

    public double getDonGia() {
	return donGia;
    }

    public void setDonGia(double donGia) {
	this.donGia = donGia;
    }

    public int getSoLuong() {
	return soLuong;
    }

    public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
    }
}
