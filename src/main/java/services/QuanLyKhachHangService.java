package services;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.KhachHangDAO;
import entities.KhachHang;
import helper.DateHelper;
import helper.Response;
import helper.UploadHelper;

public class QuanLyKhachHangService {
    /**
     * thêm khách hàng
     */
    public static Response insert(HttpServletRequest request) {
	KhachHang kh = getModelFromRequest(request);
	if (kh == null) {
	    return new Response("Có lỗi khi tải hình lên");
	}

	try {
	    new KhachHangDAO().insert(kh);
	    return new Response("Thêm thành công", "index.jsp?route=khachhang-danhsach", true);
	} catch (Exception ex) {
	    return new Response("Thêm thất bại");
	}

    }

    /**
     * sửa khách hàng
     */
    public static Response update(HttpServletRequest request) {
	KhachHang kh = getModelFromRequest(request);
	if (kh == null) {
	    return new Response("Có lỗi khi tải hình lên");
	}

	try {
	    new KhachHangDAO().update(kh);
	    return new Response("Cập nhật thành công", "index.jsp?route=khachhang-danhsach", true);
	} catch (Exception ex) {
	    return new Response("Cập nhật thất bại");
	}
    }

    /**
     * xóa khách hàng
     */
    public static Response delete(HttpServletRequest request) {
	try {
	    new KhachHangDAO().delete(request.getParameter("txtTenTaiKhoan"));
	    return new Response("Xóa thành công", "index.jsp?route=khachhang-danhsach", true);
	} catch (Exception ex) {
	    return new Response("Xóa thất bại");
	}
    }

    /**
     * xóa nhiều khách hàng
     */
    public static Response deleteMulti(HttpServletRequest request) {
	try {
	    String inputarray = request.getParameter("khachHangDaChon");
	    if (inputarray.equals("[]")) {
		return new Response("Bạn chưa chọn mục nào", false);
	    }

	    ObjectMapper mapper = new ObjectMapper();

	    List<String> khachHangDaChonList = Arrays.asList(mapper.readValue(inputarray, String[].class));

	    if (khachHangDaChonList != null) {
		for (int i = 0; i < khachHangDaChonList.size(); i++) {
		    new KhachHangDAO().delete(khachHangDaChonList.get(i));
		}
	    }

	    return new Response("Xóa thành công", "index.jsp?route=khachhang-danhsach", true);
	} catch (Exception ex) {
	    return new Response("Xóa thất bại");
	}

    }

    /**
     * lấy thông tin khách hàng từ request
     */
    private static KhachHang getModelFromRequest(HttpServletRequest request) {
	String tenTaiKhoan = request.getParameter("txtTenTaiKhoan");
	String matKhau = request.getParameter("txtMatKhau");
	String hoTen = request.getParameter("txtHoTen");
	boolean gioiTinh;
	if (request.getParameter("rdoGioiTinh").equals("rdoGioiTinhNam")) {
	    gioiTinh = true;
	} else {
	    gioiTinh = false;
	}
	String diaChi = request.getParameter("txtDiaChi");
	Date ngaySinh = DateHelper.StringToDate(request.getParameter("txtNgaySinh").replaceAll("-", "/"));
	String email = request.getParameter("txtEmail");
	String dienThoai = request.getParameter("txtDienThoai");
	String tenHinh = null;

	// xử lý file hình được tải lên
	try {
	    Part fileHinh = request.getPart("txtHinh");
	    tenHinh = fileHinh.getSubmittedFileName();
	    if (tenHinh.trim().equals("")) {
		KhachHang kh = new KhachHangDAO().findById(tenTaiKhoan);
		tenHinh = kh.getHinh();
	    } else {
		tenHinh = tenTaiKhoan + ".jpg";
		String viTriLuuHinh = request.getServletContext().getRealPath("img/user-avatar");
		boolean ketQuaTaiHinh = new UploadHelper().uploadFile(tenHinh, fileHinh, viTriLuuHinh);

		if (ketQuaTaiHinh == false) {
		    return null;
		}
	    }
	} catch (Exception ex) {
	    return null;
	}

	return new KhachHang(tenTaiKhoan, matKhau, hoTen, gioiTinh, diaChi, ngaySinh, email, dienThoai, tenHinh);
    }
}
