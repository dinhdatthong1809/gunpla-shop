package services;

import dao.QuanTriVienDAO;
import entities.QuanTriVien;
import helper.Response;

public class DangNhapQuanTriVienService {
    public static Response login(String tenTaiKhoan, String matKhau) {
	QuanTriVien qtv = new QuanTriVienDAO().findById(tenTaiKhoan);

	// kiểm tra tên tài khoản có tồn tại không
	if (qtv == null) {
	    return new Response("Tên tài khoản không tồn tại");
	}
	// kiếm tra mật khẩu
	if (matKhau.equals(qtv.getMatKhau()) == false) {
	    return new Response("Sai mật khẩu");
	}

	return new Response("", "welcome.jsp", true, qtv);
    }
}
