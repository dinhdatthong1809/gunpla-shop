package services;

import dao.KhachHangDAO;
import entities.KhachHang;
import helper.Response;

public class DangNhapKhachHangService {
    public static Response service(String tenTaiKhoan, String matKhau) {
	KhachHang kh = new KhachHangDAO().findById(tenTaiKhoan);

	// kiểm tra tên tài khoản có tồn tại không
	if (kh == null) {
	    return new Response("Tên tài khoản không tồn tại");
	}
	// kiếm tra mật khẩu
	if (matKhau.equals(kh.getMatKhau()) == false) {
	    return new Response("Sai mật khẩu");
	}

	return new Response("", "index.jsp", true, kh);
    }
}
