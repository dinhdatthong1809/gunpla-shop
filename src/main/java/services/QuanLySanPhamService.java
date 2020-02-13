package services;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.SanPhamDAO;
import entities.SanPham;
import helper.Response;
import helper.UploadHelper;

public class QuanLySanPhamService {
    /**
     * thêm sản phẩm
     */
    public static Response insert(HttpServletRequest request) {
	SanPham sp = getModelFromRequest(request);
	if (sp == null) {
	    return new Response("Có lỗi khi tải hình lên");
	}

	try {
	    new SanPhamDAO().update(sp);
	    return new Response("Thêm thành công", "index.jsp?route=sanpham-danhsach", true);
	} catch (Exception ex) {
	    return new Response("Thêm thất bại");
	}

    }

    /**
     * sửa sản phẩm
     */
    public static Response update(HttpServletRequest request) {
	SanPham sp = getModelFromRequest(request);
	if (sp == null) {
	    return new Response("Có lỗi khi tải hình lên");
	}

	try {
	    new SanPhamDAO().update(sp);
	    return new Response("Cập nhật thành công", "index.jsp?route=sanpham-danhsach", true);
	} catch (Exception ex) {
	    return new Response("Cập nhật thất bại");
	}
    }

    /**
     * xóa sản phẩm
     */
    public static Response delete(HttpServletRequest request) {
	try {
	    new SanPhamDAO().delete(request.getParameter("txtMaSanPham"));
	    return new Response("Xóa thành công", "index.jsp?route=sanpham-danhsach", true);
	} catch (Exception ex) {
	    return new Response("Xóa thất bại");
	}
    }

    /**
     * xóa nhiều sản phẩm
     */
    public static Response deleteMulti(HttpServletRequest request) {
	try {
	    String inputarray = request.getParameter("sanPhamDaChon");
	    if (inputarray.equals("[]")) {
		return new Response("Bạn chưa chọn mục nào", false);
	    }

	    ObjectMapper mapper = new ObjectMapper();

	    List<String> sanPhamDaChonList = Arrays.asList(mapper.readValue(inputarray, String[].class));

	    if (sanPhamDaChonList != null) {
		for (int i = 0; i < sanPhamDaChonList.size(); i++) {
		    new SanPhamDAO().delete(sanPhamDaChonList.get(i));
		}
	    }

	    return new Response("Xóa thành công", "index.jsp?route=sanpham-danhsach", true);
	} catch (Exception ex) {
	    return new Response("Xóa thất bại");
	}
    }

    /**
     * lấy thông tin khách hàng từ request
     */
    private static SanPham getModelFromRequest(HttpServletRequest request) {
	int maSanPham = 0;
	if (request.getParameter("yeuCau").equals("them")) {
	    maSanPham = new SanPhamDAO().insertReturnKey(new SanPham());
	} else {
	    maSanPham = Integer.parseInt(request.getParameter("txtMaSanPham"));
	}
	String tenSanPham = request.getParameter("txtTenSanPham");
	double donGia = Double.parseDouble(request.getParameter("txtDonGia"));
	int soLuong = Integer.parseInt(request.getParameter("txtSoLuong"));
	int maLoai = Integer.parseInt(request.getParameter("cboMaLoai"));
	int luotThich = Integer.parseInt(request.getParameter("txtLuotThich"));
	String tenHinh = null;

	// xử lý file hình 1 được tải lên
	try {
	    Part fileHinh = request.getPart("txtHinh");
	    tenHinh = fileHinh.getSubmittedFileName();
	    if (tenHinh.trim().equals("")) {
		SanPham sp = new SanPhamDAO().findById(maSanPham + "");
		tenHinh = sp.getHinh();
	    } else {
		tenHinh = maSanPham + ".jpg";
		String viTriLuuHinh = request.getServletContext().getRealPath("img/product-type/" + maLoai);
		boolean ketQuaTaiHinh = new UploadHelper().uploadFile(tenHinh, fileHinh, viTriLuuHinh);

		if (ketQuaTaiHinh == false) {
		    return null;
		}
	    }
	} catch (Exception ex) {
	    return null;
	}

	// xử lý file hình 2 được tải lên
	try {
	    Part fileHinh = request.getPart("txtHinh2");
	    String tenHinh2 = fileHinh.getSubmittedFileName();
	    if (tenHinh2.trim().equals("")) {

	    } else {
		String viTriLuuHinh = request.getServletContext().getRealPath("img/product-type/" + maLoai);
		tenHinh2 = tenHinh.replace(".jpg", "_prototype.jpg");
		boolean ketQuaTaiHinh = new UploadHelper().uploadFile(tenHinh2, fileHinh, viTriLuuHinh);

		if (ketQuaTaiHinh == false) {
		    return null;
		}
	    }
	} catch (Exception ex) {
	    return null;
	}

	// xử lý file hình 3 được tải lên
	try {
	    Part fileHinh = request.getPart("txtHinh3");
	    String tenHinh3 = fileHinh.getSubmittedFileName();
	    if (tenHinh3.trim().equals("")) {

	    } else {
		String viTriLuuHinh = request.getServletContext().getRealPath("img/product-type/" + maLoai);
		tenHinh3 = tenHinh.replace(".jpg", "_prototype2.jpg");
		boolean ketQuaTaiHinh = new UploadHelper().uploadFile(tenHinh3, fileHinh, viTriLuuHinh);

		if (ketQuaTaiHinh == false) {
		    return null;
		}
	    }
	} catch (Exception ex) {
	    return null;
	}

	return new SanPham(maSanPham, tenSanPham, donGia, soLuong, maLoai, tenHinh, luotThich);
    }
}
