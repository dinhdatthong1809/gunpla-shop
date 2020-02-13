<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entities.QuanTriVien"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>QTV Gunpla Shop - Đăng nhập</title>
<!--favicon-->
<link rel="icon" href="assets\images\favicon.ico" type="image/x-icon">
<!-- Bootstrap core CSS-->
<link href="assets\css\bootstrap.min.css" rel="stylesheet">
<!-- animate CSS-->
<link href="assets\css\animate.css" rel="stylesheet" type="text/css">
<!-- Icons CSS-->
<link href="assets\css\icons.css" rel="stylesheet" type="text/css">
<!-- Custom Style-->
<link href="assets\css\app-style.css" rel="stylesheet">
</head>
<body style="background-color: #212121">
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	QuanTriVien qtv = (QuanTriVien) session.getAttribute("taiKhoanQuanTriVien");
	
	// nếu đã đăng nhập thì quay về trang chủ
	if (qtv != null) {
		response.sendRedirect("index.jsp?route=main");
		return;
	}
%>

<!-- Start wrapper-->
<div class="dangNhapBackground" id="wrapper">
	<div class="card-authentication2 mx-auto my-5">
		<div class="card-group">
			<div class="card mb-0">
				<div class="bg-signin2"></div>
				<div class="card-img-overlay rounded-left my-5">
					<h2 class="text-white">Gunpla Shop</h2>
					<h1 class="text-white">Trang quản trị</h1>
					<p class="card-text text-white pt-3"></p>
				</div>
			</div>

			<div class="card mb-0 ">
				<div class="card-body">
					<div class="card-content p-3">
						<div class="text-center">
							<img src="../img/general/logo_1.png">
						</div>
						<div class="card-title text-uppercase text-center py-3">Đăng nhập</div>
						
						<form id="dangNhapForm" action="DangNhapQuanTriVienServlet" method="post">
							<div class="form-group">
								<div class="position-relative has-icon-left">
									<label for="exampleInputUsername" class="sr-only">Tên tài khoản</label>
									<input name="txtTenTaiKhoan" type="text" id="txtTenTaiKhoan" class="form-control" placeholder="Tên tài khoản">
									<div class="form-control-position">
										<i class="icon-user"></i>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="position-relative has-icon-left">
									<label for="exampleInputPassword" class="sr-only">Mật khẩu</label>
									<input name="txtMatKhau" type="password" id="txtMatKhau" class="form-control" placeholder="Mật khẩu">
									<div class="form-control-position">
										<i class="icon-lock"></i>
									</div>
								</div>
							</div>
							<div class="form-row mr-0 ml-0">
								<div class="form-group col-6">
									<div class="icheck-primary">
										<input type="checkbox" id="user-checkbox" checked="">
										<label for="user-checkbox">Ghi nhớ tài khoản</label>
									</div>
								</div>
							</div>
							<input id="btnDangNhap" onclick="checkLogin()" type="submit" class="btn btn-outline-primary btn-block waves-effect waves-light" value="Đăng nhập">
							<div class="text-center pt-3">
								<hr>
								<div id="thongBao" class="text-danger"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--Start Back To Top Button-->
	<a href="javaScript:void();" class="back-to-top">
		<i class="fa fa-angle-double-up"></i>
	</a>
	<!--End Back To Top Button-->
</div>
<!--wrapper-->

<!-- Bootstrap core JavaScript-->
<script src="assets\js\jquery.min.js"></script>
<script src="assets\js\popper.min.js"></script>
<script src="assets\js\bootstrap.min.js"></script>

<!-- Custom script -->
<script src="js/dangnhap-quantrivien.js"></script>
</body>
</html>