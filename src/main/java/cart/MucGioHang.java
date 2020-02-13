package cart;

import java.io.Serializable;

import entities.SanPham;

@SuppressWarnings("serial")
public class MucGioHang implements Serializable {
    private SanPham sanPham;
    private int soLuong;

    public MucGioHang() {

    }

    public MucGioHang(SanPham sanPham) {
	this.sanPham = sanPham;
	this.soLuong = 1;
    }

    public MucGioHang(SanPham sanPham, int soLuong) {
	this.sanPham = sanPham;
	this.soLuong = soLuong;
    }

    public SanPham getSanPham() {
	return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
	this.sanPham = sanPham;
    }

    public int getSoLuong() {
	return soLuong;
    }

    public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
    }
}
