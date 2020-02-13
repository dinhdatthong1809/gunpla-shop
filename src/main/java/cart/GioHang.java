package cart;

import java.util.HashMap;

@SuppressWarnings("serial")
public class GioHang extends HashMap<Integer, MucGioHang> {

    public GioHang() {
	super();
    }

    /**
     * Thêm sản phẩm vào giỏ hàng
     */
    public void addSanPham(MucGioHang muc) {
	int maSanPham = muc.getSanPham().getMaSanPham();

	if (this.containsKey(maSanPham)) {
	    int soLuongHienTai = ((MucGioHang) this.get(maSanPham)).getSoLuong();
	    ((MucGioHang) this.get(maSanPham)).setSoLuong(soLuongHienTai + 1);
	} else {
	    this.put(muc.getSanPham().getMaSanPham(), muc);
	}
    }

    /**
     * Rút sản phẩm ra khỏi giỏ hàng
     */
    public boolean removeSanPham(int maSanPham) {
	if (this.containsKey(maSanPham)) {
	    this.remove(maSanPham);
	    return true;
	}
	return false;
    }

    /**
     * Tính tổng tiền của đơn hàng
     */
    public double getTongTien() {
	double tongTien = 0;

	for (MucGioHang muc : this.values()) {
	    tongTien += muc.getSanPham().getDonGia() * muc.getSoLuong();
	}

	return tongTien;
    }
}
