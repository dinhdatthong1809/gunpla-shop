package entities;

public class DonHangNgoaiChiTiet {
    private int maDonHangNgoai;
    private int maSanPham;
    private double donGia;
    private int soLuong;

    public DonHangNgoaiChiTiet() {

    }

    public DonHangNgoaiChiTiet(int maDonHangNgoai, int maSanPham, double donGia, int soLuong) {
	super();
	this.maDonHangNgoai = maDonHangNgoai;
	this.maSanPham = maSanPham;
	this.donGia = donGia;
	this.soLuong = soLuong;
    }

    public int getMaDonHangNgoai() {
	return maDonHangNgoai;
    }

    public void setMaDonHangNgoai(int maDonHangNgoai) {
	this.maDonHangNgoai = maDonHangNgoai;
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
