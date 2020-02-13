<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.LoaiSanPham"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.LoaiSanPhamDAO"%>
<%@ page import="dao.SanPhamDAO"%>
<%@ page import="helper.StringHelper"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gunpla Shop - Trang cá nhân</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/profile.css">
<link rel="stylesheet" type="text/css" href="styles/checkout_responsive.css">
<%@ include file="lock/css-links.html"%>
</head>
<body>
<!-- Code -->
<%
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	
	if (session.getAttribute("taiKhoanKhachHang") == null) {
		response.sendRedirect("dangnhap-khachhang.jsp");
	}
%>

<!-- Menu -->
<%@ include file="lock/menu.jsp"%>

<div class="super_container">

	<!-- Header -->
	<%@ include file="lock/header.jsp"%>
	
	<div class="super_container_inner">
		<div class="super_overlay"></div>

		<!-- Home -->
		
		<div class="home">
			<div class="home_container d-flex flex-column align-items-center justify-content-end">
				<div class="home_content text-center">
					<div class="home_title">Trang cá nhân</div>
					<div class="breadcrumbs d-flex flex-column align-items-center justify-content-center">
						<ul class="d-flex flex-row align-items-start justify-content-start text-center">
							<li><a href="index.jsp">Trang chủ</a></li>
							<li><a href="#">Trang cá nhân</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="checkout">
			<div class="container">
				<div class="row">
					
					<!-- Billing -->
					<div class="col-lg-6">
						<div class="billing">
							<div class="checkout_title">Thông tin của bạn</div>
							<div class="checkout_form_container">
								<form action="#" id="checkout_form" class="checkout_form">
									<div>
										<!-- Name -->
										<c:if test="${taiKhoanKhachHang == null}">
											<input type="text" id="checkout_name" class="checkout_input" placeholder="Tên" required="required">
										</c:if>
										
										<c:if test="${taiKhoanKhachHang != null}">
											<input readonly type="text" id="checkout_name" class="checkout_input" placeholder="Tên" required="required" 
												value="${taiKhoanKhachHang.hoTen}">
										</c:if>
									</div>
									<div class="row">
										<!-- Gender -->
										<c:if test="${taiKhoanKhachHang == null}">
											<div class="col-lg-6">
												<label class="radio_container">
													<input checked type="radio" id="radio_1" name="payment_radio" class="payment_radio">
													<span class="radio_mark"></span>
													<span class="radio_text">Nam</span>
												</label>
											</div>
											<div class="col-lg-6">
												<label class="radio_container">
													<input type="radio" id="radio_2" name="payment_radio" class="payment_radio">
													<span class="radio_mark"></span>
													<span class="radio_text">Nữ</span>
												</label>
											</div>
										</c:if>
										
										<c:if test="${taiKhoanKhachHang != null}">
											<div class="col-lg-6">
												<label class="radio_container">
													<input checked type="radio" id="radio_${taiKhoanKhachHang.gioiTinh == true ? '1' : '2'}" name="payment_radio" class="payment_radio">
													<span class="radio_mark"></span>
													<span class="radio_text">${taiKhoanKhachHang.gioiTinh == true ? 'Nam' : 'Nữ'}</span>
												</label>
											</div>
										</c:if>
									</div>
									<div>
										<!-- Address -->
										<c:if test="${taiKhoanKhachHang == null}">
											<input type="text" id="checkout_address" class="checkout_input" placeholder="Địa chỉ" required="required">
										</c:if>
										<c:if test="${taiKhoanKhachHang != null}">
											<input readonly type="text" id="checkout_address" class="checkout_input" placeholder="Địa chỉ" required="required"
												value="${taiKhoanKhachHang.diaChi}">
										</c:if>
									</div>
									<div>
										<!-- Email -->
										<c:if test="${taiKhoanKhachHang == null}">
											<input type="email" id="checkout_email" class="checkout_input" placeholder="Email" required="required">
										</c:if>
										<c:if test="${taiKhoanKhachHang != null}">
											<input readonly type="email" id="checkout_email" class="checkout_input" placeholder="Email" required="required"
												value="${taiKhoanKhachHang.email}">
										</c:if>
									</div>
									<div>
										<!-- Phone no -->
										<c:if test="${taiKhoanKhachHang == null}">
											<input type="phone" id="checkout_phone" class="checkout_input" placeholder="Số điện thoại" required="required">
										</c:if>
										<c:if test="${taiKhoanKhachHang != null}">
											<input readonly type="phone" id="checkout_phone" class="checkout_input" placeholder="Số điện thoại" required="required"
												value="${taiKhoanKhachHang.dienThoai}">
										</c:if>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- Cart Total -->
					<div class="col-lg-6 cart_col">
						<div class="cart_total">
							<div class="cart_extra_content cart_extra_total">
								<div class="checkout_title">Hình đại diện</div>
								<div class="avatar">
									<img width="300px" height="300px"
										src="img/user-avatar/${taiKhoanKhachHang.hinh}"/>
<!-- 										src="https://store.comicave.com/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/2/7/2715.jpg"/> -->
								</div>
<!-- 								<div onclick="thanhToan();" class="checkout_button trans_200"> -->
<!-- 									<a href="#checkout_form"> -->
<!-- 										Thanh Toán -->
<!-- 									</a> -->
<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Footer -->
		<%@ include file="lock/footer.jsp"%>
	</div>
</div>

<%@ include file="lock/scripts.html"%>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/profile.js"></script>
</body>
</html>