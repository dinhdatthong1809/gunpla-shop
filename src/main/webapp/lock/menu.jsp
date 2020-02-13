<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.KhachHang"%>
<%@ page import="entities.LoaiSanPham"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.LoaiSanPhamDAO"%>
<%@ page import="dao.SanPhamDAO"%>
<%@ page import="helper.StringHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/dangnhap-khachhang.js"></script>

</head>
<body>
<!-- Code -->
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	// lấy tất cả hàng từ bảng LoaiSanPham
	ArrayList<LoaiSanPham> lspList;
	if (session.getAttribute("lspList") == null) {
		lspList = (ArrayList<LoaiSanPham>) new LoaiSanPhamDAO().select();
		session.setAttribute("lspList", lspList);
	} else {
		lspList = (ArrayList<LoaiSanPham>) session.getAttribute("lspList");
	}
%>
<c:set var="taiKhoanKhachHang" value="${sessionScope.taiKhoanKhachHang}"/>

<!-- Menu -->

<div class="menu">
	<!-- Search -->
	<div class="menu_search">
		<form action="#" id="menu_search_form" class="menu_search_form">
			<input type="text" class="search_input" placeholder="Search Item" required="required">
			<button class="menu_search_button"><img src="img/general/search.png" alt=""></button>
		</form>
	</div>
	<!-- Navigation -->
	<div class="menu_nav">
		<ul>
			<c:forEach var="lsp" items="<%=lspList%>">
				<li><a href="loaisanpham.jsp?maLoai=${lsp.maLoai}&soTrang=1">${lsp.tenLoai}</a></li>
			</c:forEach>
			<br/>
			<c:if test="${taiKhoanKhachHang == null}">
				<li><a href="dangnhap-khachhang.jsp">Đăng nhập</a></li>
				<li><a href="dangky-khachhang.jsp">Đăng ký</a></li>
			</c:if>
			<c:if test="${taiKhoanKhachHang != null}">
				<li><a href="khachhang-trangcanhan.jsp">Trang cá nhân</a></li>
				<br/>
				<li><a href="#" onclick="logout()">Đăng xuất</a></li>
			</c:if>
		</ul>
	</div>
	<!-- Contact Info -->
	<div class="menu_contact">
		<div class="menu_phone d-flex flex-row align-items-center justify-content-start">
			<div><div><img src="img/general/phone.svg" alt="https://www.flaticon.com/authors/freepik"></div></div>
			<div>+1 912-252-7350</div>
		</div>
		<div class="menu_social">
			<ul class="menu_social_list d-flex flex-row align-items-start justify-content-start">
				<li><a href="https://www.facebook.com/Gunpla-Shop-697755490669916/"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>