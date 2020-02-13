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

import entities.KhachHang;
import helper.Response;
import services.DangNhapKhachHangService;

/**
 * Servlet implementation class AccountCustomerServlet
 */
@WebServlet("/DangaNhapKhachHangServlet")
public class DangNhapKhachHangServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapKhachHangServlet() {
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
	response.setContentType("application/json; charset=UTF-8");
	PrintWriter out = response.getWriter();

	HttpSession session = request.getSession();

	Response res = DangNhapKhachHangService.service(request.getParameter("tenTaiKhoan"), request.getParameter("matKhau"));
	if (res.isThanhCong()) {
	    session.setAttribute("taiKhoanKhachHang", (KhachHang) res.getObj());
	}

	// trả về dữ liệu json báo thành công
	JSONObject jsonData = new JSONObject(res);
	out.println(jsonData);
    }
}
