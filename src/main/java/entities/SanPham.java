package entities;

import java.io.Serializable;

public class SanPham implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 8053677594061384102L;
    private int maSanPham;
    private String tenSanPham;
    private double donGia;
    private int soLuong;
    private int maLoai = 1;
    private String hinh;
    private int luotThich = 0;

    public SanPham() {

    }

    public SanPham(int maSanPham, String tenSanPham, double donGia, int soLuong, int maLoai, String hinh, int luotThich) {
	super();
	this.maSanPham = maSanPham;
	this.tenSanPham = tenSanPham;
	this.donGia = donGia;
	this.soLuong = soLuong;
	this.maLoai = maLoai;
	this.hinh = hinh;
	this.luotThich = luotThich;

    }

    public int getMaSanPham() {
	return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
	this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
	return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
	this.tenSanPham = tenSanPham;
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

    public int getMaLoai() {
	return maLoai;
    }

    public void setMaLoai(int maLoai) {
	this.maLoai = maLoai;
    }

    public String getHinh() {
	return hinh;
    }

    public void setHinh(String hinh) {
	this.hinh = hinh;
    }

    public int getLuotThich() {
	return luotThich;
    }

    public void setLuotThich(int luotThich) {
	this.luotThich = luotThich;
    }
}
