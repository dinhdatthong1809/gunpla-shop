package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import cart.GioHang;
import cart.MucGioHang;
import dao.SanPhamDAO;
import entities.SanPham;
import helper.Response;

/**
 * Servlet implementation class GioHangServlet
 */
@WebServlet("/GioHangServlet")
public class GioHangServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GioHangServlet() {
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession(true);
	session.setMaxInactiveInterval(2700);
	try {
	    String action = request.getParameter("action");
	    if (action.equals("ThemMuc")) {
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
		    // lấy giỏ hàng từ session, nếu trên session chưa tồn tại thì tạo giỏ hàng mới
		    GioHang gioHang = (GioHang) session.getAttribute("gioHang");
		    if (gioHang == null) {
			gioHang = new GioHang();
		    }

		    // lấy sản phẩm được mua dựa trên mã sản phẩm
		    String maSanPham = request.getParameter("maSanPham");
		    SanPham sp = new SanPhamDAO().findById(maSanPham);

		    // tạo mục và thêm mục vào giỏ hàng
		    MucGioHang muc = new MucGioHang(sp);
		    gioHang.addSanPham(muc);

		    // lưu giỏ hàng vào session
		    session.setAttribute("gioHang", gioHang);

		    // trả về dữ liệu json báo thành công
		    Response res = new Response("Đã thêm vào giỏ hàng", true, gioHang.size());
		    JSONObject jsonData = new JSONObject(res);
		    out.println(jsonData);
		} catch (Exception ex) {
		    // trả về dữ liệu json báo thất bại
		    Response res = new Response("Thêm vào giỏ hàng thất bại", false);
		    JSONObject jsonData = new JSONObject(res);
		    out.println(jsonData);
		} finally {
		    out.close();
		}
	    } else if (action.equals("XoaTatCaMuc")) {
		session = request.getSession(true);
		session.setAttribute("gioHang", null);
	    } else if (action.equals("XoaMucDaChon")) {
		String inputarray = request.getParameter("sanPhamDaChon");
		ObjectMapper mapper = new ObjectMapper();

		List<Integer> sanPhamDaChonList = Arrays.asList(mapper.readValue(inputarray, Integer[].class));

		if (sanPhamDaChonList != null) {
		    session = request.getSession();
		    if (session != null) {
			GioHang gioHang = (GioHang) session.getAttribute("gioHang");
			if (gioHang != null) {
			    for (int i = 0; i < sanPhamDaChonList.size(); i++) {
				gioHang.removeSanPham(sanPhamDaChonList.get(i));
			    }
			    session.setAttribute("gioHang", gioHang);
			}
		    }
		}
	    }
	} catch (Exception ex) {
	    ex.printStackTrace();
	} finally {

	}
    }

}
