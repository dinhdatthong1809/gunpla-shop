<%@ page import="entities.KhachHang"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gunpla Shop - Đăng Ký</title>
<link rel="stylesheet" type="text/css" href="css/dangnhap-dangky.css"/>
<link href="css/toastr.min.css" rel="stylesheet"/>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>
<script src="trang-admin/js/khachhang-quanly.js"></script>
<script src="js/toastr.min.js"></script>
<script src="js/tai-hinh.js"></script>
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
		<h2 class="inactive underlineHover"><a href="dangnhap-khachhang.jsp">Đăng nhập</a></h2>
		<h2 class="active">Đăng ký</h2>

		<!-- Signup Form -->
		<form id="dangKyForm" action="trang-admin/QuanLyKhachHangServlet" method="post" enctype="multipart/form-data">
			<div style="display: none" class="form-group row">
				<input name="yeuCau" class="form-control" type="text" value="them">
			</div>
			<div class="product-image-frame fadeIn third">
				<img id="product-image" src="img/no-image-found.jpg" height="300px" width="100%">
			</div>
			<input accept=".jpg" id="img-file" onchange="readURL(this);" title="Hình" style="display: none;" type="file" class="fadeIn third" name="txtHinh" placeholder="Hình">
			<input id="txtTenTaiKhoan" type="text" class="fadeIn third" name="txtTenTaiKhoan" placeholder="Tên tài khoản" value="">
			<input id="txtMatKhau" type="password" class="fadeIn third" name="txtMatKhau" placeholder="Mật khẩu" value="">
			<input id="txtHoTen" type="text" class="fadeIn third" name="txtHoTen" placeholder="Họ tên" value="">
			<br>
			<label class="radioContainer fadeIn third">Nam
				<span class="checkmark"></span>
				<input value="rdoGioiTinhNam" id="rdoGioiTinhNam" type="radio" checked="checked" name="rdoGioiTinh">
			</label>
			<label class="radioContainer fadeIn third">Nữ
				<span class="checkmark"></span>
				<input value="rdoGioiTinhNu" id="rdoGioiTinhNu" type="radio" name="rdoGioiTinh">
			</label>
			<input id="txtDiaChi" type="text" class="fadeIn third" name="txtDiaChi" placeholder="Địa chỉ" value="">
			<input id="txtNgaySinh" type="date" class="fadeIn third" name="txtNgaySinh" placeholder="Ngày sinh" value="">
			<input id="txtEmail" type="email" class="fadeIn third" name="txtEmail" placeholder="Email" value="">
			<input id="txtDienThoai" type="text" class="fadeIn third" name="txtDienThoai" placeholder="Điện thoại" value="">
			<br/>
			<br/>
			<input id="btnDangKy" type="submit" name="Action" class="fadeIn fourth" value="Đăng ký">
			<br>
		</form>
		
		<!-- Go Back -->
		<div id="formFooter">
			<a class="underlineHover" href="index.jsp">Quay lại trang chủ</a>
		</div>
	</div>
</div>
</body>
</html>