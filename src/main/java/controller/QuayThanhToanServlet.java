package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;

import cart.GioHang;
import cart.MucGioHang;
import dao.DonHangChiTietDAO;
import dao.DonHangDAO;
import dao.DonHangNgoaiChiTietDAO;
import dao.DonHangNgoaiDAO;
import entities.DonHang;
import entities.DonHangChiTiet;
import entities.DonHangNgoai;
import entities.DonHangNgoaiChiTiet;
import entities.KhachHang;
import entities.SanPham;
import helper.DateHelper;
import helper.Response;
import helper.email.Email;
import helper.email.EmailSender;
import helper.email.Sender;

/**
 * Servlet implementation class QuayThanhToanServlet
 */
@WebServlet("/QuayThanhToanServlet")
public class QuayThanhToanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static final String ACCOUNT_SID = "AC40557e610c3f7af9d55db481c792d1b6";
    public static final String AUTH_TOKEN = "ee7a315ea6f8b837e349cbddc4ae4250";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuayThanhToanServlet() {
	super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("application/json; charset=UTF-8");

	PrintWriter out = response.getWriter();

	// Chức năng nhắn tin điện thoại
	Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

	// nếu chưa đăng nhập
	if (session.getAttribute("taiKhoanKhachHang") == null) {
	    try {
		// lấy thông tin
		String hoTen = request.getParameter("hoTen");
		boolean gioiTinh;
		if (request.getParameter("gioiTinh").equals("true")) {
		    gioiTinh = true;
		} else {
		    gioiTinh = false;
		}
		String diaChi = request.getParameter("diaChi");
		String email = request.getParameter("email");
		String dienThoai = request.getParameter("dienThoai");

		// tạo đơn hàng ngoài (đơn hàng dành cho người dùng không có tài khoản đăng
		// nhập) và insert vào database
		// rồi insert từng mục trong giỏ hàng vào bảng đơn hàng ngoài chi tiết
		DonHangNgoai dhn = new DonHangNgoai(hoTen, gioiTinh, diaChi, email, dienThoai, DateHelper.now());
		int maDonHangVuaTao = new DonHangNgoaiDAO().insert(dhn);
		GioHang gioHang = (GioHang) session.getAttribute("gioHang");
		for (MucGioHang muc : gioHang.values()) {
		    SanPham sp = muc.getSanPham();
		    DonHangNgoaiChiTiet dhnct = new DonHangNgoaiChiTiet(maDonHangVuaTao, sp.getMaSanPham(), sp.getDonGia(), muc.getSoLuong());
		    new DonHangNgoaiChiTietDAO().insert(dhnct);
		}

		// gửi email thông báo cho người dùng mã đơn hàng
		String tieuDe = "[Gunpla-Shop] Thông báo";
		String noiDung = "Cửa hàng Gunpla trân trọng cảm ơn bạn " + hoTen + " đã đặt hàng. Mã đơn hàng của bạn là <b><font color=red>" + maDonHangVuaTao + "</font></b>";
		Sender nguoiGui = new Sender();
		Email emailObject = new Email(tieuDe, noiDung);
		EmailSender.sendEmail(nguoiGui, emailObject, email);

		// gửi tin nhắn điện thoại thông báo cho người dùng mã đơn hàng
		Message.creator(new com.twilio.type.PhoneNumber(changeFormPhoneNumber(dienThoai)), // to
			new com.twilio.type.PhoneNumber("+18583485813"), // from
			"Gunpla Shop. Ma don hang cua ban la DH" + maDonHangVuaTao).create();

		// xóa giỏ hàng
		session.setAttribute("gioHang", null);

		// trả về dữ liệu json báo thành công
		Response res = new Response("Thanh toán thành công, bạn hãy kiểm tra tin nhắn email và điện thoại", true);
		JSONObject jsonData = new JSONObject(res);
		out.println(jsonData);
	    } catch (Exception ex) {
		// trả về dữ liệu json báo thất bại
		Response res = new Response("Thanh toán thất bại, đã xảy ra lỗi trong quá trình thanh toán", false);
		JSONObject jsonData = new JSONObject(res);
		out.println(jsonData);
		ex.printStackTrace();
	    } finally {
		out.close();
	    }
	}
	// nếu đã đăng nhập rồi
	else {
	    try {
		// lấy thông tin
		KhachHang kh = (KhachHang) session.getAttribute("taiKhoanKhachHang");

		// tạo đơn hàng ngoài (đơn hàng dành cho người dùng không có tài khoản đăng
		// nhập) và insert vào database
		// rồi insert từng mục trong giỏ hàng vào bảng đơn hàng ngoài chi tiết
		DonHang dh = new DonHang(DateHelper.now(), kh.getTenTaiKhoan());
		int maDonHangVuaTao = new DonHangDAO().insert(dh);

		GioHang gioHang = (GioHang) session.getAttribute("gioHang");

		for (MucGioHang muc : gioHang.values()) {
		    SanPham sp = muc.getSanPham();
		    DonHangChiTiet dhct = new DonHangChiTiet(maDonHangVuaTao, sp.getMaSanPham(), sp.getDonGia(), muc.getSoLuong());
		    new DonHangChiTietDAO().insert(dhct);
		}

		// gửi email thông báo cho người dùng mã đơn hàng
		String tieuDe = "[Gunpla-Shop] Thông báo";
		String noiDung = "Cửa hàng Gunpla trân trọng cảm ơn bạn " + kh.getHoTen() + " đã đặt hàng. Mã đơn hàng của bạn là <b><font color=red>" + maDonHangVuaTao + "</font></b>";
		Sender nguoiGui = new Sender();
		Email emailObject = new Email(tieuDe, noiDung);
		EmailSender.sendEmail(nguoiGui, emailObject, kh.getEmail());

		// gửi tin nhắn điện thoại thông báo cho người dùng mã đơn hàng
		Message.creator(new com.twilio.type.PhoneNumber(changeFormPhoneNumber(kh.getDienThoai())), // to
			new com.twilio.type.PhoneNumber("+18583485813"), // from
			"Gunpla Shop. Ma don hang cua ban la DH" + maDonHangVuaTao).create();

		// xóa giỏ hàng
		session.setAttribute("gioHang", null);

		// trả về dữ liệu json báo thành công
		Response res = new Response("Thanh toán thành công, bạn hãy kiểm tra tin nhắn email và điện thoại", true);
		JSONObject jsonData = new JSONObject(res);
		out.println(jsonData);
	    } catch (com.twilio.exception.ApiException exApi) {
		// trả về dữ liệu json báo thất bại
		Response res = new Response("Số điện thoại của bạn chưa được xác thực", false);
		JSONObject jsonData = new JSONObject(res);
		out.println(jsonData);
		exApi.printStackTrace();
	    } catch (Exception ex) {
		// trả về dữ liệu json báo thất bại
		Response res = new Response("Thanh toán thất bại, đã xảy ra lỗi trong quá trình thanh toán", false);
		JSONObject jsonData = new JSONObject(res);
		out.println(jsonData);
		ex.printStackTrace();
	    }

	    finally {
		out.close();
	    }
	}
    }

    private String changeFormPhoneNumber(String str) {
	String strAppend = str.substring(1, str.length());
	str = "+84" + strAppend;
	return str;
    }
}
