package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import helper.Response;
import services.QuanLyKhachHangService;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/trang-admin/QuanLyKhachHangServlet")
@MultipartConfig
public class QuanLyKhachHangServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyKhachHangServlet() {
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
	request.setCharacterEncoding("UTF-8");
	PrintWriter out = response.getWriter();

	String yeuCau = request.getParameter("yeuCau");
	Response res = null;

	if (yeuCau.equals("them")) {
	    res = QuanLyKhachHangService.insert(request);
	} else if (yeuCau.equals("capNhat")) {
	    res = QuanLyKhachHangService.update(request);
	} else if (yeuCau.equals("xoa")) {
	    res = QuanLyKhachHangService.delete(request);
	} else if (yeuCau.equals("xoaMucDaChon")) {
	    res = QuanLyKhachHangService.deleteMulti(request);
	}

	JSONObject jsonData = new JSONObject(res);
	out.println(jsonData);
    }
}
