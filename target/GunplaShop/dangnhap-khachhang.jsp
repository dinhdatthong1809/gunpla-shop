<%@ page import="entities.KhachHang"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gunpla Shop - Đăng nhập</title>
<link rel="stylesheet" type="text/css" href="css/dangnhap-dangky.css"/>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/dangnhap-khachhang.js"></script>
<%@ include file="lock/css-links.html"%>

</head>
<body>
<!-- Code -->
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	
	KhachHang kh = (KhachHang) session.getAttribute("taiKhoanKhachHang");
	
	if (kh != null) {
		response.sendRedirect("index.jsp");
		return;
	}
%>

<div class="wrapper fadeInDown">
	<div id="formContent">
		<!-- Tabs Titles -->
		<h2 class="active">Đăng nhập</h2>
		<h2 class="inactive underlineHover"><a href="dangky-khachhang.jsp">Đăng ký</a></h2>

		<!-- Signin Form -->
		<form id="dangNhapForm" action="DangNhapKhachHangServlet" method="post">
			<input id="txtUsername" type="text" class="fadeIn second" name="txtUsername" placeholder="Tên tài khoản" value="">
			<input id="txtPassword" type="password" class="fadeIn third" name="txtPassword" placeholder="Mật khẩu" value="">
			<br/>
			<br/>
			<input id="btnDangNhap" onclick="checkLogin()" type="submit" name="Action" class="fadeIn fourth" value="Đăng nhập">
			<div id="thongBao" class="text-danger"> </div>
			<br>
		</form>
		
		<!-- Remind Password -->
		<div id="formFooter">
			<a class="underlineHover" href="#">Quên mật khẩu?</a>
			<br>
			<br>
			<a class="underlineHover" href="index.jsp">Quay lại trang chủ</a>
		</div>
	</div>
</div>
</body>
</html>