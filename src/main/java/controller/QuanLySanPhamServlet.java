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
import services.QuanLySanPhamService;

/**
 * Servlet implementation class SanPhamServlet
 */
@WebServlet("/trang-admin/QuanLySanPhamServlet")
@MultipartConfig
public class QuanLySanPhamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLySanPhamServlet() {
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
	    res = QuanLySanPhamService.insert(request);
	} else if (yeuCau.equals("capNhat")) {
	    res = QuanLySanPhamService.update(request);
	} else if (yeuCau.equals("xoa")) {
	    res = QuanLySanPhamService.delete(request);
	} else if (yeuCau.equals("xoaMucDaChon")) {
	    res = QuanLySanPhamService.deleteMulti(request);
	}

	JSONObject jsonData = new JSONObject(res);
	out.println(jsonData);
    }
}
