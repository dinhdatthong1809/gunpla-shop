package entities;

import java.io.Serializable;

public class LoaiSanPham implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 4802730153024186405L;
    private int maLoai;
    private String tenLoai;

    public LoaiSanPham() {

    }

    public LoaiSanPham(int maLoai, String tenLoai) {
	super();
	this.maLoai = maLoai;
	this.tenLoai = tenLoai;
    }

    public int getMaLoai() {
	return maLoai;
    }

    public void setMaLoai(int maLoai) {
	this.maLoai = maLoai;
    }

    public String getTenLoai() {
	return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
	this.tenLoai = tenLoai;
    }
}
